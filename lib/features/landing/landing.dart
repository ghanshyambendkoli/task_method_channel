import 'package:flutter/material.dart';
import 'package:task_method_channel/features/dogImage/random_dog_image.dart';

import '../../constants.dart';
import '../../widgets/widgets.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with TaskWidgets{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar("Task"),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
             Navigator.push(
             context,
            MaterialPageRoute(builder: (context) => const RandomDogImage()),
            );
            }, child: const Text(Constant.randomDogImage)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: const Text(Constant.enableBluetooth)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: const Text(Constant.profile))
          ],
        ),
      )
    );
  }
}