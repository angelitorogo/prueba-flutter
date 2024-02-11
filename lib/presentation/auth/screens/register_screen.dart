import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_1/presentation/widgets/buttons/custom_filled_button.dart';
import 'package:prueba_1/presentation/widgets/inputs/custom_text_form_field.dart';

class ResgisterScreen extends StatelessWidget {
  const ResgisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [

              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/luna.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),

              Center(
                child: Container(  
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Title(color: Colors.white, child: const Text('Registro', style: TextStyle(fontSize: 25),)),

                      const SizedBox(height: 30,),

                      const CustomTextFormfield(label: 'Email'),

                      const SizedBox(height: 30,),

                      const CustomTextFormfield(label: 'Nombre completo'),

                      const SizedBox(height: 20),

                      const CustomTextFormfield(label: 'Contraseña'),
                      
                      const SizedBox(height: 20),

                      const CustomTextFormfield(label: 'Repite contraseña'),
                      
                      const SizedBox(height: 20),

                      CustomFilledButton(
                        text: 'Registrar',
                        buttonColor: Colors.white60,
                        onPressed: (){
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('¿Ya tienes cuenta?'),
                          TextButton(
                            onPressed: ()=> context.push('/login'), 
                            child: const Text('Inicia sesión')
                          )
                        ],
                      ),


                    ]
                  ),
                
                ),
              ),


            ],
          )
        ),
      )
    );


  }
}

