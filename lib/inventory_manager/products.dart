import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              title: const Text(
                'Products',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),




//this button opens the addproduct page
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _AddProduct());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
    `Product_Id`, `Product_Name`, `Product_Description`
    , `brand`, `Category`, `Initial_Cost`, `Product_Price`,
     `Quantity`, `Available_Colors`, `Image`
*/
class _AddProduct extends MaterialPageRoute<void> {
  _AddProduct()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Register new product',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
             
              elevation: 1.0,
            ),

            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        hintText: 'What is the name of product',
                        labelText: 'Product Name'
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        hintText: 'What is the brand name of product',
                        labelText: 'Product Brand'
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'give a brief description of product',
                        labelText: 'Product description',
                      ),
                      maxLines: 3,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: 'What colors are available',
                        labelText: 'Product colors'
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Ovens,Hoods, Fridge , microwaves , burner tops, dishwashers ',
                        labelText: 'Category',
                      ),
                      maxLines: 2,
                    ),


                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),  
                        filled: true,                      
                        hintText: 'What was the buying price of product',
                        labelText: 'Buying price',
                        suffixText: 'Ksh',suffixStyle: TextStyle(color: Colors.green)
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),                        
                        hintText: 'What is the selling price of the product',
                        labelText: 'Selling price',
                        suffixText: 'Ksh',suffixStyle: TextStyle(color: Colors.green)
                      ),
                    ),

                      SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        hintText: 'Quantity of the product',
                        labelText: 'Quantity'
                      ),
                    ),

                    
                      SizedBox(
                      height: 20,
                    ),     
                    
                    ElevatedButton(                      
                          onPressed: (){   
                                              
                        }, child: Text('Add',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),



                  ],
                ),
              ),
            ),
          );
        });
}