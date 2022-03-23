import 'package:aplikasi_tilang_training/Authentication/login.dart';
import 'package:aplikasi_tilang_training/Authentication/registration.dart';
import 'package:aplikasi_tilang_training/Pages/Navbar/Home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  User user;

  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    if (user != null) {
      return MyHomePage();
    } else {
      return MaterialApp(
        title: 'Introduction screen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: OnBoardingPage(),
      );
    }
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 17.0, height: 1.5);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 50),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Cek tilang dengan mudah!",
          body:
              "Melalui aplikasi tilang, anda dapat melakukan pengecekan tanpa perlu mengunjungi website resmi kami",
          image: _buildImage('walkthrough-img-1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Notifikasi Tilang",
          body:
              "Dapatkan notifikasi tilang langsung dari smartphone anda, tidak lagi menggunakan metode kirim surat",
          image: _buildImage('walkthrough-img-2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Informasi dan berita terbaru seputar ETLE!",
          body:
              "Selalu update dengan informasi terkini langsung dari aplikasi tilang",
          image: _buildImage('walkthrough-img-3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Registrasi atau Login",
          body: "Anda memerlukan akun untuk dapat mengakses ke halaman utama",
          image: _buildImage('etle-logo.png'),
          footer: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(0);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                },
                child: const Text(
                  'Registrasi Sekarang',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text('Sudah punya akun? Login'),
              )
            ],
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {},
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(25),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
