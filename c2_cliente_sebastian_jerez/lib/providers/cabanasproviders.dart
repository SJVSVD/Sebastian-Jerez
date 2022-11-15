import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CabanasProvider {
  final apiURL = 'http://127.0.0.1:8000/api';

  Future<List<dynamic>> getCabanas() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/Cabanas'));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregar(
      String nombre, String descripcion, String direccion, int precio) async {
    var respuesta = await http.post(Uri.parse(apiURL + '/Cabanas'),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'Nombre': nombre,
          'Descripcion': descripcion,
          'Direccion': direccion,
          'Precio': precio,
        }));
    return json.decode(respuesta.body);
  }

  Future<bool> borrar(int numero) async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/Cabanas/' + numero.toString()));
    return respuesta.statusCode == 200;
  }

  Future<LinkedHashMap<String, dynamic>> editar(int id, String nombre,
      String descripcion, String direccion, int precio) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/Cabanas/' + id.toString()),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre,
        'descripcion': descripcion,
        'direccion': direccion,
        'precio': precio,
      }),
    );
    return json.decode(respuesta.body);
  }
}
