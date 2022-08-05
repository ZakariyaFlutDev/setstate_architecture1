import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:setstate_architecture1/model/infos_model.dart';
import 'package:setstate_architecture1/service/http_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Infos data = Infos();

  void _apiInfos(String githubID){
    Network.GET(Network.api + githubID, Network.paramEmpty()).then((resp) =>{
      _showResp(resp!),
    });
  }

  _showResp(String resp){
    Map<String, dynamic> map = jsonDecode(resp);
    setState(() {
      data = Infos.fromJson(map);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiInfos("ZakariyaFlutDev");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your github informations", style: TextStyle(color: Colors.blue, fontSize: 32),),
              SizedBox(height: 50,),
              Text("Login name: ${data.login}", style: TextStyle(color: Colors.red, fontSize: 22),),
              SizedBox(height: 30,),
              Text("ID: ${data.id}", style: TextStyle(color: Colors.red, fontSize: 22),),
              SizedBox(height: 30,),
              Text("Followers: ${data.followers}", style: TextStyle(color: Colors.red, fontSize: 22),),
              SizedBox(height: 40,),
              Text("Followings: ${data.following}", style: TextStyle(color: Colors.red, fontSize: 22),),

            ],
          ),
        ),
      )
    );
  }
}
