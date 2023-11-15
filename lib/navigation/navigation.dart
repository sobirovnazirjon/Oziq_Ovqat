import 'package:flutter/material.dart';
import 'package:task_1/screens/home.dart';
import 'package:task_1/screens/picked.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PageController controller = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    controller = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * .2,
        width: double.infinity,
        color: Colors.blue.shade200,
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      controller.animateToPage(0,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.linear);
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 40,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.linear);
                    },
                    icon: const Icon(
                      Icons.save,
                      size: 40,
                      color: Colors.white,
                    )),
              ]),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        controller: controller,
        children: const [Home(), PickedObject()],
      ),
    );
  }
}
