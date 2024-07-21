import "package:flutter/material.dart";
import 'package:app_compras/models/item.dart';
import 'package:app_compras/ui/adicionar_item.dart';

class ListaComprasTela extends StatefulWidget {
  const ListaComprasTela({super.key});

  @override
  State<ListaComprasTela> createState() => _ListaComprasTelaState();
}

class _ListaComprasTelaState extends State<ListaComprasTela> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: items.isEmpty
          ? Center(
              child: Text(
                'Nenhum item na lista',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(color: Colors.deepOrangeAccent),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    items[index].nome,
                    style: TextStyle(
                      decoration: items[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      items[index].isDone = !items[index].isDone;
                    });
                  },
                  leading: CircleAvatar(
                    backgroundColor:
                        items[index].isDone ? Colors.green : Colors.blueGrey,
                    child: Icon(
                      items[index].isDone ? Icons.done : Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: _adicionarItem,
      ),
    );
  }

  void _adicionarItem() async {
    final item = await showDialog<Item>(
      context:
          context,
      builder: (context) {
        return AdicionarItem();
      },
    );

    if (item != null) {
      setState(() {
        items.add(item);
      });
    }
  }
}
