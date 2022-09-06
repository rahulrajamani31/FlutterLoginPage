import 'package:akash_app/homescree.dart';
import 'package:akash_app/loginpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class verification extends StatefulWidget {
  const verification({ Key? key }) : super(key: key);

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {

   
  bool _isResendAgain = false;
  int otpreq =3;
  bool _isVerified = false;
  bool _isLoading = false;
TextEditingController otp = TextEditingController();
                

  
           


  // ignore: unused_field
  late Timer _timer;
  int _start = 10;
  int _currentIndex = 0;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(milliseconds: 1000);
    _timer = new Timer.periodic(oneSec, (timer) { 
      setState(() {
        if (_start == 0) {
          _start = 10;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 2000);
    _timer = new Timer.periodic(oneSec, (timer) { 
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: _currentIndex == 0 ? 1 : 0, 
                        duration: Duration(seconds: 1,),
                        curve: Curves.linear,
                        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Twitter_Verified_Badge.svg/640px-Twitter_Verified_Badge.svg.png',),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: _currentIndex == 1 ? 1 : 0, 
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: Image.network('https://dis-blog.thalesgroup.com/wp-content/uploads/2017/01/ID-Verification-banks.png',),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: _currentIndex == 2 ? 1 : 0, 
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        child: Image.network('https://www.eweek.com/wp-content/uploads/2021/02/Identity.check_.jpg',),
                      ),
                    )
                  ]
                ),
              ),
              SizedBox(height: 30,),
               Text("Verification", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
               Text("Please enter the OTP", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade500, height: 1.5),
              ),
              SizedBox(height: 30,),

  
            TextField(
                              
                              controller: otp,
	                            decoration: InputDecoration(
                                labelText:  "          OTP",
	                              border: InputBorder.none,
	                              hintText:'Enter your OTP',
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),


              SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't resive the OTP?", style: TextStyle(fontSize: 14, color: Colors.grey.shade500),),
                    TextButton(
                      onPressed: () {
                        if (_isResendAgain){return;} 
                        else if(otpreq!=0&& !_isResendAgain){
                        resend();
                        
                        setState(() {
                          otpreq--;
                        });
                   }
                   else{
                       Navigator.push(context, MaterialPageRoute(builder: (_) {
              return HomePage();
            }));
                    
                   }
                        
                      }, 
                      child: Text(_isResendAgain ? "Try again in " + _start.toString() : "Resend", style: TextStyle(color: Colors.blueAccent),)
                    )
                  ],
                ),
              
              SizedBox(height: 50,),
               MaterialButton(
                  elevation: 0,
                  onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_) {
              return loginpage();
            }));
                    
                    }
                   
                  ,
                  color: Colors.orange.shade400,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: _isLoading ? Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 3,
                      color: Colors.black,
                    ),
                  ) : _isVerified ? Icon(Icons.check_circle, color: Colors.white, size: 30,) : Text("Verify", style: TextStyle(color: Colors.white),),
                ),
              
          ],)
        ),
      )
    );
  }
}