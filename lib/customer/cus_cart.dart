import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CusCart extends StatefulWidget {
  const CusCart({super.key});

  @override
  State<CusCart> createState() => _CusCartState();
}

class _CusCartState extends State<CusCart> {

 List productdata=[];

Future<void> getproducts() async {
  String uri= 'http://10.0.2.2/Exen_Limited/Api/Products.php';
  try{
    var response=await http.get(Uri.parse(uri));

    productdata= jsonDecode(response.body);

  }catch(e){print(e);}
}

@override
 void iniState(){
  getproducts();
  super.initState();
 }

  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'Cart',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      appBar: AppBar(
        title: text,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),

      body: ListView.builder(            
            itemCount: productdata.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: EdgeInsets.all(10),                                  
                  child: ListTile(                   
                  title: Text(productdata[index]["Product_Id"]),
                  subtitle: Text(productdata[index]["Product_Name"]),
                   leading: GestureDetector(
                      onTap: (){
                       
                      },
                      child: Icon(Icons.remove_red_eye),
                      ),
                ),
                );
            },

          ),

          floatingActionButton: FloatingActionButton(
        onPressed: () =>  getproducts(),
        child: const Icon(Icons.shopping_cart_checkout_rounded),
      ),
      
    );
  }
}
