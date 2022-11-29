import 'package:flutter/material.dart';
import 'package:anonym_test/Palette.dart';
import 'package:anonym_test/main.dart';
import 'package:line_icons/line_icons.dart';
class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isLoginScreen = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
         children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.fill
                )
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF8241249).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: isLoginScreen ? "Welcome" : "Welcome to ",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.tealAccent,
                        ),
                        children: [
                            TextSpan(
                          text: isLoginScreen ? " Back," : "Anonym," ,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent,
                          ),)
                        ]

                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(isLoginScreen ? "Sign in to continue" : "Sign up to continue",
                          style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 1,
                          color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(true),
          Positioned(
            top: 200,
            child: Container(
              height: 365,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ]),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap:() {
                          setState(() {
                            isLoginScreen = false;
                          });
                        },
                      child: Column(
                        children: [
                        Text(
                          "SIGNUP",
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold,
                            color: !isLoginScreen? Palette.activeColor : Palette.textColor),
                        ),
                        if(!isLoginScreen)
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          height: 2,
                          width: 55,
                          color: Colors.tealAccent,
                        )
                      ]),
                      ),
                      GestureDetector(
                        onTap:() {
                          setState(() {
                            isLoginScreen = true;
                          });
                        },
                      child: Column(
                        children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold,
                            color: isLoginScreen? Palette.activeColor : Palette.textColor),
                        ),
                        if(isLoginScreen)
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          height: 2,
                          width: 55,
                          color: Colors.tealAccent,
                        )
                      ])
                      )
                    ],
                  ),
                  if(!isLoginScreen) buildSignupSection(),
                  if(isLoginScreen) buildLoginSection(),

                ],
              ),
            ),
          ),
          buildBottomHalfContainer(false),

          Positioned(
            top: MediaQuery.of(context).size.height-100,
            right: 0,
            left: 0,
            child: Column(
              children: [
              Text(
                "Or sign up with",
               style: TextStyle(
                color: Palette.activeColor,
               )              
                ),
              
              Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextButton(LineIcons.facebook, "Facebook", Palette.facebookColor),
                    buildTextButton(LineIcons.googlePlus, "Google", Palette.googleColor),
                  ],
                ),
              )
            ],
          ),
          ),
          Positioned(
          top: 552.5,
          right: 140,
          left: 140,
          child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,),
        ),
        ],
      ),  
    ); 
  }

  Container buildLoginSection() {
    return                   Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                      buildTextField(Icons.mail, "Email", false, true),
                      buildTextField(Icons.key,"Password", true, false),
                      Row(
                        children: [
                          
                        Checkbox(
                          value: isRememberMe,
                          activeColor: Palette.textColor2,
                          onChanged: (value) {
                            setState(() {
                              isRememberMe = !isRememberMe;
                            }
                            );
                          },
                        ),
                        Text(
                          "Remember me",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12, color: Palette.textColor,
                          )
                          ),
                        Container(
                        margin: EdgeInsets.only(left: 25),
                        child: TextButton(
                        onPressed: (){},
                        child: Text("Forgot Password?"),
                        )

                      ),
                      ]),

                    ],),
                  );
  }

  Container buildSignupSection() {
    return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                    buildTextField(Icons.person_pin, "Username", false, false),
                    buildTextField(Icons.mail, "Email", false, true),
                    buildTextField(Icons.key, "Password", true, false),
                     Container(
                    width: 200,
                    margin: EdgeInsets.only(top: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By pressing 'Submit' you agree to our ",
                        style: TextStyle(color: Palette.textColor2),
                        children: [
                          TextSpan(
                            text: "Terms and Conditions",
                            style: TextStyle(color: Colors.tealAccent),
                          )
                        ]
                      ),
                    ),
                  ),
                  ],
                 
                  ),
                );
  }

  TextButton buildTextButton(IconData icon, String title, Color backgroundColor) {
    return TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey),
                  minimumSize: Size(145, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ), 
                  primary: Colors.white,
                  backgroundColor: backgroundColor,
                ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                    )
                  ],
                ),
              );
  }

  Positioned buildBottomHalfContainer(bool showShadow) {
    return Positioned(
          top: 520,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if(showShadow)
                  BoxShadow(
                    color: Color(0xFF000000).withOpacity(.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,1)
                  ),

                ]
              ),
              child: !showShadow ? Container(
                child: GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),);
                }
              ),
                // Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.lightBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(30),
                    
                boxShadow: [
                  if(showShadow)
                  BoxShadow(
                    color: Color(0xFF000000).withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0,1)
                  ),
  
                
                ]
                
                ),
                
                
              ) : Center(),
            ),
          )
        );

  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
           obscureText: isPassword,
           keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            icon, 
                            color: Palette.iconColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),     
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hintText: hintText, 
                            hintStyle: TextStyle(fontSize: 14, color: Palette.textColor)
                          ),
                        ),
    );
  }
}