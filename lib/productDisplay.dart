import 'package:flutter/material.dart';

class ProductDisplay extends StatefulWidget {
  @override
  _ProductDisplayState createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Display"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Column(
                 children: <Widget>[
                   Text(
                     "Engineering Mechaincs",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0
                     ),
                   ),
                   Container(
                     padding: const EdgeInsets.only(top: 5.0),
                     child: Text(
                       "J.Benjamin",
                       style: TextStyle(
                         color: Colors.grey[500],
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0
                       ),
                     ),
                   )
                  ],
                ),
              )
            ),

            Container(
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset("assets/Images/mechanics.jpg",height: 330.0,),
            ),

            Container(
              padding: const EdgeInsets.only(top: 25.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Rs.180",
                      style: TextStyle(
                        color: Colors.green[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Buyers are required to arrange a meeting place",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15.0
                            ),
                          ),
                          Text(
                            "for themselves to exchange Money and Textbooks",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15.0
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
