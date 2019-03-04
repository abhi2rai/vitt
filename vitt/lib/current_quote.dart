class CurrentQuote{
  String symbol;
  String open;
  String high;
  String low;
  String price;
  String volume;
  String latestTradingDay;
  String previousClose;
  String change;
  String changePercent;

  CurrentQuote({this.symbol, this.open, this.high, this.low, this.price,
    this.volume, this.latestTradingDay, this.previousClose, this.change,
    this.changePercent});

  factory CurrentQuote.fromJson(Map<String, dynamic> json){
    return CurrentQuote(
      symbol: json['Global Quote']['01. symbol'],
      open: json['Global Quote']['02. open'],
      high: json['Global Quote']['03. high'],
      low: json['Global Quote']['04. low'],
      price: json['Global Quote']['05. price'],
      volume: json['Global Quote']['06. volume'],
      latestTradingDay: json['Global Quote']['07. latest trading day'],
      previousClose: json['Global Quote']['08. previous close'],
      change: json['Global Quote']['09. change'],
      changePercent: json['Global Quote']['10. change percent']
    );
  }
}