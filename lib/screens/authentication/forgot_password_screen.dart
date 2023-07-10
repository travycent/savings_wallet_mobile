//Login Screen
// This Screen has all the Forgot Password Logic of the application
import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/screens/authentication/login_screen.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({ Key? key }) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final String? title="Reset Password";
  final TextEditingController _emailTextFieldController = TextEditingController();
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
                    controller: _emailTextFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  
                  const SizedBox(height: 5.0),
                  TextButton(
                    child:const Text(
                      'Login',
                      textAlign: TextAlign.end,
                      
                      style: TextStyle(
                          fontSize: 12.0,
                          
                        ),

                    ),
                    onPressed: () {
                      //login screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 2.0),
                  ElevatedButton(
                      onPressed: (){
                        //Handle Login Logic here
                      },
                      child: const Text("Reset Password"),
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
