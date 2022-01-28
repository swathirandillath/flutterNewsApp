import 'package:NewsApp/UI/notification/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'editprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/profile_pic.png'),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const Notifications()));
                                },
                                child: const Text(
                                  'You have 47 Notifications',
                                  style: TextStyle(
                                    color: Color(0xFF67697D),
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: Colors.red,
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfile()));
                                },
                                child: const Text('Edit Profile'),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
