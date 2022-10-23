import 'package:flutter/material.dart';
import '../models/grid.dart';

class grid extends StatefulWidget {
  const grid({
    Key? key,
  }) : super(key: key);

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 120, left: 5, right: 5),
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          ...List.generate(
            9,
            (index) => GridView.count(
              crossAxisCount: 3,
              children: [
                ...List.generate(
                  9,
                  (index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '0',
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
