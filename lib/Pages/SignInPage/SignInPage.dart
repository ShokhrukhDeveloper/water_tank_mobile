import 'package:flutter/material.dart';
import 'package:water_tank_mobile/Pages/Widgets/InputWidget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,),
        child: SingleChildScrollView(
          child: SizedBox(
          height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png",height: 300,width: 300,),
                // const SizedBox(height: 30,),
                InputWidget(title: "Phone",),
                const SizedBox(height: 20,),
                InputWidget(title: "password",isPassword: true,),

                Align(alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: (){},
                  child: Text("Forgot Password ?",
                  style: TextStyle(color: Color(0xff0074B4).withOpacity(0.60)),
                  ),
                ),
                ),
                const SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 56,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(0xff0074B4)
                  ),
                  child: Center(
                    child: Text("Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),

                    ),
                  ),
                ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t Have An Account?"),TextButton(onPressed: (){}, child: Text("SignIn",
                  style: TextStyle(color: Color(0xffFC4B6F)),
                  ))
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
}}
