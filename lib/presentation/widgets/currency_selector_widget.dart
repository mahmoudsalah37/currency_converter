import 'package:currency_converter/core/utils/currency_utils.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class CurrencySelectorWidget extends StatelessWidget {
  final Currency currency;
  final String label;
  final VoidCallback onTap;

  const CurrencySelectorWidget({
    super.key,
    required this.currency,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
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
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currency.name,
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(currency.code, style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
