import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Puma extends StatefulWidget {
  const Puma({super.key});

  @override
  State<Puma> createState() => _PumaState();
}

class _PumaState extends State<Puma> {
  List<dynamic>posts=[];

  Future<void> downloadJSON() async {
    final jsonEndpoint =
        "https://raw.githubusercontent.com/riadrayhan/shoe_project/main/shoes";

    final response = await get(Uri.parse(jsonEndpoint));
    if (response.statusCode == 200) {
      setState(() {
        posts=json.decode(response.body);
      });
    } else
      throw Exception('We were not able to successfully download the json data.');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadJSON();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Puma"),
      ),
      body: Column(
        children: [
          // Row(
          //   children: [
          //     ElevatedButton(onPressed: () => , child: Text("Nike")),
          //     ElevatedButton(onPressed: () => , child: Text("Nike")),
          //     ElevatedButton(onPressed: () => , child: Text("Nike")),
          //     ElevatedButton(onPressed: () => , child: Text("Nike")),
          //   ],
          // ),
          Row(
            children: [
              Text("Popular Shoes"),
              TextButton(onPressed: () {

              }, child: Text("See All"))
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(posts.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 200,
                      width: 140,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(posts[index]['imageurl']),
                            ),
                            SizedBox(height: 10),
                            Text("Best Seller"),
                            SizedBox(height: 5),
                            Text(posts[index]['name']),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(posts[index]['propellant']),
                                SizedBox(width: 30,),
                                Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          //==============first part end=====//
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("New arrivals"),
                    TextButton(onPressed: () {
                      //
                    }, child: Text("See All")),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(posts.length, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 130,
                            width: 270,
                            child: Card(
                              elevation: 10,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Text("Best Seller"),
                                      SizedBox(height: 5),
                                      Text(posts[index]['name']),
                                      SizedBox(height: 5),
                                      Text(posts[index]['propellant']),
                                    ],
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    height: 120,
                                    width: 100,
                                    child: Image.network(posts[index]['imageurl']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
