import 'package:currency_converter/core/utils/currency_utils.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class CurrencyListItem extends StatelessWidget {
  final Currency currency;
  final VoidCallback onTap;

  const CurrencyListItem(
      {super.key, required this.currency, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: 40,
        height: 40,
        child: ClipOval(
          child: Image.network(
            CurrencyUtils.getFlagUrl(currency.code),
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircleAvatar(
                backgroundColor: Colors.grey,
              );
            },
            errorBuilder: (context, error, stackTrace) => const CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      ),
      title: Text(currency.name),
      subtitle: Text(currency.code),
    );
  }
}
