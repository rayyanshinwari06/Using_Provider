import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/numbersList_provider.dart';

class Secondpage extends StatefulWidget {
  final List<int> numberslist;

  const Secondpage({super.key, required this.numberslist});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberslistProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Provider example'),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            print('tapped-------->');

            value.addnumbers();
          },
          child: Container(
            height: 70,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Text(
              value.numberslist.last.toString(),
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.numberslist.length,
                  itemBuilder: (context, Index) {
                    return Text(
                      value.numberslist[Index].toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
