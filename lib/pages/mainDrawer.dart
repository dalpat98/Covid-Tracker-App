import 'package:flutter/material.dart';
import 'package:covidtracker/pages/aboutusloadingpage.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.grey[800],
            child: Padding(
              child: Image.asset('Assets/Images/COVID-19.jpg'),
              padding: EdgeInsets.all(5.0),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_box,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    Text(
                      '    About Us',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsloadingpage(
                        page: 'aboutus',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      size: 28,
                      color: Colors.grey[700],
                    ),
                    Text(
                      '   Contact Us',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsloadingpage(
                        page: 'contactus',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.copyright,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    Text(
                      '   Copyright',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsloadingpage(
                        page: 'copyright',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          SizedBox(
            height: 180,
          ),
          Center(
            child: Text('2020 \u00a9 Dalpat I , All Rights Reserved'),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
