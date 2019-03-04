import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'exchange_rate.dart';

class ExchangeView extends StatelessWidget{
  ExchangeView();

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new FutureBuilder<ExchangeRate>(
          future: getCurrentExchangeRate(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Table(
                    key: UniqueKey(),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left:100.0),
                                child: Text(snapshot.data.fromCurrencyCode, style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:100.0),
                                child: Text("1", style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.normal)),
                              )
                            ],
                          )
                        )
                      ]),
                      TableRow(children: [
                        TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left:100.0),
                                  child: Text(snapshot.data.toCurrencyCode, style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:100.0),
                                  child: Text(snapshot.data.exchangeRate, style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.normal)),
                                )
                              ],
                            )
                        )
                      ])
                    ],
                  ),
              );
            }
            return new Center(
              child: new CircularProgressIndicator()
            );
          },
        )
    );
  }

  Future <ExchangeRate> getCurrentExchangeRate() async {
    final response = await http.get('https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency=JPY&apikey=demo');
    print(response.body);
    return ExchangeRate.fromJson(json.decode(response.body));
  }
}