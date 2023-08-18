import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:providerrr/provider.dart';
import 'package:providerrr/result.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List images=[
    'images/apple.png',
    'images/banana.png',
    'images/grapes.png',
    'images/kiwi.png',
    'images/mango.png',

    'images/m.png'
  ];
  List name=['Apple','Banana','Grapes','Kiwi','Mango','WaterMelon'];
  List unit=['Kg','Doz','Kg','Pc','Doz','Kg',];
  List price=['20','10','8','40','30','25'];

  @override
  Widget build(BuildContext context) {

    final object= Provider.of<ProviderClass>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
        actions: [Padding(padding: EdgeInsets.only(right: 12),
          child: IconButton(icon: Icon(Icons.shopping_cart,size: 30,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultCart()));
            },
          ),
        )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.113,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(images[index],width: 90,height: 90,),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Name : ',style: TextStyle(fontSize: 16),),
                            Text(name[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('Unit : ',style: TextStyle(fontSize: 16),),
                            Text(unit[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('Price : \$ ',style: TextStyle(fontSize: 16),),
                            Text(price[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: (){
                              object.add_to_cart(images[index], name[index], price[index], unit[index]);
                            },
                            child: Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey.shade900,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              fixedSize: Size(105, 27),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
