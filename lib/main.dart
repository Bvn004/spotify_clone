import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify_clone/config/theme/apptheme.dart';
import 'package:spotify_clone/screens/mode_choose/bloc/theme_cubit.dart';
import 'package:spotify_clone/screens/signinorsignup.dart';
import 'package:spotify_clone/screens/splashscreen.dart';
import 'package:path_provider/path_provider.dart'; // Import path_provider

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(), // Use getApplicationDocumentsDirectory for non-web platforms
  );
  HydratedBloc.storage = storage;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Set the HydratedBloc storage
  runApp(const MyApp()); // Run the MyApp widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(), // Provide the ThemeCubit
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: Apptheme.Lighttheme, // Define the light theme
          darkTheme: Apptheme.darktheme, // Define the dark theme
          themeMode: mode, // Use the theme mode from the ThemeCubit
          debugShowCheckedModeBanner: false, // Disable the debug banner
          home: Splashscreen(), // Set the home screen
        ),
      ),
    );
  }
}
