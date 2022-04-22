import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  // static const backcolor = Color(0x00181819);
  // static const titlecolor = Color(0x00002ce5);
  // static const textcolor = Color(0x0051e1e6);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(color: Color.fromARGB(255, 2, 19, 214)),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(221, 26, 26, 27),
          // leading: IconButton(
          //   icon: Icons.arrow_back,
          //   onPressed: () {  },
          // ),
        ),
        body: ListView.separated(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text('Notif',
                    style: TextStyle(color: Colors.blueGrey)),
                subtitle: Text('Vous avez une invitation',
                    style: TextStyle(color: Color.fromARGB(255, 20, 51, 59))),
                enabled: true,
                //onTap: Navigator.push(context, MaterialPageRoute(builder: (context) =>  NotificationsDetails()));,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 3),
      ),
    );
  }
}

class NotificationsDetails extends StatelessWidget {
  const NotificationsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Trinity',
                style: TextStyle(color: Color.fromARGB(255, 2, 19, 214)),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(221, 26, 26, 27),
            ),
            body: FittedBox(
              child: Container(
                width: 700,
                height: 700,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(100),
                decoration: BoxDecoration(
                    color: Colors.white60,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 53, 52, 50),
                          blurRadius: 2.0)
                    ]),
                child: Column(
                  children: [
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: TextStyle(color: Colors.black87)),
                    SizedBox(height: 16.0),
                    Image(image: AssetImage('assets/image/Bar-Img.jpg')),
                    SizedBox(height: 16.0),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 247, 236, 218))),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('11/Feb/2021 04:42 PM',
                          style: TextStyle(
                              color: Color.fromARGB(255, 247, 236, 218))),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add_task),
                onPressed: () {
                  print('You pressed the button.');
                })));
  }
}
