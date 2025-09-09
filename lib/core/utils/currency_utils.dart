class CurrencyUtils {
  static String _getCountryCode(String currencyCode) {
    // Convert currency code to lowercase country code
    // Most currency codes are based on ISO 4217 and can be converted to ISO 3166-1 alpha-2 country codes
    String code = currencyCode.toUpperCase();

    // Special cases first (e.g., EUR)
    if (code == 'EUR') return 'eu';

    // For most currencies, the first two letters correspond to the country code
    // We'll make it lowercase as flagcdn uses lowercase country codes
    return code.substring(0, 2).toLowerCase();
  }

  static String getFlagUrl(String currencyCode) {
    final countryCode = _getCountryCode(currencyCode);
    return 'https://flagcdn.com/w80/$countryCode.png';
  }
}
