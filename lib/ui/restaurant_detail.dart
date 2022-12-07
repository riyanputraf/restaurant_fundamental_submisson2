import 'package:flutter/material.dart';

import '../data/model/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/detail';

  final Restaurant restaurant;

  const RestaurantDetail({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            header(),

            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                restaurant.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text('Foods',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                            restaurant.menus.foods[index].name.toString())),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 5,
                  );
                },
                itemCount: restaurant.menus.foods.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text('Drinks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                            restaurant.menus.drinks[index].name.toString())),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                  );
                },
                itemCount: restaurant.menus.drinks.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Hero(
            tag: restaurant.pictureId,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.hardEdge,
                child: Image.network(restaurant.pictureId))),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(restaurant.name,
              style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.red,
              ),
              const SizedBox(width: 3),
              Text(
                restaurant.city,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const SizedBox(width: 3),
              Text(
                restaurant.rating.toString(),
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
