import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:globe_trans_app/config/themes.dart';
import 'package:globe_trans_app/features/register_feature/presentation/homescreen/home_screen.dart';
import 'package:globe_trans_app/features/shared/database_repository.dart';
import 'package:globe_trans_app/features/shared/mock_database.dart';
import 'package:globe_trans_app/firebase_options.dart';

// void main() async {
//   final repository = MockDatabase();
//   runApp(MyApp(repository: repository));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final repository = MockDatabase();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required DatabaseRepository repository});

  final DatabaseRepository repository = MockDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlobeTransMessage',
      theme: myTheme,
      home: HomeScreen(
        repository: repository,
      ),
    );
  }
}
