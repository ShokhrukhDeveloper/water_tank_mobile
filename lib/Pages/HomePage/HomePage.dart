import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Name here"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              // padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(10)
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8,left: 8),
                    child: Text("Suvlar",style: TextStyle(
                    color: Colors.blue
                    ),),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLcjNkl2MXOmYuUPey2aOKWlLTS4Uz8tFUZXIxaejxdA&s",
                          width: 60,
                          height: 60,),
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name of wat6er can 20litre",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent
                            ),

                            ),
                            Center(
                              child: Text("8500 so'm",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                              ),

                              ),
                            ),
                          ],
                        ),
                      ),
                        Container(
                          width: 75,
                          height: 21,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.blue)
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: (){},
                                  child: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text("-"),
                              )),
                              Expanded(

                                  child: Center(child: Text("Add",
                                  style: TextStyle(
                                      color: Colors.blueAccent
                                  ),
                                  ))),
                              InkWell(
                                  onTap: (){},
                                  child: Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Text("+",
                                style: TextStyle(),
                                ),
                              )),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
