import 'package:flutter/material.dart';
import 'package:the_good_bot/models/contato_model.dart';
import 'package:the_good_bot/repository/contato_repository.dart';

class ContatosNovoScreen extends StatefulWidget {
  @override
  _ContatosNovoScreenState createState() => _ContatosNovoScreenState();
}

class _ContatosNovoScreenState extends State<ContatosNovoScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ContatoModel contatoModel = new ContatoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: new IconThemeData(color: Colors.grey[700]),
        title: Text(
          "Novo Contato",
          style: new TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          //Formulario de criação de contato
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Nome',
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Nome';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      contatoModel.nome = value;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.date_range),
                      hintText: 'Telefone',
                      labelText: 'Telefone',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Telefone';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      contatoModel.telefone = value;
                    },
                  ),
                  //Grava o contato no banco de dados com SQFlite
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      child: Text("Salvar"),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();

                          new ContatoRepository().createRaw(contatoModel);

                          var mensagem = 'Eba!, agora ' +
                              contatoModel.nome +
                              ' pode ser utilizado numa emergência';

                          Navigator.pop(
                            context,
                            mensagem,
                          );
                        } else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não foi possível gravar.',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
