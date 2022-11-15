import 'package:c2_cliente_sebastian_jerez/providers/cabanasproviders.dart';
import 'package:c2_cliente_sebastian_jerez/pages/cabanas_agregar_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CabanasListarPage extends StatefulWidget {
  CabanasListarPage({Key? key}) : super(key: key);

  @override
  State<CabanasListarPage> createState() => _CabanasListarPageState();
}

class _CabanasListarPageState extends State<CabanasListarPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cabanas'),
      ),
      body: FutureBuilder(
        future: CabanasProvider().getCabanas(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1.3,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var cabana = snapshot.data[index];
              return Dismissible(
                key: ObjectKey(cabana),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.blue,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        MdiIcons.trashCan,
                        color: Colors.white,
                      ),
                      Text(
                        'Borrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  CabanasProvider().borrar(cabana['id']).then((fueBorrado) {
                    if (fueBorrado) {
                      snapshot.data.removeAt(index);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text('${cabana['id']} borrado :)'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text('No se puede borrar'),
                        ),
                      );
                    }
                  });
                },
                child: ListTile(
                  leading: Icon(MdiIcons.cube),
                  title: Text(cabana['Nombre']),
                  subtitle: Text('\$' + fPrecio.format(cabana['Precio'])),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => CabanasAgregarPage(),
          );
          Navigator.push(context, route).then((valor) {
            setState(() {});
          });
        },
      ),
    );
  }
}
