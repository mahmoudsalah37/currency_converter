import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/core/di/injection.dart';
import 'package:currency_converter/core/router/app_router.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/presentation/bloc/converter/converter_bloc.dart';
import 'package:currency_converter/presentation/bloc/converter/converter_event.dart';
import 'package:currency_converter/presentation/bloc/converter/converter_state.dart';
import 'package:currency_converter/presentation/widgets/currency_selector_widget.dart';
import 'package:currency_converter/presentation/widgets/glassmorphism_container.dart';
import 'package:currency_converter/presentation/widgets/historical_chart.dart';
import 'package:currency_converter/presentation/widgets/swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

@RoutePage()
class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ConverterBloc>(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6E52A6), Color(0xFF4A90E2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BlocConsumer<ConverterBloc, ConverterState>(
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error!)),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlassmorphismContainer(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              CurrencySelectorWidget(
                                label: 'From',
                                currency: state.fromCurrency,
                                onTap: () async {
                                  final selected = await context.router.push(const CurrencyListRoute());
                                  if (selected is Currency) {
                                    context.read<ConverterBloc>().add(FromCurrencyChanged(selected));
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onChanged: (amount) => context.read<ConverterBloc>().add(AmountChanged(amount)),
                                      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                      decoration: const InputDecoration(
                                        hintText: '0.00',
                                        hintStyle: TextStyle(color: Colors.white54),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SwapButton(
                                    onTap: () => context.read<ConverterBloc>().add(const SwapCurrencies()),
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.white24),
                              CurrencySelectorWidget(
                                label: 'To',
                                currency: state.toCurrency,
                                onTap: () async {
                                  final selected = await context.router.push(const CurrencyListRoute());
                                  if (selected is Currency) {
                                    context.read<ConverterBloc>().add(ToCurrencyChanged(selected));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (state.isLoading)
                        const CircularProgressIndicator(color: Colors.white)
                      else
                        Text(
                          state.convertedAmount.toStringAsFixed(2),
                          style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                        ).animate().fadeIn(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ConverterBloc>().add(const FetchRate());
                          context.read<ConverterBloc>().add(const FetchHistoricalData());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          foregroundColor: const Color(0xFF4A90E2),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text('Convert', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: GlassmorphismContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: HistoricalChart(data: state.historicalData),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
