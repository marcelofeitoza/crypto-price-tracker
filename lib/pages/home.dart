import 'package:cryptopricetracker/services/index.dart';
import 'package:flutter/material.dart';

import 'package:cryptopricetracker/components/coinModel.dart';

import 'package:cryptopricetracker/components/coinCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getData() async {
    coinList = await fetchCoin();

    setState(() {
      coinList;
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Crypto Price Tracker',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: coinList.isNotEmpty
            ?
            // RefreshIndicator(
            //     onRefresh: print("Teste"),
            //     child:
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: coinList.length,
                itemBuilder: (context, index) {
                  return CoinCard(
                      name: coinList[index].name,
                      symbol: coinList[index].symbol,
                      imageUrl: coinList[index].imageUrl,
                      price: coinList[index].price.toDouble(),
                      change: coinList[index].change.toDouble(),
                      changePercentage:
                          coinList[index].changePercentage.toDouble());
                },
              )
            // )
            : Center(
                child: Column(children: const [
                  Text("Crunching data..."),
                  CircularProgressIndicator()
                ]),
              ));
  }
}
