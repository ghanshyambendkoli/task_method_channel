import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_method_channel/features/profile/user_profile_model.dart';
import 'package:task_method_channel/widgets/widgets.dart';

import '../../constants.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with TaskWidgets{
   String imageUrl="";
  bool isLoading= false;
  late UserProfileModel userProfile;

  getUserData() async {
    isLoading= true;
    setState(() {
      
    });
    final response =
        await http.get(Uri.parse(Constant.userProfileData));

    if (response.statusCode == 200) {
      var dataResponse = await json.decode(response.body);
      // var resp = await UserProfileModel.fromJson(response.body[0].["results"]);
      // imageUrl = dataResponse["message"];
      isLoading= false;
      log(dataResponse["results"][0].toString());
      userProfile= UserProfileModel.fromJson(dataResponse["results"][0]);
     log(userProfile.name.toString());
      setState(() {
        
      });
      
    } else {
      throw Exception();
    }
  }
  
  //format date 
  formatDate(date){
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(DateTime.parse(date));
    // listdata[index].dueDate;
    return formatted;
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar("Profile"),
      body: isLoading?
     const Center(child:  CircularProgressIndicator()):
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child:  Image.network(userProfile.imageUrl!)),
                  ),
                ),
                const SizedBox(height: 20,),
                Text("Name : ${userProfile.name!}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                const SizedBox(height: 20,),
                Text("Email : ${userProfile.email!}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                const SizedBox(height: 20,),
                Text("DOB : ${formatDate(userProfile.dob)}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                const SizedBox(height: 20,),
                Text("Address : ${userProfile.location!}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}