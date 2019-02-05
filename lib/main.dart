// To import material.dart is must to work in flutter because it contains the basic tools to work
// in flutter
import 'package:flutter/material.dart';

// Delete all the Code frist Clean main.dart to code our first dailog box example in flutter.
// Creating a void main methid for running our flutter app.

void main(){
  runApp(new MaterialApp( //This is a material app thats why we are returning a materail app
      home: MyApp(),
  ));
}

// declaring enumenator options for out dailogbox options
/*
  You should always use enums when a variable (especially a method parameter) can only take one
  out of a small set of possible values. Examples would be things like type constants (contract
  status: "permanent", "temp", "apprentice"), or flags ("execute now", "defer execution").

  If you use enums instead of integers (or String codes), you increase compile-time checking
  and avoid errors from passing in invalid constants, and you document which values are legal
  to use.

  BTW, overuse of enums might mean that your methods do too much (it's often better to have 
  several separate methods, rather than one method that takes several flags which modify what
  it does), but if you have to use flags or type codes, enums are the way to go.
*/
enum MyDialogAction{
   yes,
   no,
   maybe
}

class MyApp extends StatefulWidget {
  
  /* for more about stateful and stateless widget visit flutter basics on flutter official site */
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp>{

  String _text = '';

  // Method no 1
  void _onChange(String value){
      setState(() {
       _text = value; 
      });
  }

  // Method no 2
  void _dialogResult(MyDialogAction value){
      print('You selected $value');
      Navigator.pop(context);
  }

  // Method no 3
  void _showAlert(String value){
      if(value.isEmpty)
      return;

      AlertDialog dialog = new AlertDialog(
        content: new Text(value ,
          style: new TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[
          /* These buttons are the dailog box buttons will be appear in the dailog box to show the
            the options to select for seing the output result whether its working or not open android
            studio monitor or in VsCode see the Debug console to see the changes when options are 
            selected in the application Shortcut for terminal or debug console in vscode is ctrl+shift+`
          */
          new FlatButton(
            onPressed: (){
              _dialogResult(MyDialogAction.yes);
            }, 
            child: new Text(
              // this will appear as an option in the dailog box
              'Yes'
              ) 
            ),
            new FlatButton(
            onPressed: (){
              _dialogResult(MyDialogAction.no);
            }, 
            child: new Text(
              // this will appear as an option in the dailog box
              'no'
              ) 
            ),
            new FlatButton(
            onPressed: (){
              _dialogResult(MyDialogAction.maybe);
            }, 
            child: new Text(
              // this will appear as an option in the dailog box
              'maybe'
              ) 
            ),
        ],
      );
      
      // Context of the dailog box is the same as the application context
      showDialog(context: context, builder: (BuildContext context) => dialog);
  }
   
   Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          // The appbar will appear at the top of the screen 
          title: new Text(' Dialog Box Demo'),
        ),
        body: new Container( // this is the main body
          child: new Center( // a child of a widget will be appear in center 
            child: new Column(
              children: <Widget>[
                // Text field which will pass the value to the dailog box
                new TextField(onChanged:(String value){
                  _onChange(value);
                },),
                new RaisedButton(
                  onPressed: (){
                    // on pressing button this method will be invoke to show a dailog box
                     _showAlert(_text);
                  },
                  //Below text is the button text which will appear in the button 
                  child: new Text('Alert Dialog'),
                  ),
              ],
            ),
          ),
        ),
    );
   }
}