import 'package:apitask/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TodoApp",
      theme: ThemeData(primarySwatch: Colors.green),
      home: ToDoPage(),
    );
  }
}
class ToDoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return ToDoPageView();

  }
}

class ToDoPageView extends State<ToDoPage> {

  List ToDolist = [];
  String item="";


  MyInputOnChange(content){
    setState(() {
      item = content;
      // ToDolist.add({"item": content});
    });

  }
  Additem(){
    setState(() {
      ToDolist.add({"item": item});
    });
  }
  RemoveItem(index){
    setState(() {
      ToDolist.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo'),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex:70,
                        child: TextFormField(onChanged: (content){MyInputOnChange(content);}, decoration: AppInputStyleToDo("Add item"),)),
                    Expanded(
                        flex: 20,
                        child: Padding(padding: EdgeInsets.only(left: 5),child: ElevatedButton(onPressed: (){Additem();},child: Text('Add'),style: AppButtonStyleToDo(),),),)
                  ],
                    
                  )
                ),
            Expanded(
                flex: 90,
                child: ListView.builder(
                  itemCount: ToDolist.length,
                    itemBuilder: (context,index){
                    return Card(

                      child: SizeBox50(
                        Row(
                          children: [
                            Expanded(flex: 80,child: Text(ToDolist[index]['item'].toString()),),
                            Expanded(flex: 20,child: TextButton(onPressed: (){RemoveItem(index);},child: Icon(Icons.delete),),)
                          ],
                        )
                      ),
                    );
                    }

                )
            )
          ],
        ),
      ),
    );
  }
}
