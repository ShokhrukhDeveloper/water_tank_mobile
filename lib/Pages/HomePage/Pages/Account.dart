import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_tank_mobile/Data/Storage/LocalStorage.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: ElevatedButton(
       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red),

       // maximumSize: MaterialStatePropertyAll<Size>(Size.fromWidth(110))
       ),

        onPressed: (){
         LocalStorage.removeToken();

        }, child: const Row(
      mainAxisSize: MainAxisSize.min,
          children: [
            Text("Chiqish"),
            SizedBox(width: 10,),
            Icon(Icons.logout,),
          ],
        )),);
  }
}
