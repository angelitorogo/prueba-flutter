import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_1/presentation/widgets/shared/custom_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {


  final Widget childView;
  final String titulo;

  const HomeScreen({super.key, required this.childView, this.titulo = 'appbar'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: const Color(0xFF110431),
        centerTitle: true,
        title: Text(titulo),
        actions: [

          /*
          // mostrar un icono u otro dependiendo de si estamos logados o no
          IconButton(
            //icon: const Icon(Icons.person, color: Colors.green,),
            icon: const Icon(Icons.login),
            onPressed: () {
              // Acción al presionar el icono de búsqueda
              context.push('/login');
            },
          ),

          
          IconButton(
            //icon: const Icon(Icons.person, color: Colors.green,),
            icon: const Icon(Icons.person),
            onPressed: () {
              // Acción al presionar el icono de búsqueda

              //Navegar a perfil de usuario
              context.push('/perfil-view');

            },
          ),
          */

          IconButton(
            //icon: const Icon(Icons.person, color: Colors.green,),
            icon: const Icon(Icons.menu),
            onPressed: () {

            },
          ),
          


        ],
      ),
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

