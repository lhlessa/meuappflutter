import 'package:app/services/pessoa_repository.dart';
import 'package:app/shared/models/pessoa.dart';
import 'package:app/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController pesoController = TextEditingController(text: "");
  final TextEditingController alturaController =
      TextEditingController(text: "");
  final TextEditingController imcController = TextEditingController();
  final TextEditingController nomeController = TextEditingController(text: "");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            appBar: AppBar(
              // TRY THIS: Try changing the color here to a specific color (to
              // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
              // change color while the other colors stay the same.
              backgroundColor: Colors.blueGrey,
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
            ),
            body: Stack(children: [
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        TextFieldWidget(
                          hintText: "Nome",
                          labelText: "Digite seu nome",
                          readStatus: false,
                          textController: nomeController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo não pode estar vazio';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {}); // Para atualizar a validação
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFieldWidget(
                          hintText: "Peso",
                          labelText: "Digite seu peso",
                          readStatus: false,
                          textController: pesoController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\,?\d*)'))
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo não pode estar vazio';
                            }
                            if (double.tryParse(value.replaceAll(',', '.')) ==
                                null) {
                              return 'Digite um número válido';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {}); // Para atualizar a validação
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFieldWidget(
                          hintText: "Altura",
                          labelText: "Digite sua altura",
                          readStatus: false,
                          textController: alturaController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\,?\d*)'))
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo não pode estar vazio';
                            }
                            if (double.tryParse(value.replaceAll(',', '.')) ==
                                null) {
                              return 'Digite um número válido';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {}); // Para atualizar a validação
                          },
                        ),
                        //const SizedBox(height: 20),
                      ]),
                    )),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 50,
                left: MediaQuery.of(context).size.width / 14,
                child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        // Dados válidos, realizar cálculo e atualizar IMC
                        String nome = nomeController.text;
                        double peso = double.parse(
                            pesoController.text.replaceAll(',', '.'));
                        double altura = double.parse(
                            alturaController.text.replaceAll(',', '.'));
                        var pessoa = Pessoa(nome, peso, altura);
                        imcController.text = pessoa.resultadoIMC(peso, altura)!;
                        nomeController.text = "";
                        pesoController.text = "";
                        alturaController.text = "";
                        PessoaRepository.adicionarPessoas(pessoa);
                        showDialog(
                            context: context,
                            builder: (BuildContext bc) {
                              return AlertDialog(
                                  title: const Text("Lista de Registros"),
                                  content: SizedBox(
                                      width: double.maxFinite,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children:
                                            PessoaRepository.obterDadosPessoas()
                                                .map((dados) => ListTile(
                                                      title: Text(dados),
                                                    ))
                                                .toList(),
                                      )));
                            });
                      }
                    }),
              )
            ])));
  }
}
