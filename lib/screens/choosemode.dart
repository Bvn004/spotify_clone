import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:spotify_clone/butttons/button.dart';
import 'package:spotify_clone/screens/mode_choose/bloc/theme_cubit.dart';
import 'package:spotify_clone/screens/signinorsignup.dart';

class Choosemode extends StatefulWidget {
  const Choosemode({super.key});

  @override
  State<Choosemode> createState() => _ChoosemodeState();
}

class _ChoosemodeState extends State<Choosemode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/image2.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(40)),
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset("assets/vectors/Vector.svg")),
                Spacer(),
                const Text(
                  "Choose mode",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 73,
                            height: 73,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 79, 79, 79)
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(40)),
                            child: SvgPicture.asset(
                              "assets/vectors/Moon.svg",
                              width: 50,
                              height: 50,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 73,
                            height: 73,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 79, 79, 79)
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(40)),
                            child: SvgPicture.asset(
                              "assets/vectors/Sun 1.svg",
                              width: 30,
                              height: 30,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Primarybutton(
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SigninPage()));
                      },
                      text: "Continue",
                      height: 92),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
