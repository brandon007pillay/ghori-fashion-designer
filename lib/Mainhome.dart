import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfd_official/pages/Happy.dart';
import 'package:gfd_official/pages/Updates.dart';
import 'package:gfd_official/pages/home.dart';
import 'package:gfd_official/pages/profile.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Mainhome extends StatefulWidget {
  @override
  _MainhomeState createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  int _currentIndex = 0;
  PageController _pageController;
  bool isloggedin = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ghori fashion designer'),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          title: Text('ghori fashion designer'),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            home(),
            updates(),
            happy(),
            profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text(
                '   learn',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              activeColor: Colors.lightGreen[500],
              inactiveColor: Colors.grey,
              icon: Icon(Icons.school)),
          BottomNavyBarItem(
              title: Text(
                '  Updates',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              activeColor: Colors.yellow[400],
              inactiveColor: Colors.grey,
              icon: Icon(Icons.notifications_active)),
          BottomNavyBarItem(
              title: Text(
                '   Happy',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              activeColor: Colors.lightGreen[500],
              inactiveColor: Colors.grey,
              icon: Icon(Icons.insert_emoticon)),
          BottomNavyBarItem(
              title: Text(
                '   Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              activeColor: Colors.blue[200],
              inactiveColor: Colors.grey,
              icon: Icon(Icons.person)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Courses'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text('Join now'),
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share App now"),
              onTap: (){
                Share.share('Aap bhi ghar bethe silai sikhe ghori fashion designer app se https://play.google.com/store/apps/details?id=com.ghorifashiondesigner.gfd_official');
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_contact_calendar),
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Rate us"),
              onTap: (){
                _launchURL();
              },
            )
          ],
        ),
      ),
    );
  }
  _launchURL() async {
    const url = 'https://play.google.com/store/apps/details?id=com.ghorifashiondesigner.silai_sikhe_ghar_bethe';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

