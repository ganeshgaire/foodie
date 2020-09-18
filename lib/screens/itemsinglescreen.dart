import 'package:flutter/material.dart';
import 'package:foodie/api/serverapi.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class  ItemSingleScreen extends StatefulWidget {
  final item;
  ItemSingleScreen({Key key, this.item}) : super(key: key);

  @override
  _ItemSingleScreenState createState() => _ItemSingleScreenState();
}

class _ItemSingleScreenState extends State<ItemSingleScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cart, child) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: mainColor),
                  child: FlatButton(
                      onPressed: () {
                        cart.addItem(
                            widget.item.id.toString(),
                            widget.item.name,
                            double.parse(widget.item.price),
                            widget.item.image);

                        final snackBar = SnackBar(
                            duration: const Duration(milliseconds: 1000),
                            backgroundColor: Colors.black87,
                            content: Text('Item added to cart.'));
                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      },
                      child: Text(
                        "Add to cart",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
              ),
       
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                return Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
              )),
          actions: [
            Icon(
              MdiIcons.bagPersonalOutline,
              color: mainColor,
            ),
            SizedBox(width: 5),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Hero(
                    tag: widget.item.name,
                    child: Container(
                                      height: 120,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(image: 
                                        NetworkImage(widget.item.image == null
                                            ? "https://www.freepngimg.com/thumb/food/1-2-food-free-png-image-thumb.png"
                                            : "${ServerApi.productsImageUrl}/${widget.item.image}",),
                                            fit: BoxFit.fill
                                              )

                                      ),
                                      
                                     
                                    ),
                     ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        child: Text(
                          widget.item.name,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40)),
                                                  child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child:Icon(MdiIcons.heart,color: Colors.red,)
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    child: Text(
                      "Price: Rs.${widget.item.price}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
             
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Text(
                      widget.item.detail == null ? 'No Details' : widget.item.detail,
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
                            
            ],
          ),
        ),
      );
    });
  }
}
