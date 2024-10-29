import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {



  String result="0";
  String value ="0";
  String operand="";
  double num1=0.0;
  double num2=0.0;

  pressed(dynamic num)
  {
    if(num=="C")
      {
        value ="0";
        operand="";
        num1=0.0;
         num2=0.0;
      }
    else if(num=="+" || num=="-" || num=="X" || num=="/")
      {
        num1=double.parse(result);
        operand=num;
        value="0";
      }
    else if(num=="=")
      {
        num2=double.parse(result);
        if(operand=="+")
          {
            value=(num1+num2).toString();
          }
        else if(operand=="-")
        {
          value=(num1-num2).toString();
        }
        else if(operand=="X")
        {

          value=(num1*num2).toString();
        }
        else if(operand=="/")
        {
          value=(num1/num2).toString();
        }
        num1=0.0;
        num2=0.0;
        operand="";
      }
    else{
      value=value+num;
    }
    setState(() {
      result=double.parse(value).toString();
    });

  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  buildbutton("1"),
                  buildbutton("2"),
                  buildbutton("3"),
                  buildbutton("+"),
                ],
              ),
              Row(
                children: [
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                  buildbutton("-"),
                ],
              ),
              Row(
                children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                  buildbutton("X"),
                ],
              ),
              Row(
                children: [
                  buildbutton("0"),
                  buildbutton("C"),
                  buildbutton("="),
                  buildbutton("/"),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget buildbutton( String number){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: ()=>pressed(number),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
      
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(number,style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
      
                    ),),
            )),
      ),
    );
  }
}
