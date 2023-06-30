import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_tank_mobile/Data/Model/Order.dart';


class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);
  final Order order;
static const style=TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color(0xff0074B4)
);
static final  format=DateFormat("yyyy.MM.dd - hh:mm");
  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff0074B4).withOpacity(0.4))
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Buyutrma №: ${order.id}", style: style),
          Text("Manzil: ${order.address}", style: style),
          Text("Suv: ${order.productName}", style: style),
          Text("Soni: ${order.quantity}", style: style),
          Text("Narxi: ${order.price}", style: style),
          if(order.createdAt!=null)Text("Yaratildi: ${format.format(DateTime.parse(order.createdAt!))}", style: style),
          if(order.acceptedAt!=null)Text("Qabul qilindi: ${format.format(DateTime.parse(order.acceptedAt!))}", style: style),
          if(order.deliveredAt!=null)Text("Yakunlandi: ${format.format(DateTime.parse(order.deliveredAt!))}", style: style),


          SizedBox(height: 5,),
          Text("Umumiy nrxi: ${order.totalPrice} so’m",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff0074B4)
          ),
          ),


        ],
      ),

    );
  }
}
