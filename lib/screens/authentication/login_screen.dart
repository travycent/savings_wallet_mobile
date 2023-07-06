//Login Screen
// This Screen has all the Login Logic f the application
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String? title="Login";
  final TextEditingController _usernameTextFieldController = TextEditingController();
  final TextEditingController _passwordTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(title!),
       ),
       body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo section
                  Image(
                    image: const AssetImage('assets/images/logo.png'),
                    width: 100 / 100.0 * MediaQuery.of(context).size.width,
                    height: 20 / 100.0 * MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  
                  //Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _usernameTextFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordTextFieldController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextButton(
                    child:const Text(
                      'Forgot password?',
                      textAlign: TextAlign.end,
                      
                      style: TextStyle(
                          fontSize: 12.0,
                          
                        ),

                    ),
                    onPressed: () {
                      //signup screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const RegisterPage()),
                      // );
                    },
                  ),
                  const SizedBox(height: 2.0),
                  ElevatedButton(
                      onPressed: (){
                        //Handle Login Logic here
                      },
                      child: const Text("Login"),
                      style: ElevatedButton.styleFrom(
                        // Use percentages to set the minimum size
                        minimumSize:const Size(100.0, 10.0) / 100.0 * MediaQuery.of(context).size.width,

                      ),
                      
                      
                  ),

                  
                ],
              ),
            ),
          ),
       ),
    );
  }
}