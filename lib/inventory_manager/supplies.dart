import 'package:flutter/material.dart';

class Supplies extends StatefulWidget {
  const Supplies({super.key});

  @override
  State<Supplies> createState() => _SuppliesState();
}

class _SuppliesState extends State<Supplies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: const Text(
                'Supplies',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),



      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _AddSupply());
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}

class _AddSupply extends MaterialPageRoute<void> {
  _AddSupply()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Register new supply',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
              elevation: 1.0,
            ),

            /*
            `Supply_Id`, `Name`, `Description`,
             `Quantity`, `Price`, `metrics`, `Supplier_Id`, `Image`
            */
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
                        hintText: 'What is the name of supply',
                        labelText: 'Supply Name'
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'give a brief description of the supply',
                        labelText: 'Supply description',
                      ),
                      maxLines: 3,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        hintText: 'Units of measurement',
                        labelText: 'Supply metrics'
                      ),
                    ),

                       SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        hintText: ' Supply Quantity',
                        labelText: ' quantity'
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),  
                        filled: true,                      
                        hintText: 'What was the buying price of supply',
                        labelText: 'Buying price',
                        suffixText: 'Ksh',suffixStyle: TextStyle(color: Colors.green)
                      ),
                    ),

          




                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 4,
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
            )
          );
        });
}