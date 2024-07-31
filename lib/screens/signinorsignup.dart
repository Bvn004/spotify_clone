import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/butttons/button.dart';
import 'package:spotify_clone/config/appbar/appbar.dart';
import 'package:spotify_clone/helpers/isdarkmode.dart';
import 'package:spotify_clone/screens/signin_ui_actual.dart';
import 'package:spotify_clone/screens/signup-register.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Appbarr(),
          // Positioned at the top right
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset("assets/vectors/Union.svg"),
          ),
          // Positioned at the bottom left
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/images/bille_siginin_page.png"),
          ),
          // Positioned at the bottom right
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset("assets/vectors/Union2.svg"),
          ),
          // Centered elements with padding
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/vectors/Vector.svg"),
                const SizedBox(height: 30),
                const Text(
                  "Enjoy Listening to Music",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Spotify is a proprietary Swedish audio streaming and media services provider",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Primarybutton(
                        onpressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SignupPage()));
                        },
                        text: "Register",
                        height: 73,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SigninUiActual()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: context.isDarkmode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
