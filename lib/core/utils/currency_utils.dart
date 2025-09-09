class CurrencyUtils {
  static final Map<String, String> _currencyToCountryCode = {
    'USD': 'us',
    'EUR': 'eu',
    'JPY': 'jp',
    'GBP': 'gb',
    'AUD': 'au',
    'CAD': 'ca',
    'CHF': 'ch',
    'CNY': 'cn',
    'SEK': 'se',
    'NZD': 'nz',
    'MXN': 'mx',
    'SGD': 'sg',
    'HKD': 'hk',
    'NOK': 'no',
    'KRW': 'kr',
    'TRY': 'tr',
    'RUB': 'ru',
    'INR': 'in',
    'BRL': 'br',
    'ZAR': 'za',
    // Add more mappings as needed
  };

  static String getFlagUrl(String currencyCode) {
    final countryCode = _currencyToCountryCode[currencyCode.toUpperCase()];
    if (countryCode != null) {
      return 'https://flagcdn.com/w80/$countryCode.png';
    }
    // Fallback for currencies without a direct mapping
    return 'https://flagcdn.com/w80/uno.png'; // A generic flag
  }
}
