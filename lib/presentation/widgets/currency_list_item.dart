import 'package:currency_converter/core/utils/currency_utils.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyListItem extends StatelessWidget {
  final Currency currency;
  final VoidCallback onTap;

  const CurrencyListItem({super.key, required this.currency, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: 40,
        height: 40,
        child: SvgPicture.network(
          CurrencyUtils.getFlagUrl(currency.code),
          placeholderBuilder: (_) => const CircleAvatar(
            backgroundColor: Colors.grey,
          ),
        ),
      ),
      title: Text(currency.name),
      subtitle: Text(currency.code),
    );
  }
}
