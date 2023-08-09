import 'package:crypto/pages/loading.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:crypto/services/network.dart';

Loading loading = Loading();
String selectedcurrency = currenciesList.first;
late String rate1, rate2, rate3;
var newdata1, newdata2, newdata3 = {};
String url = "https://rest.coinapi.io/v1/exchangerate/";

class PriceScreen extends StatefulWidget {
  PriceScreen({data1, data2, data3});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    super.initState();
    print(data1);
    print(data2);
    print(data3);
    getvalue(data1, data2, data3);
  }

  List<DropdownMenuItem<String>> getdropbutton() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      var newitemdata = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      items.add(newitemdata);
    }
    return items;
  }

  void updateUI(newdata) {
    rate1 = newdata1['rate'].toStringAsFixed(1);
    rate2 = newdata2['rate'].toStringAsFixed(1);
    rate3 = newdata3['rate'].toStringAsFixed(1);
  }

  void getvalue(data1, data2, data3) {
    rate1 = data1['rate'].toStringAsFixed(1);
    rate2 = data2['rate'].toStringAsFixed(1);
    rate3 = data3['rate'].toStringAsFixed(1);
  }

  void getcurrency() async {
    Network network1 = Network("$url${cryptoList[0]}/$selectedcurrency");
    newdata1 = await network1.getdata();
    Network network2 = Network("$url${cryptoList[1]}/$selectedcurrency");
    newdata2 = await network2.getdata();
    Network network3 = Network("$url${cryptoList[2]}/$selectedcurrency");

    newdata3 = await network3.getdata();
    print(newdata1);
    print(newdata2);
    print(newdata3);
    setState(() {
      updateUI(newdata1);
      updateUI(newdata2);
      updateUI(newdata3);
    });
  }

  @override
  Widget build(BuildContext context) {
    // data = data.isNotEmpty
    //     ? data
    //     : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤑 Coin Ticker',
          style: TextStyle(fontSize: 30),
        ),
        leading: Icon(
          Icons.monetization_on_sharp,
          size: 40,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[0]} = $rate1 $selectedcurrency',
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
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[1]} = $rate2 $selectedcurrency',
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
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[2]}= $rate3 $selectedcurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 287,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: const Color.fromRGBO(3, 169, 244, 1),
            child: DropdownButton(
              value: selectedcurrency,
              items: getdropbutton(),
              onChanged: (value) async {
                setState(() {
                  selectedcurrency = value as String;
                  getcurrency();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
