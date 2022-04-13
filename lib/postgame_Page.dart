import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trinity/Class/user.dart';

// utiliser pour creer des utilisateur fake
//List<UserData> createGroupTest(){
  //UserData user1 = UserData("opozi",'Isma','isma@123.com','271201','Developper');
  //UserData user2 = UserData("bastien", Icons.account_circle_outlined);
  //UserData user3 = UserData("robert", Icons.account_circle_outlined);
  //UserData user4 = UserData("byu", Icons.account_circle_outlined);
  //UserData user5 = UserData("marchestp", Icons.account_circle_outlined);
  //UserData user6 = UserData("marchestp x2", Icons.account_circle_outlined);
  //UserData user7 = UserData("marchestp x2", Icons.account_circle_outlined);

  // on ne peut ajouter que 4 personne sinon gros beug : /

 // List<UserData> group = [user1];
  //return group;

//}

class PostGame_page extends StatelessWidget {

  const PostGame_page({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  //  final group = createGroupTest();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(24,24,25,1.0),

      body: Center(

        child : ListView(
          shrinkWrap: true,
          children : <Widget> [
            /*Creer ta team */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin : EdgeInsets.only(top: 5),
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
                    margin : EdgeInsets.only(top: 20),
                    width: 80.0,
                    height: 80.0,
                    decoration: const BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>_buildPopupDialog(context)
                        );
                      },
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
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                            child : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                /*Icon user */
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  margin : EdgeInsets.only( bottom: 10, left : 17),
                                  decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(
                                    Icons.account_balance,
                                    size : 50,

                                  ),
                                ),

                                /* a rejoint le salon */
                                Container(
                                  alignment: Alignment.center,
                                  width: 280.0,
                                  height: 40.0,
                                  child : Text(
                                    'ismael a rejoint votre salon',
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
            /**ici **/
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child : Container(
                    alignment: Alignment.center,
                    margin : EdgeInsets.only(bottom: 0, top : 20),
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


Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Cherche un utilisteur'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Container(
        width: double.infinity,
        height: 40,
        color: Colors.white,
          child: Center(
            child: TextField(
            decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),),
            )
          )
      )
      ],),
    actions: <Widget>[
       TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close', style: TextStyle(color: Colors.blue),),
      ),
    ],
  );
}

