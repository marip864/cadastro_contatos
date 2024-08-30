import 'package:cadastro_contatos/contato.dart';
import 'package:cadastro_contatos/lista.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Contato> listaC = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController numTelefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos', style: TextStyle(fontFamily: 'New Amsterdam', color: Colors.white, fontSize: 30),),
        backgroundColor: Color.fromARGB(255, 132, 32, 154),
        centerTitle: true,
        toolbarHeight: 60,
        actions: [
          IconButton
          (
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Lista(listaC)));
            }, 
            icon: Icon(Icons.list),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 198, 246)!, Color.fromARGB(255, 0, 198, 246)!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: 
        Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset('assets/images/cadastro.png'),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: nomeController,
                decoration: InputDecoration(
                labelText: 'Nome completo',
                prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 38, 40, 166)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                errorStyle: TextStyle(color: Colors.white)
              ),
              validator: (value) 
              {
                if (value!.isEmpty) 
                {
                  return 'Por favor, insira o nome';
                }

                return null;
                
              },
                
            ),
            ),
            SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: numTelefoneController,
                decoration: InputDecoration(
                labelText: 'Número de Telefone',
                prefixIcon: Icon(Icons.phone, color: const Color.fromARGB(255, 38, 40, 166)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                errorStyle: TextStyle(color: Colors.white)
              ),
              validator: (value) 
              {
                if (value!.isEmpty) 
                {
                  return 'Por favor, insira o número de telefone';
                }

                return null;
                
              },
                
            ),
            ),
              
              
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                ElevatedButton(
                  onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        String nome = nomeController.text;
                        String numTelefone = numTelefoneController.text;
                        Contato c = Contato(nome, numTelefone,false);
                        listaC.add(c);
                        nomeController.text = '';
                        numTelefoneController.text = '';
                        setState(() {
                          
                        });
                      }
                    },
                  child: Text('Cadastrar', style: TextStyle(fontFamily: 'New Amsterdam', color: Colors.white, fontSize: 25),),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
                      backgroundColor: Color.fromARGB(255, 140, 38, 166),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                      nomeController.text = '';
                      numTelefoneController.text = '';
                      setState(() {
                          
                      });
                  },
                  child: Text('Limpar', style: TextStyle(fontFamily: 'New Amsterdam', color: Colors.white, fontSize: 25),),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
                      backgroundColor: Color.fromARGB(255, 140, 38, 166),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                ),
              ],
            ),
            
            ],
          ),
        ),
      ),
    );
  }
}