import 'package:flutter/material.dart';

class StringManipulation extends StatefulWidget {
  StringManipulation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StringManipulationState createState() => _StringManipulationState();
}

class _StringManipulationState extends State<StringManipulation> {
TextEditingController stringDate = new TextEditingController();
String output = "";
  @override
  void initState() {
    super.initState();
  }

  void StringConverter(String str){
    //String str = "Hello World abc def ghi";
    List<String> words = str.split(" ");

    for (int i = (words.length - 3); i >= 0; i--) {
      output = ((output + words[i]) + " ");
    }
    output = (((output + words[words.length - 2]) + " ") + words[words.length - 1]);
    print("Output:"+output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.cyan,
        body: Center(
          child: Container(margin: EdgeInsets.all(20.0),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Colors.white),height: MediaQuery.of(context).size.height/2,child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Stack(
              children: [
                //Container(height: 120, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg'),fit: BoxFit.fill))),
                Align(alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/12.9),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("String Manipulation",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(controller: stringDate,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Sentence',
                              hintText: 'Enter Sentence',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text("Output:",style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                              Text(output,style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.4),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      backgroundColor: Colors.green,
                      minimumSize: Size(MediaQuery.of(context).size.width, 65),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                      ),
                    ),
                    onPressed: () { setState(() {
                      print("fgf:"+stringDate.text);
                      StringConverter(stringDate.text);
                    }); },
                    child: Text(
                      "Find",style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )),
        )
    );
  }
}