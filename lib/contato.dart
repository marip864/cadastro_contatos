class Contato
{
  String _nome = '';
  String _numTelefone = '';
  bool _favorito = false;

  Contato(this._nome,this._numTelefone,this._favorito);

  String get nome => this._nome;

  set nome(String value) => this._nome = value;

  get numTelefone => this._numTelefone;

  set numTelefone( value) => this._numTelefone = value;

  bool get favorito => this._favorito;

 set favorito(bool value) => this._favorito = value;
}