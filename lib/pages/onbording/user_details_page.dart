import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/user_model.dart';
import 'package:demo/pages/main_page.dart';
import 'package:demo/services/user_services.dart';
import 'package:demo/util/color.dart';
import 'package:demo/widgets/custom_button.dart';
// import 'package:demo/services/user_services.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String name = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String conpassword = _confirmPasswordController.text;

      try {
        final UserModel usermodel = UserModel(
          id: "",
          name: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          conformpasword: _confirmPasswordController.text,
        );

        if(password !=conpassword){
           ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Conform password ")));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
        

        }
        await UserServices().userdetailsed(usermodel);
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
        print("Sucess to user details page");
        return;
        
      } catch (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Success to User details page")));
        print(
          "$error error user details page hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UserDetails Page")),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      //check weather the username is entered
                      if (value!.isEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Email";
                      }
                      // Basic email validation
                      if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter A Valid Password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter A Valid Password";
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      _submitForm(context);
                    },

                    child: CustomButton(
                      buttonName: "Next",
                      buttonColor: kMainColor,
                    ),
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
