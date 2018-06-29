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
              // color: Colors.green,
              padding: const EdgeInsets.only(top: 30.0),
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
              // color: Colors.blue,
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset("assets/Images/mechanics.jpg",height: 330.0,),
            ),

            Container(
              // color: Colors.yellow,
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
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
                            "Buyers are required to contact the sellers",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15.0
                            ),
                          ),
                          Text(
                            "and set up a meeting place for themseleves",
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
            ),

            Container(
              // color: Colors.teal,
              padding: const EdgeInsets.only(top: 40.0,left: 5.0,right: 5.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    
                    Container(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Text(
                          "Seller Info",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 20.0,left: 30.0,bottom: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Text(
                              "Name: Joyal A Johney",
                              style: TextStyle(
                                fontSize: 20.0
                              )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Text(
                              "Semester: 3",
                              style: TextStyle(
                                fontSize: 20.0
                              )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Text(
                              "Branch: Computer Science",
                              style: TextStyle(
                                fontSize: 20.0
                              )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Text(
                              "Mobile No: 9388205225",
                              style: TextStyle(
                                fontSize: 20.0
                              )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Text(
                              "Is on Whatsapp: Yes",
                              style: TextStyle(
                                fontSize: 20.0
                              )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Text(
                              "Email: joyalajohny@gmail.com",
                              style: TextStyle(
                                fontSize: 20.0
                              )
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          child: Icon(Icons.chat),
          onPressed: null,
        ),
        FlatButton(
          child: Icon(Icons.favorite),
          onPressed: null,
        )
      ],
    );
  }
}
