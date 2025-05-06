import 'package:flutter/material.dart';
import 'package:faker/faker.dart'; // Si aún no has importado faker, añádelo aquí.
import 'model/user.dart';

final faker = Faker(); // Asegúrate de que faker esté correctamente inicializado

class MyReorderableListView extends StatefulWidget {
  const MyReorderableListView({Key? key}) : super(key: key);

  @override
  State<MyReorderableListView> createState() => _MyReorderableListViewState();
}

class _MyReorderableListViewState extends State<MyReorderableListView> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    users = getUsers(); // Aquí se llama la función getUsers
  }

  // Función getUsers que devuelve la lista de usuarios
  List<User> getUsers() {
    return List.generate(
      10, // Aquí puedes generar el número de usuarios que desees
      (index) => User(
        name: faker.person.name(), // Faker genera un nombre aleatorio
        urlImage:
            'https://example.com/image.png', // Aquí puedes poner una URL de imagen válida
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ReorderableListView')),
      body: ReorderableListView.builder(
        itemCount: users.length,
        onReorder: (oldIndex, newIndex) => setState(() {
          final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
          final user = users.removeAt(oldIndex);
          users.insert(index, user);
        }),
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return buildUser(index, user);
        },
      ),
    );
  }

  Widget buildUser(int index, User user) {
    return ListTile(
      key: ValueKey(user),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.urlImage),
        radius: 30,
      ),
      title: Text(user.name),
    );
  }
}
