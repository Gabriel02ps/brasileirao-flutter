import 'package:flutter/material.dart';
import '../models/time.dart';
import '../models/titulo.dart';

class AddTituloPage extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;

  AddTituloPage({required Key key, required this.time, required this.onSave})
      : super(key: key);

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Titulo'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: _ano,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ano',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o ano';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: TextFormField(
                    controller: _campeonato,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Campeonato',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o campeonato';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(24),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onSave(Titulo(
                              campeonato: _campeonato.text, ano: _ano.text));
                          Navigator.pop(context);
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check),
                          Text('Salvar'),
                        ],
                      )),
                ))
              ],
            )));
  }
}
