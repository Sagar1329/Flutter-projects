import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropdownvalue = "RS";
  var price4 = "Fuck";
  String price1 = " ";
  String dropvalue = "You";
  String ans1 = "FUCK";
  String ans2 = "ME";
  String ans3 = "FUCK";
  String ans4 = "ME";

  Future<List<String>> getData(String drop) async {
    drop = drop.toLowerCase();
    Response response = await get(Uri.parse(
        "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=$drop"));
    Response response2 = await get(Uri.parse(
        "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=$drop"));
    Response response3 = await get(Uri.parse(
        "https://api.coingecko.com/api/v3/simple/price?ids=Tether&vs_currencies=$drop"));
    String data = response.body;
    String data2 = response2.body;
    String data3 = response3.body;
    print(data);
    print("HERE");
    print(jsonDecode(data)['bitcoin']);
    print(jsonDecode(data2)['ethereum']);
    print(jsonDecode(data3)['tether']);
    print("hello");
    var price = jsonDecode(data)['bitcoin']['$drop'];
    var price2 = jsonDecode(data2)['ethereum']['$drop'];
    var price3 = jsonDecode(data3)['tether']['$drop'];
    print(price);
    print("TO HERE");

    String curencyName = drop.toUpperCase();
    String currencyValue1 = price.toStringAsFixed(2);
    String currencyValue2 = price2.toStringAsFixed(2);
    String currencyValue3 = price3.toStringAsFixed(2);
    List<String> myList = [
      curencyName,
      currencyValue1,
      currencyValue2,
      currencyValue3
    ];
    return myList;
  }

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> dropdownItem = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropdownItem.add(newItem);
    }
    return DropdownButton<String>(
      value: dropdownvalue,
      items: dropdownItem,
      onChanged: (newvalue) async {
        await getData(newvalue.toString()).then((value) {
          ans1 = value[0];
          ans2 = value[1];
          ans3 = value[2];
          ans4 = value[3];
        });
        setState(() {
          print("FUCK");
          dropdownvalue = ans1;
          dropvalue = ans1;
          price4 = ans2;

          print("YOU");
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  Widget getPicker() {
    if (Platform.isAndroid) {
      return androidPicker();
    } else {
      return iosPicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  '1 BTC = $price4 $dropvalue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  '1 ETH = $ans3 $dropvalue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  '1 TETH = $ans4 $dropvalue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 120.0),
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
