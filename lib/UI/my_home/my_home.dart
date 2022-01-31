import 'package:NewsApp/UI/dashBoard/dash_board_view.dart';
import 'package:NewsApp/UI/my_home/profile/editprofile.dart';
import 'package:NewsApp/UI/my_home/profile/profile.dart';
import 'package:NewsApp/UI/notification/notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SegByte',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ///set bottom tab
  int _selectedIndex = 0;
  late bool _isShowList;

  static List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    _isShowList = true;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  String? email="",name="";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(750, 1334),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        email = user.email;
        name=user.displayName;
      }
    });


    Widget horizontalLine() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.black26.withOpacity(.2),
          ),
        );

    ///generating survey card
    Widget cardView() => Container(
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(14.0),
              color: Colors.white,
              elevation: 6.0,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onLongPress: () {},
                onTap: () {
                  setState(() {
                    _isShowList = false;
                    print("SHOW $_isShowList");
                  });
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ///Top Row contains image and details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                height: ScreenUtil().setHeight(150),
                                child: Image.asset(
                                    'assets/images/onBoarding_01.png')),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Dibetic Survey',
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize:
                                        ScreenUtil().setSp(30),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.start,
                                ),

                                ///Row start date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Start date',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize:
                                            ScreenUtil().setSp(30),
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      width:
                                          ScreenUtil().setWidth(50),
                                    ),
                                    Text(
                                      '01 july 2020',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize:
                                            ScreenUtil().setSp(30),
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),

                                ///Row end date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'End date',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize:
                                            ScreenUtil().setSp(30),
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      width:
                                          ScreenUtil().setWidth(50),
                                    ),
                                    Text(
                                      '10 july 2020',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize:
                                            ScreenUtil().setSp(30),
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),

                                ///Row participants
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Participants',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize:
                                            ScreenUtil().setSp(30),
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      width:
                                          ScreenUtil().setWidth(50),
                                    ),
                                    Text(
                                      '500',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize:
                                            ScreenUtil().setSp(30),
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),

                        ///Bottom container
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              horizontalLine(),
                              SizedBox(
                                height: ScreenUtil().setHeight(10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenUtil().setWidth(20),
                                  ),
                                  Text(
                                    'Mark as complete',
                                    style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize:
                                          ScreenUtil().setSp(30),
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

    ///generate graph card

    ///generate  top buttons for cardGraph
    ///set home tab view
    _widgetOptions = [
       DashBoardView(),
     const Notifications(),
   const ProfilePage()
    ];

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.blue)),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            'News',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(30),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          /*leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'menu',
            onPressed: () {},
          ),*/
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                tooltip: 'search',
                onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),

        ///navigation drawer
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  children: [
                    Container(
                      child: Image.asset('assets/images/profile_pic.png'),
                      height: ScreenUtil().setHeight(120),
                      width: ScreenUtil().setWidth(120),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                           name!,
                          style: TextStyle(
                            color: Colors.black
                          ),
                          /*  style: GoogleFonts.lato(
                              color: Colors.blue[800],
                              fontSize: ScreenUtil().setSp(30),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),*/
                          ),
                          Text(
                            email!,
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text(
                  'Account',
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EditProfile()));
                },
              ),

              ListTile(
                title: const Text(
                  'News',

                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyHomePage()));
                },
              ),
              ListTile(
                title: const Text(
                  'Notifications',
                ),
                onTap: () {
                  Navigator.pop(context);
                }
              ),

              ListTile(
                title: const Text(
                  'Settings',
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyHome()));
                },
              ),
            ],
          ),
        ),

        ///bottom navigation drawer
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

/*  PageController _pageController;
  //TabController _tabController;

  List<Widget> tabs = [
    MyHomeFeed(),
    MyHomeSearch(),
    NewTicket(),
    MyHomeNotification(),
    MyHomeProfile(),
  ];

  /// Indicating the current displayed page
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new Scaffold(

      body: tabs[_page],*/ /*TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
      ),*/ /*
      */ /*body: new PageView(children: [
         MyHomeFeed(),
         MyHomeSearch(),
        NewTicket(),
        MyHomeNotification(),
        MyHomeProfile(),
      ], controller: _pageController, onPageChanged: onPageChanged),*/ /*
      bottomNavigationBar: new BottomNavigationBar(

        type: BottomNavigationBarType.shifting,
        items: [
          new BottomNavigationBarItem(
            icon: _page == 0
                ? new Icon(
              Icons.home,
              color: Colors.black,
            )
                : new Icon(
              Icons.home,
              color: Colors.black38,
            ),
            title: new Text("Feeds", style: TextStyle(color: Colors.black38)),
          ),
          new BottomNavigationBarItem(
            icon: _page == 1
                ? new Icon(
              Icons.search,
              color: Colors.black,
            )
                : new Icon(
              Icons.search,
              color: Colors.black38,
            ),
            title: new Text("Search", style: TextStyle(color: Colors.black38)),
          ),
          new BottomNavigationBarItem(
            icon: _page == 2
                ? new Icon(
              Icons.add_box,
              color: Colors.black,
            )
                : new Icon(
              Icons.add,
              color: Colors.black38,
            ),
            title: new Text("Add", style: TextStyle(color: Colors.black38)),
          ),
          new BottomNavigationBarItem(
            icon: _page == 3
                ? new Icon(
              Icons.notifications,
              color: Colors.black,
            )
                : new Icon(
              Icons.notifications_none,
              color: Colors.black38,
            ),
            title: new Text("Notifications",
                style: TextStyle(color: Colors.black38)),
          ),
          new BottomNavigationBarItem(
            icon: _page == 4
                ? new Icon(
              Icons.person,
              color: Colors.black,
            )
                : new Icon(
              Icons.person_outline,
              color: Colors.black38,
            ),
            title: new Text("Profile", style: TextStyle(color: Colors.black38)),
          )
        ],
        onTap: navigationTapped,
        currentIndex: _page,
        iconSize: 30,
      ),
    );
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
   */ /* _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);*/ /*
    setState(() {
      this._page = page;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    //_tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }*/
}
