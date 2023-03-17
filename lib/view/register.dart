import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String password, email;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  bool isVisible;
  Icon visibleIcon;
  bool rememberMe;

  @override
  void initState() {
    super.initState();
    password = "";
    email = "";
    isVisible = true;
    visibleIcon =
        isVisible == true ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
    // if (Platform.isIOS) {
    //   iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
    //     print(data);
    //     _saveDeviceToken();
    //   });

    //   _fcm.requestNotificationPermissions(IosNotificationSettings());
    // } else {
    //   _saveDeviceToken();
    // }
  }

  @override
  Widget build(BuildContext context) {
    // _handleMessages(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Chat App'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: TextFormField(
                // initialValue:
                //   rememberMe == true ? password : "",
                // obscureText: isVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  border: OutlineInputBorder(),
                  // suffixIcon: IconButton(
                  // icon: visibleIcon,
                  // onPressed: () {
                  // setState(() {
                  //   isVisible = !isVisible;
                  //   visibleIcon = isVisible == true
                  //       ? Icon(Icons.visibility)
                  //       : Icon(Icons.visibility_off);
                  // });
                  //   },
                  // )
                ),
                onChanged: (input) {
                  setState(() {
                    email = input;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: TextFormField(
                // initialValue:
                //   rememberMe == true ? password : "",
                obscureText: isVisible,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: visibleIcon,
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                          visibleIcon = isVisible == true
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off);
                        });
                      },
                    )),
                onChanged: (input) {
                  setState(() {
                    password = input;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.deepPurple[300],
              child: MaterialButton(
                onPressed: () async {
                  // FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: email, password: password)
                  //     .then((signedInUser) {
                  //   _firestore
                  //       .collection('users')
                  //       .add({'email': email, 'pass': password}).then((value) {
                  //     Navigator.pushNamed(context, '/homePage');
                  //   });
                  // }).catchError((e) {
                  //   print(e);
                  // });
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newuser != null) {
                      Navigator.pushNamed(context, '/homePage');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
