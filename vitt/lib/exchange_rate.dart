class ExchangeRate{
  String fromCurrencyCode;
  String fromCurrencyName;
  String toCurrencyCode;
  String toCurrencyName;
  String exchangeRate;
  String lastRefreshed;
  String timeZone;

  ExchangeRate({this.fromCurrencyCode, this.fromCurrencyName, this.toCurrencyCode, this.toCurrencyName,
    this.exchangeRate, this.lastRefreshed, this.timeZone});

  factory ExchangeRate.fromJson(Map<String, dynamic> json){
    return ExchangeRate(
        fromCurrencyCode: json['Realtime Currency Exchange Rate']['1. From_Currency Code'],
        fromCurrencyName: json['Realtime Currency Exchange Rate']['2. From_Currency Name'],
        toCurrencyCode: json['Realtime Currency Exchange Rate']['3. To_Currency Code'],
        toCurrencyName: json['Realtime Currency Exchange Rate']['4. To_Currency Name'],
        exchangeRate: json['Realtime Currency Exchange Rate']['5. Exchange Rate'],
        lastRefreshed: json['Realtime Currency Exchange Rate']['6. Last Refreshed'],
        timeZone: json['Realtime Currency Exchange Rate']['7. Time Zone']
    );
  }
}