import 'package:flutter/material.dart';
import 'package:foodie/config/config.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text("Edit Profile",style: TextStyle(color:Colors.grey),)
      ),
      body: ListView(
        children:[
          SizedBox(height:50),
           Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                     validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: "First Name",
                        prefixIcon: Icon(Icons.person_outline),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                     validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                         textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: "Last Name",
                        prefixIcon: Icon(Icons.person_outline),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                     validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter mobile no.';
                      } else if(value.length < 10 || value.length > 12){
                        return 'Enter valid mobile no.';
                      }
                      return null;
                    },
                         textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: "Mobile No.",
                        prefixIcon: Icon(Icons.phone_android),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                         textInputAction: TextInputAction.done,

                     validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        } 
                        return null;
                      },
                    decoration: InputDecoration(
                        hintText: "Your Email",
                        prefixIcon: Icon(Icons.email),
                       
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
    decoration:
        BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(25)),
    height: 50,
    width: double.infinity,
    child: FlatButton(
        onPressed: () {
         
        },
        child: Text(
          "SUBMIT",
          style: TextStyle(color: Colors.white, fontSize: 15),
        )),
  ),
              ),
        ]
      ),
    );
  }
}