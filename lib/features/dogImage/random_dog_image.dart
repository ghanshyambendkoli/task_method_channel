import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_method_channel/constants.dart';
import 'package:task_method_channel/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> with TaskWidgets{
  String imageUrl="";
  bool isLoading= false;

  @override
  void initState() {
    getRandomDogImage();
    super.initState();
  }
  Future getRandomDogImage() async {
    isLoading= true;
    setState(() {
      
    });
    final response =
        await http.get(Uri.parse(Constant.randomDogImageUrl));

    if (response.statusCode == 200) {
      var dataResponse = await json.decode(response.body);
      imageUrl = dataResponse["message"];
      isLoading= false;
      setState(() {
        
      });
      log(imageUrl);
    } else {
      throw Exception();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(Constant.randomDogImage),
      body: isLoading?
      const Center(child: CircularProgressIndicator()):
       Column(
         children:  [
           SizedBox(
             height: 300,
             width: MediaQuery.of(context).size.width,
             child: Image.network(imageUrl)),
           const SizedBox(height: 20,),
           IconButton(onPressed: (){
             getRandomDogImage();
           }, icon: const Icon(Icons.refresh,size: 40,))
         ],
       ),
    );
  }
}