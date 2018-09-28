import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1e2629),
        title: Text('Interactive Story'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/main_title.png',
            fit: BoxFit.cover,
          ),
          Builder(
            builder:(BuildContext context) {
              askName() async {
                String name = await showDialog(
                    barrierDismissible: false, context: context, builder: dialogBuilder);
                print('NAME: $name');
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Padawan $name is off on an adventure!!')));
              }
              return RaisedButton(
              color: Colors.black54,
              onPressed: () => askName(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Center(
                  child: Text(
                    'BEGIN YOUR ADVENTURE!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
            },
          )
        ],
      ),
    );
  }
}

Widget dialogBuilder(BuildContext context) {
  double containerWidth = MediaQuery.of(context).size.width * 0.8;
  TextEditingController textEditingController =
      TextEditingController(text: "Yoda");
  return Center(
    child: Container(
//      padding: EdgeInsets.all(10.0),
      width: containerWidth,
      height: containerWidth / 16 * 9,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Enter your name, padawan!',
                style: Theme.of(context).textTheme.title,
              ),
              TextField(
                controller: textEditingController,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(textEditingController.text);
                },
                icon: Icon(
                  Icons.flight_takeoff,
                ),
                iconSize: 50.0,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
