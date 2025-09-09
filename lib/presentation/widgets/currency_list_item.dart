import 'package:cached_network_image/cached_network_image.dart';
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
          child: CachedNetworkImage(
            imageUrl: CurrencyUtils.getFlagUrl(currency.code),
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            errorWidget: (context, url, error) => const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.error, color: Colors.white),
            ),
          ),
        ),
      ),
      title: Text(currency.name),
      subtitle: Text(currency.code),
    );
  }
}
