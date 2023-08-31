import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String imageurl,name,price,description;

  ImagePage({required Key key, required this.imageurl, required this.name, required this.price,required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Column(
       children: [
         Container(
           height: 200,
           width: 150,
           child: Image.network(imageurl),
           alignment: Alignment.center,
         ),
      Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
            Text(price,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
            Text(description),
          ],
        ),
      ),
         Text("gallery",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
         Container(
           height: 100,
           width: 100,
           child: Image.network(imageurl),
         ),
         Text("Size",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.right),
         Row(
           children: [
             SizedBox(width: 10,),
             TextButton(onPressed: () {}, child: Text('38',style: TextStyle(backgroundColor: Colors.black12)),autofocus: true),SizedBox(width: 10,),
             TextButton(onPressed: () {}, child: Text('40')),SizedBox(width: 10,),
             TextButton(onPressed: () {}, child: Text('42')),SizedBox(width: 10,),
             TextButton(onPressed: () {}, child: Text('43')),SizedBox(width: 10,),
           ],
         )
       ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showDialog(context);

          }, label:Text(" Add to Cart "),
        icon: Icon(Icons.card_travel),

      ),

    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(name),
          content: new Text("Your Total Price : "+price),
          actions: <Widget>[
            new TextButton(
              child: new Text(" Cancel "),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}