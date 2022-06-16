import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';
// reusable components
//1)timing
//2)refactor
//3)quality
//4)clean cold
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = true;

    @override
  Widget build(BuildContext context) {
    return  Scaffold (

      resizeToAvoidBottomInset: false,

      appBar: AppBar(),
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey,
              child: Column(

                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children:
                [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormFiled(
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: ( value){
                      if (value==null || value.isEmpty )

                      {
                        return 'Email must be not be empty';
                      }
                      else{return null;}
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormFiled(
                    controller: passwordController,
                    label: 'password',
                    prefix: Icons.lock,
                    suffix: isPassword? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    suffixpressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    type: TextInputType.visiblePassword,
                    validate: ( value){
                      if (value==null || value.isEmpty )
                      {
                        return 'password must be not be empty';
                      }
                      else{return null;}
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),

                  defaultButton(
                    text:'login' ,
                    function: (){
                      if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultButton(
                    text:'ReGister',
                    function: (){
                      if(formKey.currentState!.validate())
                      {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },

                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:  [
                      const Text(
                        'Don\'t have an account?',

                      ),
                      TextButton(
                        onPressed:  () {},
                        child: const Text(
                          'Register Now'

                        ),
                      ),

                    ],

                  ),

                ],
              ),
            ),
          ),
        ),
      ),

      );

  }
}
