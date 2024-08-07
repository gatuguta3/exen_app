import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';

import 'package:mysql1/mysql1.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var Product_Id;


    @override
  void initState() {
    super.initState();
    _fetchData();
  }

   List<dynamic> _data = [];
   

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('https://0d28-196-216-86-68.ngrok-free.app/Exen_Limited/Api/Products.php'));

    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }


Future<void> _editProduct(Map<String, dynamic> product) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProduct(product: product)),
    );

    if (result == true) {
      _fetchData(); // Refresh the data if the product was updated
    }
  }

  Future<void> _deleteProduct() async{
      try{
        String uri="http://10.0.2.2/Exen_Limited/Api/products_delete.php";
      var res = await http.post(Uri.parse(uri), body: {'Product_Id': Product_Id});
      var response = jsonDecode(res.body);

      if(response["success"] =="true"){
        _fetchData();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product deleted successfully')),);

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error deleting record: ${response.statusCode}')),);
      }
      }catch(e){
        print(e);}
  }



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

         body: SingleChildScrollView(
          child: Center(
          child: Column(                      
            children: [         
             Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black)),
                ),
                child: Text('Product List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
 /*
    `Product_Id`, `Product_Name`, `Product_Description`
    , `brand`, `Category`, `Initial_Cost`, `Product_Price`,
     `Quantity`, `Available_Colors`, `Image`
*/
             SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                   SizedBox(height: 20),
              _data.length > 0
              ? DataTable(                
                columns:  [
                DataColumn(label: Text('Product Id')),
                DataColumn(label: Text('Product Name')),
                DataColumn(label: Text('Product Description')),
                DataColumn(label: Text('Brand')),
                DataColumn(label: Text('Category')),
                DataColumn(label: Text('Initial Cost')),
                DataColumn(label: Text('Product Price')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Available Colors')),         
                 DataColumn(label: Text('Actions')),

              ],                

               rows: _data
                          .map(
                            (data) => DataRow(
                              cells: [
                                DataCell(Text(data['Product_Id'].toString())),
                                DataCell(Text(data['Product_Name'].toString())),
                                DataCell(Text(data['Product_Description'].toString())),
                                DataCell(Text(data['brand'].toString())),
                                DataCell(Text(data['Category'].toString())),
                                DataCell(Text(data['Initial_Cost'].toString())),
                                DataCell(Text(data['Product_Price'].toString())),
                                DataCell(Text(data['Quantity'].toString())),
                                DataCell(Text(data['Available_Colors'].toString())),                             
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){
                                          _editProduct(data);
                                      }, icon: Icon(Icons.edit)),
                                      IconButton(onPressed: (){
                                        _deleteProduct();
                                              //int Product_Id = int.parse(data['Product_Id'].toString()); // Ensure this is an int
                                              //deleteRow(Product_Id);
                                        //deleteRow(data['Product_Id']);
                                      }, icon: Icon(Icons.delete_outline))
                                    ],
                                  )
                                ),                        
                              ],
                              
                            ),
                            
                          )
                          .toList(),
                          
                    )
                  : Text('No data found'),
                ],
              ),
             )
            ],
          ),
         ),



         ),

//this button opens the addproduct page
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return   _AddProduct();
                                  },
                                ),
                              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}

class _AddProduct extends StatefulWidget{
  @override
  _AddProductState createState() => _AddProductState();
}
class _AddProductState extends State<_AddProduct> {

