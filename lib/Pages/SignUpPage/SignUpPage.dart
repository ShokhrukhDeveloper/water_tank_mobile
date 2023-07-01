import 'package:flutter/material.dart';
import 'package:water_tank_mobile/API/API.dart';
import 'package:water_tank_mobile/Data/Model/Token.dart';
import 'package:water_tank_mobile/Data/Model/User.dart';
import 'package:water_tank_mobile/Data/Storage/LocalStorage.dart';
import 'package:water_tank_mobile/Pages/Widgets/InputWidget.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:water_tank_mobile/Pages/Widgets/progress.dart';

import '../../Data/Model/SignData.dart';
import '../../main.dart';
import '../HomePage/HomePage.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {

  TextEditingController? controllerName;
  TextEditingController? controllerPhone;
  TextEditingController? controllerPassword;
  TextEditingController? controllerAddress;
  TextEditingController? controllerEmail;
  @override
  void initState() {
    super.initState();
    controllerPassword=TextEditingController();
    controllerPhone=TextEditingController();
  }

  Future<void> signUp()async{
    showProgress(context);
    try{
      var phone= controllerPhone?.text.replaceAll("(", "").replaceAll(")", "").replaceAll("-", "");
      var result = await API.signUp(phone:phone??"", password: controllerPassword?.text??"", address: controllerAddress?.text??'', name: controllerName?.text??'');
      if(result is User)
        {
          await Future.delayed(const Duration(seconds: 2));
          back();
        }
    }catch(e){

    }
  }
 void back(){
    Navigator.pop(context);
    Navigator.pop<SignData>(context,SignData(password: controllerPassword!.text,login: controllerPhone!.text));
  }
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
                const Spacer(),

                Column(
                  children: [
                    Image.asset("assets/images/logo.png",height: 100,width: 100,),
                    const Text(programName,
                    style: TextStyle(
                      color: Color(0xff0074B4),
                      fontWeight: FontWeight.bold,
                      fontSize: 32
                    ),
                    )
                  ],
                ),

                const SizedBox(height: 30,),
                /// FISH
                InputWidget(title: "F.I.Sh",
                  controller: controllerName,

                ),
                /// Address
                const SizedBox(height: 20,),
                InputWidget(title: "Manzil",
                  controller: controllerAddress,

                ),
                ///
                const SizedBox(height: 20,),
                InputWidget(title: "Tel nomer",
                  controller: controllerPhone,
                  formatter: [
                    MaskedInputFormatter('+###(##)-###-##-##')
                  ],
                ),
                /// Email for otp
                const SizedBox(height: 20,),
                InputWidget(title: "Email",
                  controller: controllerEmail,

                ),
                const SizedBox(height: 20,),
                InputWidget(title: "Parol",
                  controller: controllerPassword,
                  isPassword: true,
                ),

                const SizedBox(height: 10,),
                InkWell(
                  onTap: signUp,
                  child: Container(
                    width: double.infinity,
                    height: 56,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: const Color(0xff0074B4)
                    ),
                    child: const Center(
                      child: Text("Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),

                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t Have An Account?"),TextButton(onPressed: (){}, child: const Text("SignIn",
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
