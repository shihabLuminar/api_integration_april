// https://catfact.ninja/fact

import 'package:api_integration/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<HomeScreenController>(context, listen: false)
            .getUserData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Provider.of<HomeScreenController>(context, listen: false)
                .getUserData();
          },
        ),
        body: Consumer<HomeScreenController>(
          builder: (context, providerObj, child) => Center(
            child: providerObj.isLoading == false
                ? Text(providerObj.fact.toString())
                : CircularProgressIndicator(),
          ),
        ));
  }
}
