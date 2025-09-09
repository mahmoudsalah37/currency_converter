import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/core/di/injection.dart';
import 'package:currency_converter/presentation/bloc/currency_list/currency_list_bloc.dart';
import 'package:currency_converter/presentation/bloc/currency_list/currency_list_event.dart';
import 'package:currency_converter/presentation/bloc/currency_list/currency_list_state.dart';
import 'package:currency_converter/presentation/widgets/currency_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class CurrencyListScreen extends StatelessWidget {
  const CurrencyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CurrencyListBloc>()..add(const LoadCurrencies()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select Currency'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) {
                  context.read<CurrencyListBloc>().add(SearchCurrency(query));
                },
                decoration: const InputDecoration(
                  hintText: 'Search currency...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CurrencyListBloc, CurrencyListState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => const ListTile(
                          leading: CircleAvatar(),
                          title: Text(''),
                          subtitle: Text(''),
                        ),
                      ),
                    );
                  }
                  if (state.error != null) {
                    return Center(child: Text(state.error!));
                  }
                  return ListView.builder(
                    itemCount: state.filteredCurrencies.length,
                    itemBuilder: (context, index) {
                      final currency = state.filteredCurrencies[index];
                      return CurrencyListItem(
                        currency: currency,
                        onTap: () => context.router.maybePop(currency),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
