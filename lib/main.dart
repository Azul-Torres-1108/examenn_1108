import 'package:flutter/material.dart';
import 'pagina_SafeArea.dart';
import 'pagina_reorderable_list_view.dart';
import 'pagina_navigator_2.0.dart';
import 'pagina_fractionally_sizedbox.dart';
import 'pagina_stateful_builder.dart';
import 'pagina_orientation_builder.dart';
import '103_value_notifier/pagina_value_notifier.dart';
import '105_listener/listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla Única',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB2DFDB), // Color pastel
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              'Mederyth Azul Torres',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '22308051281108',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                for (var i = 1; i <= 8; i++) ...[
                  // Limité a 8 botones
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            switch (i) {
                              case 1:
                                return const MySafeArea();
                              case 2:
                                return const MyReorderableListView();
                              case 3:
                                return const MyNavigator2();
                              case 4:
                                return const MyFractionallySizedBox();
                              case 5:
                                return const MyStatefulBuilder();
                              case 6:
                                return const MyOrientationBuilder();
                              case 7:
                                return const MyValueNotifier();
                              case 8:
                                return const MyListener();
                              default:
                                return const MySafeArea();
                            }
                          },
                        ),
                      );
                    },
                    child: Text('Ir a Pantalla $i'),
                  ),
                  const SizedBox(height: 5),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
