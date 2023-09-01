import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LastExample extends StatefulWidget {

  @override
  State<LastExample> createState() => _LastExampleState();
}

class _LastExampleState extends State<LastExample> {

  var data;

  Future<void> api() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  void initState() {
     api();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api"),
      ),
      body: Column(
        children: [
          Expanded(
             child: FutureBuilder(
               future: api(),
                builder: (context, snapshot){

                if(snapshot.connectionState == ConnectionState.waiting){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }else {
                   return ListView.builder(
                       itemCount: data.length,
                       itemBuilder: (context, index){
                     return Card(
                       child: Column(
                         children: [
                           Padding(
                             padding: EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("name"),
                                     Text(data![index]['name'].toString()),
                                     //Text(data![index]['username'].toString()),
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("Username"),
                                     Text(data![index]['username'].toString()),
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("Geo"),
                                     Text(data![index]['address']['geo']['lat'].toString()),
                                   ],
                                 ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                       });
                }
            }),
          )
        ],
      ),
    );
  }
}
