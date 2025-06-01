import 'package:flutter/material.dart';
import 'package:login/components/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  final usernameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> validUsernames = [];

  @override 
  void initState(){
    super.initState();
    loadUsernames();
  }

  Future<void> loadUsernames() async{
    final prefs = await SharedPreferences.getInstance();
    setState((){
      validUsernames = prefs.getStringList('validUsernames') ?? [];
    });
  }

  Future<void> saveUsername(String newUser) async{
    final prefs = await SharedPreferences.getInstance();
    validUsernames = prefs.getStringList('validUsernames') ?? [];

    if(!validUsernames.contains(newUser)){
      validUsernames.add(newUser);
      await prefs.setStringList('validUsernames', validUsernames);
    }
    await prefs.setStringList('validUsernames', validUsernames);
    await loadUsernames();
    //setState((){
    //});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Account created for "$newUser"')),
    );
  }

  //Log in
  void logIn() async{
    _focusNode.unfocus();
    final prefs = await SharedPreferences.getInstance();
    validUsernames = prefs.getStringList('validUsernames') ?? [];
    
    String enteredUsername = usernameController.text.trim().toLowerCase();
    print('valid usernames: $validUsernames');

    if(validUsernames.contains(enteredUsername)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Loading...')),
      );
      Navigator.pushReplacementNamed(context, '/home');
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username. Create an account under this name?'),
          action: SnackBarAction(
            label: 'Yes',
            onPressed: () async{
              await saveUsername(enteredUsername);
              usernameController.clear();
              //FocusScope.of(context).requestFocus(_focusNode);
            },
          ),
        ),
      );
      
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: FocusScope(
        node: FocusScopeNode(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Welcome
              const SizedBox(height: 50, width: 400),
              Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
              ),
              //Username textfield
              const SizedBox(height: 25),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: usernameController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color.fromARGB(255, 144, 202, 249),),
                    ),
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: 'Username',
                  ),
                ),
              ),
        
              const SizedBox(height: 25),
              //Log in button
              MyButton(
                onTap: logIn,
              ),
            ]
          ),
        ),
      ),
    );
  }
}