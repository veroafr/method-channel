import 'package:flutter/material.dart';
import '../viewmodels/comunicacao_nativa.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalViewState();
}

class _TelaPrincipalViewState extends State<TelaPrincipal> {
  final ComunicacaoNativaViewModel _viewModel = ComunicacaoNativaViewModel();

  @override
  Widget build(BuildContext context) {
  
    const Color verdePrincipal = Color(0xFF006400); 
    const Color verdeClaro = Color(0xFF4CAF50);    
    const Color verdeBoton = Color(0xFF2E7D32);    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Tarefa MethodChannel',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: verdePrincipal,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildCustomButton(
                texto: "Toast Nativo",
                onPressed: () => _viewModel.mostrarToastNativo(),
                color: verdeBoton,
                sombra: verdeClaro.withOpacity(0.5),
              ),
              const SizedBox(height: 25),
              _buildCustomButton(
                texto: "AlertDialog Nativo",
                onPressed: () => _viewModel.mostrarAlertDialogNativo(),
                color: verdeClaro,
                sombra: verdePrincipal.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    required String texto,
    required VoidCallback onPressed,
    required Color color,
    required Color sombra,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: sombra, width: 2),
        ),
        elevation: 6,
        shadowColor: sombra,
      ),
      onPressed: onPressed,
      child: Text(texto, textAlign: TextAlign.center),
    );
  }
}
