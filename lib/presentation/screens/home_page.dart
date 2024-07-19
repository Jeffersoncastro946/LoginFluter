import 'package:flutter/material.dart';

// Página de inicio que recibe el nombre del usuario
class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      drawer: MyDrawer(userName: userName),
      body: Center(
        child: Text('Bienvenido, $userName'),
      ),
    );
  }
}

// Drawer modificado para mostrar el nombre del usuario
class MyDrawer extends StatelessWidget {
  final String userName;

  const MyDrawer({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(userName),
                  accountEmail: const Text(''),
                  currentAccountPicture: CircleAvatar(
                    child: Text(
                      userName[0],
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.movie),
                  title: const Text('My Animes'),
                  onTap: () {
                    // Acción para navegar a My Animes
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.search),
                  title: const Text('Search Animes'),
                  onTap: () {
                    // Acción para navegar a Search Animes
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bar_chart),
                  title: const Text('View Statistics'),
                  onTap: () {
                    // Acción para navegar a View Statistics
                  },
                ),
                // Otros elementos de navegación
              ],
            ),
          ),
          const Divider(), // Opcional: agrega un divisor antes del logout
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Acción para cerrar sesión
              Navigator.of(context).pop(); // el drawer
              Navigator.of(context).pop(); // el drawer
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text('v1.01', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
