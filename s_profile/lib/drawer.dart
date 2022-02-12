import 'package:flutter/material.dart';
import 'main.dart';
import 'sedetails.dart';
//import 'screenscaling.dart';

class CmnDrawer extends StatelessWidget {
  const CmnDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              radius: 2.3,
              center: Alignment.topLeft,
              colors: <Color>[
                Color(0xF19616EC),
                Color(0xC99B3DA3),
              ]),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.mirror,
                      colors: <Color>[
                        Color(0xFF6C1B9B),
                        Color(0xFF46384E),
                      ]),
                ),
                child: Center(
                  child: Text(
                    "CoViQrR",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: const EdgeInsets.only(right: 10),
                shadowColor: const Color(0xFF501474),
                color: Colors.transparent,
                child: ListTile(
                  title: const Text('Visited Data',
                      style: TextStyle(color: Color(0xFFFFFFFF))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                          title: 'profile',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: const EdgeInsets.only(right: 10),
                shadowColor: const Color(0xFF501474),
                color: Colors.transparent,
                child: ListTile(
                  title: const Text('Profile',
                      style: TextStyle(color: Color(0xFFFFFFFF))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sedetails(),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Card(
            //     margin: EdgeInsets.only(right: 10),
            //     shadowColor: Color(0xFF501474),
            //     color: Colors.transparent,
            //     child: ListTile(
            //       title:
            //           Text('Help', style: TextStyle(color: Color(0xFFFFFFFF))),
            //       onTap: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => Help()));
            //       },
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Card(
            //     margin: EdgeInsets.only(right: 10),
            //     shadowColor: Color(0xFF501474),
            //     color: Colors.transparent,
            //     child: ListTile(
            //       title: Text('About Developers',
            //           style: TextStyle(color: Color(0xFFFFFFFF))),
            //       onTap: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => AboutUs()));
            //       },
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Card(
            //     margin: EdgeInsets.only(right: 10),
            //     shadowColor: Color(0xFF501474),
            //     color: Colors.transparent,
            //     child: ListTile(
            //       title: Text('Change Vaccination status',
            //           style: TextStyle(color: Color(0xFFFFFFFF))),
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => VaccinationStatus(),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Card(
            //     margin: EdgeInsets.only(right: 10),
            //     shadowColor: Color(0xFF501474),
            //     color: Colors.transparent,
            //     child: ListTile(
            //       title: Text('Log out',
            //           style: TextStyle(color: Color(0xFFFFFFFF))),
            //       onTap: () async {
            //         //signout
            //         //Go to main page
            //         // Navigator.pushAndRemoveUntil(
            //         //     context,
            //         //     MaterialPageRoute(builder: (context) => ChoosingPage()),
            //         //     (route) => false);
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
