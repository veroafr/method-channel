# Projeto: Comunicação Nativa com Flutter (MethodChannel e MVVM)

### Este projeto foi desenvolvido para a disciplina de Desenvolvimento Mobile II e tem como objetivo principal demonstrar a comunicação entre o framework Flutter e a plataforma nativa Android. O aplicativo consiste em uma tela simples com dois botões que, ao serem pressionados, invocam métodos escritos em Kotlin para exibir componentes de UI nativos do Android: um Toast e um AlertDialog

![Demonstração do APP](https://github.com/PedroCoelhoIF/MethodChannel/blob/main/assets/demo-comunicacao_nativa.gif?raw=true)

## Conceitos e Tecnologias Abordadas:

### Os principais conceitos e tecnologias aplicados neste projeto foram:

- Flutter: Utilizado para a construção da interface de usuário (UI) de forma declarativa.
- Arquitetura MVVM (Model-View-ViewModel): Empregada para organizar o código de forma limpa e escalável, separando as responsabilidades da UI (View), da lógica de apresentação (ViewModel) e dos dados (Model).
- MethodChannel: API do Flutter utilizada como "ponte" para permitir a comunicação bidirecional entre o código Dart e o código nativo da plataforma (neste caso, Kotlin no Android).
- Desenvolvimento Nativo Android: Escrita de código em Kotlin para interagir com as APIs do sistema Android e exibir os componentes visuais nativos.

## Estrutura do Projeto

O projeto foi organizado seguindo a arquitetura MVVM, resultando na seguinte estrutura de diretórios dentro da pasta lib:

```
tarefa_methodchannel/
├── lib/
│   ├── main.dart                   # Ponto de entrada da aplicação
│   ├── models/                     # (Vazio neste projeto) Camada de dados
│   ├── views/
│   │   └── tela_principal.dart     # Camada de Visão (a UI da tela principal)
│   └── viewmodels/
│       └── comunicacao_nativa.dart # Camada de Lógica (ViewModel)
│
└── android/
    └── .../MainActivity.kt         # Ponto de entrada do lado nativo Android
```

## Responsabilidades dos Arquivos

   - main.dart: Arquivo principal que inicializa a aplicação Flutter e define a tela inicial (TelaPrincipal).

   - views/tela_principal.dart: Representa a camada View. É responsável exclusivamente por construir e exibir a interface do usuário (a AppBar, o fundo cinza e os dois botões estilizados). Ao interagir com os botões, ela apenas notifica o ViewModel, sem conter nenhuma lógica de comunicação.

   - viewmodels/comunicacao_nativa.dart: Representa a camada ViewModel. Contém a lógica de apresentação. É aqui que o MethodChannel é instanciado. Ele expõe os métodos (mostrarToastNativo, mostrarAlertDialogNativo) que são chamados pela View. Sua função é invocar os métodos correspondentes no lado nativo.

   - MainActivity.kt: Corresponde ao código nativo Android. Ele configura um "ouvinte" (MethodCallHandler) no mesmo canal definido no Flutter. Quando uma chamada é recebida, este arquivo executa o código Kotlin correspondente para criar e exibir um Toast ou AlertDialog real no sistema Android.
