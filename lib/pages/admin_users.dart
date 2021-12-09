import 'package:flutter/material.dart';
import 'package:drive/model/users.dart';
import 'package:drive/model/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:drive/theme/colors.dart';

class Admin_User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
          titleSpacing: 0.0,
          toolbarHeight: 200,
          title: Image.network(
            "https://9to5mac.com/wp-content/uploads/sites/6/2019/11/how-to-quickly-select-move-delete-notes-iphone-ipad-two-finger-tap.jpeg?quality=82&strip=all",
            fit: BoxFit.cover,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UsersProviders>(
          builder: (context, UsersProviders data, child) {
            return data.getUsers.length != 0
                ? ListView.builder(
                    itemCount: data.getUsers.length,
                    itemBuilder: (context, index) {
                      return CardList(data.getUsers[index], index);
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Center(
                        child: Text(
                      "Add New Users",
                      style: TextStyle(
                        color: white,
                      ),
                    )));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final Users users;
  int index;

  CardList(this.users, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              )),
          child: ListTile(
            leading: Icon(Icons.note),
            title: Text(users.name),
            subtitle: Text(users.email),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
            ),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                print("HELLO DELETED");
                Provider.of<UsersProviders>(context, listen: false)
                    .removeUsers(index);
              }),
        ],
      ),
    );
  }
}
