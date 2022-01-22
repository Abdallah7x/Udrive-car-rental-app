void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroundMessage);

  runApp(MaterialApp(
    theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
    debugShowCheckedModeBanner: false,
    home: productPage(),
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarProviders()),
         ChangeNotifierProvider(create: (_) => UsersProviders()),
         ChangeNotifierProvider(create: (_) => AdsProviders()),
      ],
      child: MyApp(),
    ),
  );
}
