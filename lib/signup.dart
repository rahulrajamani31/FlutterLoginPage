import 'package:akash_app/loginpage.dart';
import 'package:akash_app/verification.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool circular = false;
  final _formKey = GlobalKey<FormState>();
  bool validate = false;
  TextEditingController namein = TextEditingController();
  TextEditingController emailin = TextEditingController();
  TextEditingController passwordin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-1.png'))),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png'))),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png'))),
                        ),
                      ),
                      Positioned(
                          child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade100))),
                                child: TextFormField(
                                  maxLength: 20,
                                  controller: namein,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter username';

                                    if (value.length < 5)
                                      return "Username should be minimum 6letters";

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "USERNAME",
                                      border: InputBorder.none,
                                      hintText: 'Enter your username',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),

                                  //  onSubmitted: (_) {
                                  //            namein.clear();
                                  //           },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade100))),
                                child: TextFormField(
                                  maxLength: 80,
                                  controller: emailin,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter email';

                                    if (value.length < 5)
                                      return "email should be minimum 6 letters";

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "EMAIL-ID",
                                      border: InputBorder.none,
                                      hintText: 'Enter your email',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                  //     onChanged: (val) {
                                  //   email = val;
                                  // },
                                  //  onSubmitted: (_) {
                                  //    emailin.clear();
                                  //   },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  maxLength: 80,
                                  controller: passwordin,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Please enter password';

                                    if (value.length < 6)
                                      return "password should be minimum 6letters";

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "PASSWORD",
                                      border: InputBorder.none,
                                      hintText: 'Enter your password',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400])),
                                  // onChanged: (val) {
                                  //     password = val;
                                  //   },
                                  //  onSubmitted: (_) {
                                  //  passwordin.clear();
                                  // },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            circular = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              circular = true;
                            });
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Processing Data')),

                            // );
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return verification();
                            }));
                          } else {
                            setState(() {
                              circular = false;
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: circular
                                ? CircularProgressIndicator()
                                : Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return verification();
                            }));
                          },
                          child: Text("Try Verification Page")),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return loginpage();
                                }));
                              },
                              child: Text("LOGIN"))
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
