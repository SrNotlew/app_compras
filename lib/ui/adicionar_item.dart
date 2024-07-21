import 'package:flutter/material.dart'; 
import 'package:app_compras/models/item.dart';

class AdicionarItem extends StatelessWidget {
  final textoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Item'),
      
      content: TextField(
        autofocus: true, 
        controller: textoController,
        decoration: InputDecoration(
          hintText: 'Digite o nome do item',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
            child: Text('Adicionar'),
            onPressed: () {
              final item = Item(nome: textoController.value.text);
              textoController.clear();
              Navigator.of(context).pop(item);
            }
        ),
      ],
    );
  }
}
