import 'package:flutter/services.dart';


class ComunicacaoNativaViewModel {
  
  static const platform = MethodChannel('com.example.tarefa_methodchannel/channel');

  Future<void> mostrarToastNativo() async {
    try {
      final String mensagem = "Teste";
      await platform.invokeMethod('showToast', {'message': mensagem});
    } on PlatformException catch (e) {
      print("Falha ao exibir o Toast: '${e.message}'.");
    }
  }

  Future<void> mostrarAlertDialogNativo() async {
    try {
      final Map<String, String> arguments = {
        'title': 'Testando',
        'message': 'Funcionando',
      };
      await platform.invokeMethod('showAlertDialog', arguments);
    } on PlatformException catch (e) {
      print("Falha ao exibir o AlertDialog: '${e.message}'.");
    }
  }
}