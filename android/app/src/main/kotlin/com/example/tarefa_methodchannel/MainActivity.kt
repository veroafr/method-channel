package com.example.tarefa_methodchannel

import android.app.AlertDialog
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    
    private val CHANNEL = "com.example.tarefa_methodchannel/channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

       
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            when (call.method) {
                "showToast" -> {
                    val message = call.argument<String>("message") ?: "Mensagem padrão"
                    showNativeToast(message)
                    result.success(null) 
                }
                "showAlertDialog" -> {
                    val title = call.argument<String>("title") ?: "Título Padrão"
                    val message = call.argument<String>("message") ?: "Mensagem Padrão"
                    showNativeAlertDialog(title, message)
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

   
    private fun showNativeToast(message: String) {
        Toast.makeText(context, message, Toast.LENGTH_LONG).show()
    }

    
    private fun showNativeAlertDialog(title: String, message: String) {
        AlertDialog.Builder(context)
            .setTitle(title)
            .setMessage(message)
            .setPositiveButton("OK") { dialog, _ -> dialog.dismiss() }
            .show()
    }
}