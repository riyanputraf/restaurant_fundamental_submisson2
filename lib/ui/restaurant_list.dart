import 'package:flutter/material.dart';
import 'package:restaurant/ui/restaurant_detail.dart';
import '../data/model/restaurant.dart';

class RestaurantList extends StatelessWidget {
  RestaurantList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Restaurant> data;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // header restaurant page
          header(),

          // body restaurant page
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // item restaurant
                  return itemRestaurant(context, index);
                }),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      height: 190,
      padding: const EdgeInsets.only(left: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        color: Colors.blue,
      ),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Restaurant',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Pasti Hemat dan Murah',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: TextField(
              controller: _controller,
              style: TextStyle(
                color: Colors.blue[900],
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.blue[900]),
                  hintText: "Search.......",
                  hintStyle: TextStyle(color: Colors.blue[900])),
              onChanged: (String text) {
                // coming soon
              },
            ),
          )
        ],
      ),
    );
  }

  Widget itemRestaurant(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetail.routeName,
            arguments: data[index]);
      },
      child: Card(
        elevation: 0.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Row(children: [
          Hero(
            tag: data[index].pictureId,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              width: 150,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.network(data[index].pictureId),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    data[index].name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                    ),
                    Text(
                      data[index].city,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      data[index].rating.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
