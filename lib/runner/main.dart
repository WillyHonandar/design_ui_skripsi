import 'package:aplikasi_tilang_training/pages/intro/intro_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// void main() => runApp(MyApp());

const supabaseUrl = 'https://pdoqnehdlyigvkvshjks.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNjQ0NDQ5OCwiZXhwIjoxOTUyMDIwNDk4fQ.qPC9a3IpZtd5XOKKIlNrpiGcCaFl8Gw6asLRaLtOj7A';
final client = SupabaseClient(supabaseUrl, supabaseKey);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(),
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Tilang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
