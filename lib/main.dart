import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listview/routes/Second.dart';
import 'package:listview/routes/routes.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
    );
  }
} // ends MyApp class

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
} // end Home class

class _HomeState extends State<Home> {
  List<String> entries = [
    'List 1',
    'List 2',
    'List 3',
    'List 4',
    'List 5',
    'List 6',
    'List 7',
    'List 8',
  ];
  List<int> colorCodes = [100, 200, 300, 400, 500, 600, 700, 800];
  var myKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text('ListView'),
        actions: [
          IconButton(
            icon: Icon(Icons.open_in_new) ,
            onPressed: (){
              Navigator.pushNamed(context, '/second');
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(50, (index) {
          return Container(
            color: Colors.red[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton.icon(
                    onPressed: (){
                     /* Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Second()));*/
                     Navigator.pushNamed(context, '/second');

                    },
                      icon: Icon(Icons.directions_bus),
                      label: Text('item'),),
              //Icon(
//                    Icons.directions_car,
//                    size: 50,
                 // ),
                  Text(
                    'Item $index',
                  ),
                  RaisedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return FancyDialog(
                            title: 'Dont forget',
                            descreption: ' please subscribe our youtube channel and share it ',
                            animationType: FancyAnimation.TOP_BOTTOM,
                            gifPath: FancyGif.FUNNY_MAN,
                            //theme: FancyTheme.FLAT,
                          );
                            /*
                            AlertDialog(
                            title: Text(' Deleting !!!'),
                            content: Container(
                              height: 120,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.directions_car,
                                    size: 100,
                                    color: Colors.blue,
                                  ),
                                  Text(' Are u sure you will delete it ? '),
                                ],
                              ),
                            ),
                            actions: [
                              FlatButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                          */
                        },
                      );
                      /* myKey.currentState.showSnackBar(SnackBar(
                          content: Text(' Hi $index') , duration: Duration(milliseconds: 500),));*/
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    child: Icon(
                      Icons.attachment,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            title: 'To continue',
                            description: 'please dont forget to share our channel and leave comments ',
                            buttonName: 'okay',

                          );
                          /*
                            Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ) ,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Icon(Icons.directions_car , size: 100,) ,
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter the car name',
                                      ),
                                    ),
                                    FlatButton(
                                      child: Text('Close' ),
                                      onPressed: ()=>{Navigator.of(context).pop()},
                                      color: Colors.blue,

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                          */
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),

      /*ListView.custom(
          childrenDelegate: SliverChildListDelegate(
            List.generate(100, (index) {
              return Container(
                height: 200,
                color: Colors.orange,
                margin: EdgeInsets.only(bottom: 5),
                child: Center(
                  child: ListTile(
                    onTap: (){
                      myKey.currentState.showSnackBar(SnackBar(
                        content: Text(' Hi $index') , duration: Duration(milliseconds: 500),));
                    },
                    leading: Icon(Icons.directions_car , color:Colors.white, size: 50,),
                    title: Text('car $index' , style: TextStyle(fontSize: 18),),
                    trailing: Icon(Icons.more),
                  ),
                ),
              ) ;
            }),
          ),
      ),*/
    ); // Scaffold
  }
}

class Consts{
  static const double padding = 16.0 ;
  static const double avatarRaduis = 66.0 ;
  Consts._();
}
class CustomDialog extends StatelessWidget {
  final String title , description , buttonName ;
  final int image ;

  CustomDialog({this.title, this.description, this.buttonName, this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.avatarRaduis),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  } // end build method

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRaduis + Consts.padding ,
            bottom: Consts.padding ,
            right: Consts.padding ,
            left: Consts.padding
          ),
          margin: EdgeInsets.only(
              top: Consts.avatarRaduis
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle ,
            borderRadius: BorderRadius.circular(Consts.padding) ,
            color: Colors.white ,
            boxShadow: [
              BoxShadow(color: Colors.black , blurRadius: 10 , offset: Offset(0 , 10)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w700),) ,
              SizedBox(height: Consts.padding,) ,
              Text(description ,textAlign: TextAlign.center , style: TextStyle(fontSize: 16 , ),) ,
              SizedBox(height: 24,),
              Align(
                alignment: Alignment.bottomRight ,
                child:FlatButton(
                  child: Text(buttonName),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ) ,
              ) ,
            ],
          ),
        ),
        Positioned(
          right: Consts.padding , left: Consts.padding,
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: Consts.avatarRaduis,
        ),)
      ],
    );
  } // end dialogContent() method
} // end CustomDialog class

/*ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            margin: EdgeInsets.only(bottom: 5.0),
            color: Colors.red[colorCodes[index]],
            child: Center(child: Text(entries[index])),
          );
        },
      ), */
// end _HomeState
