import 'package:drive/model/cars.dart';
import 'package:drive/model/users.dart';
import 'package:drive/pages/admin_ads.dart';
import 'package:drive/pages/admin_cars.dart';
import 'package:drive/pages/admin_users.dart';
import 'package:drive/pages/requestsss.dart';
import 'package:drive/provider/cars_provider.dart';
import 'package:drive/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Page { dashboard, manage }

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  //BrandService _brandService = BrandService();
  //CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: TextButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),
                      label: Text('Dashboard'))),
              Expanded(
                  child: TextButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                            _selectedPage == Page.manage ? active : notActive,
                      ),
                      label: Text('Manage'))),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    CarProviders carProvider = Provider.of<CarProviders>(context, listen: true);
    UsersProviders userProvider =
        Provider.of<UsersProviders>(context, listen: true);

    Future.delayed(Duration(seconds: 0), () async {
      carProvider.getCarsCollectionFromFirebase().then((value) {});
      userProvider.getusersCollectionFromFirebase().then((value) {});
    });
    List<Car> cars = carProvider.getCar;
    List<Users> users = userProvider.getUsers;
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  /*child: Text(
                      'Dashboard',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )*/
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addCar()),
                              );
                            },
                            child: SizedBox(
                                width: 260.0,
                                height: 260.0,
                                child: Card(
                                  color: Color.fromARGB(255, 21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/promote.png',
                                              width: 154.0,
                                            ),
                                            const SizedBox(height: 10.0),
                                            const Text('Cars',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                )),
                                            const SizedBox(height: 5.0),
                                            Text(
                                                cars.length.toString() +
                                                    ' Items',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w100))
                                          ],
                                        )),
                                  ),
                                ))),
                        // GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => addAds()),
                        //       );
                        //     },
                        //     child: SizedBox(
                        //         width: 160.0,
                        //         height: 160.0,
                        //         child: Card(
                        //           color: Color.fromARGB(255, 21, 21, 21),
                        //           elevation: 2.0,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(8.0)),
                        //           child: Center(
                        //             child: Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Column(
                        //                   children: [
                        //                     Image.asset(
                        //                       'assets/car-insurance.png',
                        //                       width: 64.0,
                        //                     ),
                        //                     const SizedBox(height: 10.0),
                        //                     const Text('ADs',
                        //                         style: TextStyle(
                        //                           color: Colors.white,
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 20.0,
                        //                         )),
                        //                     const SizedBox(height: 5.0),
                        //                     const Text('2 Items',
                        //                         style: TextStyle(
                        //                             color: Colors.white,
                        //                             fontWeight:
                        //                                 FontWeight.w100))
                        //                   ],
                        //                 )),
                        //           ),
                        //         ))),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addProfile()),
                              );
                            },
                            child: SizedBox(
                                width: 260.0,
                                height: 260.0,
                                child: Card(
                                  color: Color.fromARGB(255, 21, 21, 21),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/resume.png',
                                              width: 154.0,
                                            ),
                                            const SizedBox(height: 10.0),
                                            const Text('Users',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                )),
                                            const SizedBox(height: 5.0),
                                            Text(
                                                users.length.toString() +
                                                    ' Items',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w200))
                                          ],
                                        )),
                                  ),
                                )))
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        );
        break;
      //maryam
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Requests"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Request()),
                // );
              },
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }
}
