import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/pages/time_page.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Brasileirão', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext context, int time) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[time].brasao),
            title: Text(tabela[time].nome),
            trailing: Text(tabela[time].pontos.toString()),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TimePage(key: Key(tabela[time].nome), time: tabela[time]))),
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}