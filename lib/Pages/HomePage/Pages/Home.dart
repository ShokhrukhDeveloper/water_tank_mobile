import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:water_tank_mobile/API/API.dart';
import 'package:water_tank_mobile/Data/Extension/Extension.dart';
import 'package:water_tank_mobile/Data/Model/Company.dart';
import 'package:water_tank_mobile/Data/Model/Product.dart';
import 'package:water_tank_mobile/Pages/HomePage/Pages/Cart.dart';
import 'package:water_tank_mobile/Pages/Widgets/ProductItem.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<Product>? products;
  Future<void> getHomeData()async
  {
    var result =await API.getHomeData();
    if(result is List)
      {
        products=result.cast<Product>();
      }
    setState(() {

    });
  }
  Company? company;
  Future<void> getCompanyData()async{
  var result = await API.getCompanyData();
  if(result is Company)
    {
      company=result;
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData();
    getCompanyData();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         if(company!=null) Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(15),
            height: 160,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(20),
              gradient:  LinearGradient(colors: [Colors.lightBlueAccent.withOpacity(0.4),Colors.blueAccent])
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height:45,
                        child: Center(
                          child: Text("${company?.companyName}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                          ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on_outlined,size: 16,color: Colors.white,),
                          Flexible(
                            child: Text("  ${company?.address}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.call,size: 16,color: Colors.white,),
                          Flexible(
                            child: Text("  ${company?.phone}",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX1hBEkw10kJMHXrHG-a95PWeSRVQBy-ddLKgcg017wpb7obUUtt5oEC7BhtYOczirQVw&usqp=CAU"),fit: BoxFit.cover)
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            // padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8,left: 8),
                  child: Text("Suvlar",style: TextStyle(
                      color: Colors.blue
                  ),),
                ),
                const Divider(),
                if(products!=null)
                  ...products!.map((e) =>ProductItemWidget(
                  onTapAdd: (){
                    if(!Cart.cart.exits(e)){
                      Cart.cart.add(e);
                      setState(() {
                      });
                    }
                  }, text: e.name??"",  count: "+", price: e.priceOut??0, visiblity: !Cart.cart.exits(e),))
                ,
              ],
            ),
          )
        ],
      ),
    );
  }
}
