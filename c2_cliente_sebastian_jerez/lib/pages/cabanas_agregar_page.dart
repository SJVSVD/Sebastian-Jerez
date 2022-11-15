import 'package:c2_cliente_sebastian_jerez/providers/cabanasproviders.dart';
import 'package:flutter/material.dart';

class CabanasAgregarPage extends StatefulWidget {
  CabanasAgregarPage({Key? key}) : super(key: key);

  @override
  State<CabanasAgregarPage> createState() => _CabanasAgregarPageState();
}

class _CabanasAgregarPageState extends State<CabanasAgregarPage> {
  TextEditingController NombreCtrl = TextEditingController();
  TextEditingController DescripcionCtrl = TextEditingController();
  TextEditingController DireccionCtrl = TextEditingController();
  TextEditingController PrecioCtrl = TextEditingController();

  String errNombre = '';
  String errDescripcion = '';
  String errDireccion = '';
  String errPrecio = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Cabaña'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              campoNombre(),
              mostrarError(errNombre),
              campoDescripcion(),
              mostrarError(errDescripcion),
              campoDireccion(),
              mostrarError(errDireccion),
              campoPrecio(),
              mostrarError(errPrecio),
              botonAgregar(),
            ],
          ),
        ),
      ),
    );
  }

  Container mostrarError(error) {
    return Container(
      width: double.infinity,
      child: Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  TextFormField campoNombre() {
    return TextFormField(
      controller: NombreCtrl,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      controller: DescripcionCtrl,
      decoration: InputDecoration(
        labelText: 'Descripcion',
      ),
    );
  }

  TextFormField campoDireccion() {
    return TextFormField(
      controller: DireccionCtrl,
      decoration: InputDecoration(
        labelText: 'Direccion',
      ),
    );
  }

  TextFormField campoPrecio() {
    return TextFormField(
      controller: PrecioCtrl,
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Container botonAgregar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text('Agregar Cabaña'),
          ],
        ),
        onPressed: () async {
          String nombre = NombreCtrl.text.trim();
          String descripcion = DescripcionCtrl.text.trim();
          String direccion = DireccionCtrl.text.trim();
          int precio = int.tryParse(PrecioCtrl.text.trim()) ?? 0;
          var respuesta = await CabanasProvider()
              .agregar(nombre, descripcion, direccion, precio);
          if (respuesta['message'] != null) {
            var errores = respuesta['errores'];
            errNombre = errores['nombre'] != null ? errores['nombre'][0] : '';
            errDescripcion =
                errores['descripcion'] != null ? errores['descripcion'][0] : '';
            errDireccion =
                errores['direccion'] != null ? errores['direccion'][0] : '';
            errPrecio = errores['precio'] != null ? errores['precio'][0] : '';

            setState(() {});
            return;
          }
          Navigator.pop(context);
        },
      ),
    );
  }
}
