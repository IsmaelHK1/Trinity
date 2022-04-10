import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trinity/Class/user.dart';


List<User> createGroupTest(){
  User user1 = User("bob" ,  Icons.account_circle);
  User user2 = User("bastien", Icons.account_circle_outlined);
  User user3 = User("robert", Icons.account_circle_outlined);
  User user4 = User("byu", Icons.account_circle_outlined);


  List<User> group = [user1, user2, user3];
  return group;

}

class PostGame_page extends StatelessWidget {

  const PostGame_page({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final group = createGroupTest();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(24,24,25,1.0),

      body: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children : <Widget> [
              /*Creer ta team */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin : EdgeInsets.only(top: 80),
                        padding : EdgeInsets.only(top : 20, bottom: 20, left: 40, right: 40),
                        child : const Center(
                            child: Text(
                              "Créer ta TEAM!!!",
                              style: TextStyle(color : Colors.cyan, fontSize: 20, fontFamily: 'Louis George Cafe Bold.ttf', fontWeight: FontWeight.bold),)
                        ),
                        decoration: BoxDecoration(
                          border : Border.all(
                            color: Colors.blue,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                    )
                  ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /* Icon inviter des amis*/
                    Container(
                      alignment: Alignment.center,
                      margin : EdgeInsets.only(top: 22),
                      width: 80.0,
                      height: 80.0,
                      decoration: const BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle
                      ),
                      child: const InkWell(
                        child: Icon(
                          Icons.person_add_alt_1_sharp,
                          size: 70,
                        ),
                      ),
                    ),

                  /* Inviter des amis */
                  Container(
                      margin: EdgeInsets.only(top : 10),
                      child: Text(
                          "Inviter des amis",
                          style: TextStyle(
                            color : Colors.cyan,
                            fontSize: 20,
                            fontFamily: 'Louis George Cafe Italic.ttf',)
                      )
                  )
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child : Container(
                      child : ListView.separated(
                        //padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                        itemCount: group.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            child : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                /*Icon user */
                                Container(
                                    width: 60.0,
                                    height: 60.0,
                                    margin : EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(
                                      group[index].icon,
                                      size : 50,

                                    ),
                                ),

                                    /* a rejoint le salon */
                                    Container(
                                      alignment: Alignment.center,
                                      width: 280.0,
                                      height: 40.0,
                                      child : Text(
                                        '${group[index].name} à rejoint votre salon',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Louis George Cafe.ttf',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color : Colors.purple,
                                      ),
                                    )
                              ],
                            )
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Stack(
                children: <Widget>[
                      Align(
                        alignment: Alignment.bottomRight,
                        child : Container(
                          alignment: Alignment.center,
                        margin : EdgeInsets.only(bottom: 70, top : 20),
                        width: 280,
                        height: 60,
                        child: Text(
                            'LANCER LE JEU',
                            style : TextStyle(
                                color: Colors.white,
                                fontSize: 37,
                                fontFamily: 'Louis George Cafe Bold.ttf',
                                fontWeight: FontWeight.bold)
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors : [Colors.grey, Colors.grey],
                            begin : Alignment.centerLeft,
                            end: Alignment.center,
                            tileMode: TileMode.decal,
                          ),
                          border: Border.all(
                            color: Colors.grey,
                            width: 6,
                        ),
                      ),
                    ),
                  ),
                    Container(
                    alignment: Alignment.topLeft,
                    width: 90.0,
                    height: 90,
                    margin: EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo_trinity.png'),
                        )
                    ),
                  )
                ],
              ),
            ],
        ),
        ),
      );
  }
}
