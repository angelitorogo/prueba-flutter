
import 'package:flutter/material.dart';
import 'package:go_router/src/route.dart';

class HomeScreenOld extends StatelessWidget {
  const HomeScreenOld({super.key, required StatefulNavigationShell childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF0B406B),
        centerTitle: true,
        title: const Text('Appbar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('hola'),
          
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0B406B)
            ),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.home, size: 30,)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add_box, size: 30,)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.wrap_text, size: 30,)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.wrap_text, size: 30,))                    

                ],
              ),
            ),
          )
      
        ],
      ),

    );
  }

}