class CurrencyUtils {
  static String _getCountryCode(String currencyCode) {
    String code = currencyCode.toUpperCase();

    if (code == 'EUR') return 'eu';

    return code.substring(0, 2).toLowerCase();
  }

  static String getFlagUrl(String currencyCode) {
    final countryCode = _getCountryCode(currencyCode);
    return 'https://flagcdn.com/w80/$countryCode.png';
  }
}
