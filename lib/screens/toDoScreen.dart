import 'package:To_Do_List/models/item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoScreen extends StatefulWidget {
  var items = new List<Item>();
  ToDoScreen() {
    items = [];
    //items.add(new Item("Teste",false));
  }

  @override
  State createState() {
    return ToDoScreenState();
  }
}

class ToDoScreenState extends State<ToDoScreen> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 40, 10, 10), //recuo interno
          child: Column(
            children: <Widget>[
              Card(
                elevation: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: <Widget>[
                        FlutterLogo(
                          size: 30,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: taskController,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87),
                                decoration: InputDecoration(
                                  hintText: "Digite a nova tarefa",
                                  hintStyle: TextStyle(fontSize: 15),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return "Task field is required";
                                  }
                                  return null;
                                },
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  widget.items.add(
                                      new Item(taskController.text, false));
                                });
                                taskController.clear();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        Item item = widget.items[index];
                        return Container(
                          height: 50,
                          //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Card(
                            elevation: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: Container(
                                //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Text(item.title),
                                    padding: EdgeInsets.only(left: 25),
                                  ),
                                ),
                                Container(
                                  //padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                  child: IconButton(
                                    icon: Icon(Icons.check),
                                    onPressed: () {
                                      setState(() {
                                        widget.items.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )),
                          ),
                        );
                      },
                      itemCount: widget.items.length))
            ],
          )),
    );
  }
}
