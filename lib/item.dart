import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app_project/log.dart';
import 'package:food_app_project/puma.dart';
import 'package:food_app_project/secondscreen.dart';
import 'package:http/http.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

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
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('Store Location',style: TextStyle(fontSize: 12,color: Colors.black38),textAlign: TextAlign.center),
              subtitle: Text("Mondolibug,Sylhet",style: TextStyle(fontSize: 14),textAlign: TextAlign.center),
              leading: IconButton(onPressed: () {
              }, icon: Icon(Icons.dataset)),
              trailing: IconButton(onPressed: () {
              }, icon: Icon(Icons.card_travel_sharp)),
            ),
            SearchBar(
              leading: Icon(Icons.search_rounded),
              hintText: 'Looking for shoes',
            ),
          
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 3,),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Puma(),));
                }, child: Text("Nike")), SizedBox(width: 3,),
                ElevatedButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Puma(),));
    }, child: Text("Puma"),),SizedBox(width: 3,),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Puma(),));
                }, child: Text("Adidas")),SizedBox(width: 3,),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Puma(),));
                }, child: Text("Reebok")),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(" Popular Shoes"),
                SizedBox(width: 210,),
                TextButton(onPressed: () {

                }, child: Text("See All",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 5,),
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
                                  Text("Best Seller",style: TextStyle(color: Colors.blue),),
                                  SizedBox(height: 5),
                                  Text(posts[index]['name']),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(posts[index]['price']),
                                      SizedBox(width: 68,),
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
                      Text(" New arrivals"),
                      SizedBox(width: 210,),
                      TextButton(onPressed: () {
                        //
                      }, child: Text("See All", style: TextStyle(fontWeight: FontWeight.bold))),
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
                              width: 290,
                              child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ImagePage(imageurl: posts[index]['imageurl'],
                                            key: UniqueKey(), name: posts[index]['name'],
                                            price:  posts[index]['price'], description: posts[index]['description'],),
                                        ),
                                      );
                                    },
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
                                       Text(posts[index]['price']),
                                     ],
                                      ),
                                      SizedBox(width: 20,),
                                      Container(
                                        height: 120,
                                        width: 130,
                                        child: Image.network(posts[index]['imageurl']),
                                      ),
                                    ],
                                  ),
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
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.indigo[900],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Hey,👋"),
                accountEmail: Text("Riad Rayhan"),
                currentAccountPicture: CircleAvatar(child: CircleAvatar(backgroundImage: NetworkImage("https://e0.pxfuel.com/wallpapers/862/601/desktop-wallpaper-mahesh-babu-head-mahi-rishi-superstar-svp-mahesha.jpg"),)),
              ),
              ListTile(
                leading: Icon(Icons.man,color: Colors.white,), title: Text("profile",style: TextStyle(color: Colors.white),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.home,color: Colors.white), title: Text("Home page",style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.card_travel_outlined,color: Colors.white), title: Text("My Cart",style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border,color: Colors.white), title: Text("Favourites",style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.bookmark_border,color: Colors.white), title: Text("Orders",style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.notification_add,color: Colors.white), title: Text("Notification",style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(height: 2,color: Colors.white),
              ListTile(
                leading: Icon(Icons.login,color: Colors.white), title: Text("Sign Out",style: TextStyle(color: Colors.white)),
                onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen(),));
                },
              ),
            ],
          ),
        ),
    );
  }
}

