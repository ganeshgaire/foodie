import 'package:flutter/material.dart';
import 'package:foodie/config/config.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class DealSingleScreen extends StatefulWidget {
  final deal;
  DealSingleScreen({Key key, this.deal}) : super(key: key);

  @override
  _DealSingleScreenState createState() => _DealSingleScreenState();
}

class _DealSingleScreenState extends State<DealSingleScreen> {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context,cart,child){
return  Scaffold(
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
                Icon(MdiIcons.bagPersonalOutline,color:mainColor,),
                SizedBox(width:5),
              ],
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Hero(
                      tag: widget.deal.name,
                      child: Image.network(widget.deal.image)),
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
                          widget.deal.name,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Rs. ${widget.deal.price.toString()}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[50]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.remove_circle_outline,
                            color: mainColor,
                          ),
                        ),
                        Text("1"),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.add_circle_outline,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Container(
                    child: Text(
                      "Detail",
                      style: TextStyle(fontSize: 20),
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
                      widget.deal.detail,
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: mainColor),
                  child: FlatButton(onPressed: () {
          
                                cart.addItem(
                                widget.deal.id.toString(),
                                widget.deal.name,
                                widget.deal.price,
                                widget.deal.image);

                                final snackBar = SnackBar(
                                  duration: const Duration(milliseconds: 1000),
                                  backgroundColor: Colors.black87,
                                  content: Text('Item added to cart.'));
                              _scaffoldKey.currentState.showSnackBar(snackBar);
                                     
                  }, child: Text("Add to cart",style: TextStyle(fontSize:20,color:Colors.white),)),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
      }
    );
  }
}
