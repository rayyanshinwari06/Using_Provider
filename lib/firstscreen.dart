import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/numbersList_provider.dart';
import 'package:provider_task/secondpage.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
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
            Expanded(
              child: ListView.builder(
                  itemCount: value.numberslist.length,
                  itemBuilder: (context, Index) {
                    return Text(
                      value.numberslist[Index].toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Secondpage(numberslist: value.numberslist)));
                },
                child: Text('Next page'))
          ],
        ),
      );
    });
  }
}
