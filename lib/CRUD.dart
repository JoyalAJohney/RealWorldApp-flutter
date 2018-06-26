import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';



class CrudOperation extends StatefulWidget {
  @override
  _CrudOperationState createState() => _CrudOperationState();
}

class _CrudOperationState extends State<CrudOperation> {

  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      item = Item("","");
      final FirebaseDatabase database = FirebaseDatabase.instance;
      itemRef = database.reference().child("items");
      itemRef.onChildAdded.listen(_onEntryAdded);
      itemRef.onChildChanged.listen(_onEntryChanged);
    }

    _onEntryAdded(Event event){
      setState(() {
        items.add(Item.fromSnapshot(event.snapshot));        
      });
    }

    _onEntryChanged(Event event){
      var old = items.singleWhere((entry){
        return entry.key == event.snapshot.key;
      });
      setState(() {
        items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);       
      });
    }

    void handleSubmit(){
      final FormState form = formkey.currentState;
      if(form.validate()){
        form.save();
        form.reset();
        itemRef.push().set(item.toJson());
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud Operations"),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(
                key: formkey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => item.title = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => item.body = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: (){
                        handleSubmit();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: itemRef,
              itemBuilder: (BuildContext context,DataSnapshot snapshot,
              Animation<double> animation, int index){
                return ListTile(
                  leading: Icon(Icons.message),
                  title: Text(items[index].title),
                  subtitle: Text(items[index].body),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}


class Item{
  String key;
  String title;
  String body;

  Item(this.title,this.body);

  Item.fromSnapshot(DataSnapshot snapshot){
    key = snapshot.key;
    title = snapshot.value["title"];
    body = snapshot.value["body"];
  }      

  toJson(){
    return{
      "title" : title,
      "body"  : body,
    };  
  }

}