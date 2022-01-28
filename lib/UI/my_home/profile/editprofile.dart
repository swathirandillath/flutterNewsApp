import 'package:NewsApp/UI/my_home/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    showDialog() {
      return showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Upload image\nSelect Source',
                          style: TextStyle(
                              color: Color(0xFFA2A2A2),
                              fontSize: 15),
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 60,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Gallery',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 15,
                              ),
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Camera',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 15,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:15,right: 15,top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 18,
                                  ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 35,
              height: 182,
              width: 395,
              child: Container(
                color:Colors.pink,
              ),
            ),
            Positioned(
              top: 28,
              left: 0,
              child: IconButton(
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
            Positioned(
                height: 150,
                width: 150,
                top: 142,
                left: 113,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(75))),
                    child: Image.asset(
                        'assets/images/profile_pic.png'))),
            Positioned(
              top: 252,
              left: 229,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xffffffff),
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    showDialog();
                  },
                ),
              ),
            ),
            const Positioned(
              width: 345.5,
              top: 350,
              left: 15,
              child: TextField(
                  style: TextStyle(color: Colors.pinkAccent),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Name',
                    labelStyle: TextStyle(color:Colors.pink,)
                  )),),
            const Positioned(
                width: 345.5,
                top: 456.5,
                left: 15,
                child: TextField(
                  style: TextStyle(color: Colors.pink),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color:Colors.pink)),

                )),
            Positioned(
                width: 395,
                height: 65,
                top: 747,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,),
                  onPressed: () {},
                  child: const Text('Save'),
                ))
          ],
        ));
  }
}

