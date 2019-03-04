import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'current_quote.dart';

class CurrentQuoteView extends StatelessWidget{
  CurrentQuoteView();

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new FutureBuilder<CurrentQuote>(
          future: getCurrentQuote(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Container(
                  key: UniqueKey(),
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(snapshot.data.symbol, style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                      Text(snapshot.data.price, style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.normal))
                    ],
                  )
              );
            }
            return new Center(
                child: new CircularProgressIndicator()
            );
          },
        )
    );
  }

  Future <CurrentQuote> getCurrentQuote() async {
    final response = await http.get('https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=MSFT&apikey=demo');
    print(response.body);
    return CurrentQuote.fromJson(json.decode(response.body));
  }
}