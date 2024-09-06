import 'package:cadastro_contatos/contato.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  
  List<Contato> listaC = [];
  
  Lista(this.listaC, {super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  get listaC => this.listaC;
  bool preenchida = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar
      (
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 132, 32, 154),
        title: Text('Contatos cadastrados', style: TextStyle(color: Colors.white, fontFamily: 'New Amsterdam', fontSize: 30),), 
        centerTitle: true,
      ),
      
      body: Center(child: Column(children: [
        ListView.separated(
          shrinkWrap: true,
        separatorBuilder: (context, index)=>Divider(thickness: 3,),
        itemBuilder: (BuildContext context, int index) 
        {
          return ListTile(
            leading: CircleAvatar(child: Text(widget.listaC[index].nome[0], style: TextStyle(color: Color.fromARGB(255, 30, 5, 141)),), backgroundColor: Color.fromARGB(183, 163, 210, 249),),
            title: Text(widget.listaC[index].nome),
            subtitle: Text(widget.listaC[index].numTelefone),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(widget.listaC[index].favorito ? Icons.star : Icons.star_border_outlined),
                  color: widget.listaC[index].favorito ? Color.fromARGB(255, 132, 32, 154) : Colors.grey,
                  onPressed: () 
                  { 
                    setState(() {
                      widget.listaC[index].favorito = !widget.listaC[index].favorito;
                    });

                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.grey,),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context, index);
                  },
                ),
              ],
            ),
          );
        }, 
        itemCount: widget.listaC.length,
      ),
      SizedBox(height: 20,),
      ElevatedButton(
        onPressed: (){Navigator.pop(context);}, 
        child: Text('Voltar', style: TextStyle(fontFamily: 'New Amsterdam', color: Colors.white, fontSize: 25),),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
          backgroundColor: Color.fromARGB(255, 140, 38, 166),
          textStyle: TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),)
      ],
      ),
      ),

    );
  }
  void _showDeleteConfirmationDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmação", style: TextStyle(fontFamily: 'New Amsterdam', fontSize: 20, color: Color.fromARGB(255, 132, 32, 154),),),
        content: Text("Você tem certeza que deseja apagar este contato?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancelar", style: TextStyle(color:Color.fromARGB(255, 132, 32, 154),),),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
          TextButton(
            child: Text("Apagar", style: TextStyle(color:Color.fromARGB(255, 132, 32, 154),),),
            onPressed: () {
              setState(() {
                widget.listaC.removeAt(index);
              });
              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}
}