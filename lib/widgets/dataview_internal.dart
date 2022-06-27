import 'package:flutter/material.dart';
import '../models/models.dart';

class DataviewInternal extends StatelessWidget {
  final Country country;
  const DataviewInternal({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 1,
      mainAxisSpacing: 1,
      childAspectRatio: 10.0,
      crossAxisSpacing: 10,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Country information:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'name: ${country.name}, Area: ${country.area}, Population: ${country.population}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    /*
    return SliverGrid(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 400.0,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 6.0,
  ),
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        alignment: Alignment.centerLeft,
        color: Colors.teal[100 * (index % 9)],
        child: Text('grid item $index'),
      );
    },
    childCount: 2,
  ),
); */
  }
}