   File? _image;
File? imagepath;
String? imagename;
String? imagedata;
ImagePicker imagePicker = new ImagePicker ();

TextEditingController caption =TextEditingController();
TextEditingController price =TextEditingController();
TextEditingController description =TextEditingController();
TextEditingController category =TextEditingController();
TextEditingController colors =TextEditingController();
TextEditingController brand =TextEditingController();
TextEditingController sellingprice =TextEditingController();
TextEditingController quantity =TextEditingController();
  //final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
   var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
   imagepath= File(getimage!.path);
   setState(() {
    imagepath =File(getimage! .path);
    imagename=getimage.path.split('/').last;
    imagedata=base64Encode(imagepath!.readAsBytesSync());
    print(imagepath);
    print(imagename);
    print(imagedata);
   });
  }

  Future<void> uploadProduct() async{
    try{
      String uri="http://10.0.2.2/Exen_Limited/Api/products_add.php";
      var res= await http.post(Uri.parse(uri),body:
      {
        "caption":caption.text,
        "brand":brand.text,
        "category":category.text,
        "colors":colors.text,
        "description":description.text,
        "price":price.text,
        "sellingprice":sellingprice.text,
        "quantity":quantity.text,        
        "data": imagedata,
        "name": imagename,
      }
      );
      var response=jsonDecode(res.body);
      if(response["success"]=="true"){
        print("uploaded");
         ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product added succesfully')),
          );
           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Products();
              },
            ),
          );
      }
      else{
        print("not uploaded");
        print("not uploaded: ${response["message"]}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: ${response["message"]}')),
        );
      }

    }catch(e){
      print(e);
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child:Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     SizedBox(
                      height: 20,
                    ),
                    imagepath != null
                    ? Image.file(imagepath!)
                    :Text('choose an image'),
                     SizedBox(
                      height: 20,
                    ),
                     ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text('Upload Image'),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: caption,
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
                      controller: brand,
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
                      controller: description,
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
                      controller: colors,
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
                      controller: category,
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
                      controller: price,
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
                      controller: sellingprice,
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
                      controller: quantity,
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
                         onPressed: uploadProduct,
                         child: Text('Add',
                        style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                        ),
                        ),

                  ],
                )
                  ),
            ),
          );   
  }
}

class EditProduct extends StatefulWidget {
  final Map<String, dynamic> product;

  const EditProduct({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _brandController;
  late TextEditingController _categoryController;
  late TextEditingController _initialCostController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late TextEditingController _colorsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product['Product_Name']);
    _descriptionController = TextEditingController(text: widget.product['Product_Description']);
    _brandController = TextEditingController(text: widget.product['brand']);
    _categoryController = TextEditingController(text: widget.product['Category']);
    _initialCostController = TextEditingController(text: widget.product['Initial_Cost'].toString());
    _priceController = TextEditingController(text: widget.product['Product_Price'].toString());
    _quantityController = TextEditingController(text: widget.product['Quantity'].toString());
    _colorsController = TextEditingController(text: widget.product['Available_Colors']);
  }

  Future<void> _updateProduct() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2/Exen_Limited/Api/products_update.php'),
      body: {
        'Product_Id': widget.product['Product_Id'].toString(),
        'Product_Name': _nameController.text,
        'Product_Description': _descriptionController.text,
        'brand': _brandController.text,
        'Category': _categoryController.text,
        'Initial_Cost': _initialCostController.text,
        'Product_Price': _priceController.text,
        'Quantity': _quantityController.text,
        'Available_Colors': _colorsController.text,
      },
    );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      if (responseJson['success'] == "true") {
        Navigator.of(context).pop(true); // Return true to indicate success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${responseJson['message']}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update product')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Product Description'),
              ),
              TextField(
                controller: _brandController,
                decoration: InputDecoration(labelText: 'Brand'),
              ),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: _initialCostController,
                decoration: InputDecoration(labelText: 'Initial Cost'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Product Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _colorsController,
                decoration: InputDecoration(labelText: 'Available Colors'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProduct,
                child: Text('Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*class _AddProduct extends MaterialPageRoute<void> {

  File? _image;
File? imagepath;
String? imagename;
String? imagedata;
ImagePicker imagePicker = new ImagePicker ();
  //final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
   var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
   imagepath= File(getimage!.path);
  }
 

  _AddProduct()
  
      : super(builder: (BuildContext context) {
          var file = File;
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
                child: Form(                 
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,                  
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
              
                     SizedBox(
                      height: 20,
                    ),
                    imagepath ! null
                    ? Image.file(imagepath!)
                    :Text('choose an image'),
                     SizedBox(
                      height: 20,
                    ),
                     ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text('Upload Image'),
                    ),

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
            ),
          );
        });
        
          static pickImage(ImageSource gallery) {}
}

class _image {
}
*/
