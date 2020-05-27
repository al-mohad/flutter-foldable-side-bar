import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foldable Sidebar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus status;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FoldableSidebarBuilder(
          status: status,
          drawer: CustomDrawer(),
          screenContents: ExploreScreen(),
          
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              status = status == FSBStatus.FSB_OPEN
                  ? FSBStatus.FSB_CLOSE
                  : FSBStatus.FSB_OPEN;
            });
            print("FAB");
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  final data = [
    {
      "banner": "appex_banner",
      "title": "Youtube",
      "message": "Welcome to Youtube"
    },
    {
      "banner": "appex_banner",
      "title": "Stadia",
      "message": "Stadia Community Forums"
    },
    {
      "banner": "appex_banner",
      "title": "Youtube",
      "message": "PUBG Events Youtube"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 106, 0, 1.0),
            Color.fromRGBO(239, 9, 0, 121.0)
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            '',
            color: Colors.white30,
            fit: BoxFit.cover,
            scale: 10.0,
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.youtube_searched_for),
                            onPressed: null),
                        SizedBox(height: 10.0),
                        IconButton(icon: Icon(Icons.redeem), onPressed: null),
                      ],
                    ),
                  ),
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Stack(
                              children: <Widget>[
                                Image.asset('', fit: BoxFit.cover),
                                SizedBox.expand(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.pink, Colors.purple],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            data[index]['title'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            data[index]['message'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;
  CustomDrawer({this.closeDrawer});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200.0,
            color: Colors.grey.withAlpha(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  '',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10.0),
                Text('Almohad'),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ExploreScreen(),
                  ));
              closeDrawer();
            },
            leading: Icon(Icons.person),
            title: Text('Your Profile'),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ExploreScreen(),
                  ));
              closeDrawer();
            },
            leading: Icon(Icons.person),
            title: Text('Your Profile'),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ExploreScreen(),
                  ));
              closeDrawer();
            },
            leading: Icon(Icons.person),
            title: Text('Your Profile'),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ExploreScreen(),
                  ));
              closeDrawer();
            },
            leading: Icon(Icons.person),
            title: Text('Your Profile'),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
