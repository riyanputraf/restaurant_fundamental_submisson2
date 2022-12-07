import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restaurant/ui/restaurant_list.dart';
import '../data/model/restaurant.dart';

class HomePage extends StatefulWidget {
  static const routename = '/homepage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Restaurant>> getJson() async {
    final asset = DefaultAssetBundle.of(context);
    final data = await asset.loadString('assets/local_restaurant.json');
    final body = await json.decode(data);
    final list = body['restaurants'] as List<dynamic>;
    var restaurant = list.map((e) => Restaurant.fromJson(e)).toList();
    return restaurant;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data as List<Restaurant>;
              return RestaurantList(data: data);
            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}


