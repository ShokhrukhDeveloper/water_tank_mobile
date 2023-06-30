import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tank_mobile/API/API.dart';
import 'package:water_tank_mobile/Data/Model/Order.dart';
import 'package:water_tank_mobile/Data/Model/Product.dart';
import 'package:water_tank_mobile/Pages/Widgets/ProductItem.dart';
import 'package:water_tank_mobile/Pages/Widgets/ProductItemCart.dart';
import 'package:water_tank_mobile/Pages/Widgets/progress.dart';
class Cart extends StatefulWidget {
   Cart({Key? key}) : super(key: key);
  static final cart=<Product>[].obs;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
 Future<void> createOrder()async
 {
   showProgress(context);

   try{
     var orderList=<Order>[];
     for(var tin in Cart.cart)
     {
       if(!(tin.count<=0)) {
         var res = await API.createOrder(quantity: tin.count, productId: tin.id!.toInt());
         if(res!=null)
         {
           orderList.add(res);
           Cart.cart.remove(res);
         }
       }
     }
     Cart.cart.clear();

   }catch(e){
     await Future.delayed(const Duration(seconds: 2),()=>Navigator.pop(context));
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Xatolik yuz berdi $e"), backgroundColor: Colors.red,));
     return;
   }
   await Future.delayed(const Duration(seconds: 2),()=>Navigator.pop(context));
   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Buyurtma muvafaqqiyatli yaratildi"), backgroundColor: Colors.green,));



 }


  @override
  Widget build(BuildContext context) {
    return Cart.cart.isEmpty? const Center(
      child: Icon(Icons.browser_not_supported_outlined,size: 36,),):
    Column(
      children: [
        Expanded(child: Obx(()=>ListView.builder(
            itemCount: Cart.cart.length,
            itemBuilder: (c,i)=>ProductItemCart(onTapPlus: (){
              Cart.cart[i].count++;
              setState(() {});
            }, text: "${Cart.cart[i].name}", onTapMinus: (){
              Cart.cart[i].count--;
              setState(() {
              });
            }, count: "${Cart.cart[i].count}", price: Cart.cart[i].priceOut??0)))),
        InkWell(
          onTap: createOrder,
          child: Container(
            width: double.infinity,
            height: 56,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: const Color(0xff0074B4)
            ),
            child: const Center(
              child: Text("Buyurtma qilish",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),

              ),
            ),
          ),
        ),
      ],

    );
  }
}
