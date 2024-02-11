import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_1/presentation/providers/auth_provider.dart';
import 'package:prueba_1/presentation/providers/login_form_provider.dart';
import 'package:prueba_1/presentation/widgets/buttons/custom_filled_button.dart';
import 'package:prueba_1/presentation/widgets/inputs/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

              const Center(
                child: _LoginForm(),
              ),


            ],
          )
        ),
      )
    );


  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();


  void showSnackBar( BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Center(child: Text(message, style: const TextStyle(color: Colors.white))),
      backgroundColor: Colors.red.shade300,
    ));
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) { 
      if(next.errorMessage.isEmpty) return;
      showSnackBar( context, next.errorMessage, );
    });


    return Container(  
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
    
          Title(color: Colors.white, child: const Text('Login', style: TextStyle(fontSize: 25),)),
    
          const SizedBox(height: 30,),
    
          CustomTextFormfield(
            label: 'Email',
            onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
            errorMessage: loginForm.isFormPosted
              ? loginForm.email.errorMessage
              : null
          ),
    
        
    
          const SizedBox(height: 20),
    
          CustomTextFormfield(
            label: 'Contraseña',
            //obscureText: true,
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChange,
            errorMessage: loginForm.isFormPosted
              ? loginForm.password.errorMessage
              : null  
          ),
    
          const SizedBox(height: 30,),
    
    
    
          CustomFilledButton(
            text: 'Ingresar',
            buttonColor: Colors.white60,
            onPressed: (){
              ref.read(loginFormProvider.notifier).onFormSubmit();
              
            },
          ),
    
          const SizedBox(height: 20),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿No tienes cuenta?'),
              TextButton(
                onPressed: ()=> { context.push('/register')}, 
                child: const Text('Crea una aquí')
              )
            ],
          ),
    
        ]
      ),
    
    );
  }
}

