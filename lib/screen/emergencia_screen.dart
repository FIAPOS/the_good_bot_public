import 'package:flutter/material.dart';
import 'package:the_good_bot/models/contato_model.dart';
import 'package:the_good_bot/repository/contato_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergenciaScreen extends StatefulWidget {
  @override
  _EmergenciaScreenState createState() => _EmergenciaScreenState();
}

class _EmergenciaScreenState extends State<EmergenciaScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ContatoRepository contatoRepository = ContatoRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        iconTheme: new IconThemeData(color: Colors.grey[700]),
        title: Text(
          "Emergência",
          style: new TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: FutureBuilder<List>(
        future: contatoRepository.findAll(),
        builder: (context, snapshot) {
          // Se não houver nenhum usuario cadastrado no SQFLite apresenta a mensagem
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length > 0) {
              return buildListView(snapshot.data);
            } else {
              return Center(
                child: Text("Nenhum contato cadastrado!"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      backgroundColor: Colors.grey[200],
      //botão flutuante para criar um novo contato
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
        onPressed: () async {
          var retorno = await Navigator.pushNamed(context, "/novo");

          if (retorno != null) {
            setState(() {});

            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(retorno),
              ),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<ContatoModel> contatos) {
    return ListView.builder(
      itemCount: contatos == null ? 0 : contatos.length,
      itemBuilder: (BuildContext ctx, int index) {
        //swipe a direita para excluir contato
        return Dismissible(
          key: Key(contatos[index].id.toString()),
          child: cardContato(contatos[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            print(direction);
            contatoRepository.deleteRaw(contatos[index]);
            setState(() {});
          },
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.pink[500],
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  //Criação do card de contato criado
  Card cardContato(ContatoModel contatos) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

          title: Text(
            contatos.nome,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text(
                    contatos.telefone,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.phone,
            color: Colors.black,
            size: 30.0,
          ),
          //redireciona para a função nativa de ligação do celular
          onTap: () => launch("tel://" + contatos.telefone),
        ),
      ),
    );
  }
}
