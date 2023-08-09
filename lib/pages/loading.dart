import 'package:crypto/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:crypto/coin_data.dart';
import 'package:crypto/services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var data1, data2, data3 = {};

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    functionget();
  }

  void functionget() async {
    Network network1 =
        Network("https://rest.coinapi.io/v1/exchangerate/${cryptoList[0]}/USD");
    data1 = await network1.getdata();
    Network network2 =
        Network("https://rest.coinapi.io/v1/exchangerate/${cryptoList[1]}/USD");
    data2 = await network2.getdata();
    Network network3 =
        Network("https://rest.coinapi.io/v1/exchangerate/${cryptoList[2]}/USD");
    data3 = await network3.getdata();
    Navigator.push(context as BuildContext,
        MaterialPageRoute(builder: (context) {
      return PriceScreen(data1: data1, data2: data2, data3: data3);
    }));

    // Navigator.pushNamed(context, '/first', arguments: data);

    // throw (e);
    // if (data1 == null && data2 == null && data3 == null) {
    //   Navigator.push(context as BuildContext,
    //       MaterialPageRoute(builder: (context) {
    //     return PriceScreen(data1: null, data2: null, data3: null);
    //   }));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
