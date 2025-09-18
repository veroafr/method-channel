# Projeto: Integração Nativa com Flutter (MethodChannel & MVVM)

### Este projeto foi desenvolvido como parte da disciplina de **Desenvolvimento Mobile II** e tem como finalidade apresentar a integração entre uma aplicação Flutter e recursos nativos da plataforma Android.  
A proposta consiste em uma tela simples com dois botões que, ao serem acionados, disparam chamadas para o código nativo, resultando na exibição de componentes próprios do sistema: um **Toast** e uma **caixa de diálogo**.

![Demonstração do APP](https://raw.githubusercontent.com/veroafr/method-channel/refs/heads/main/demo.gif)

---

## Conceitos e Tecnologias Explorados

Os principais pontos abordados ao longo da implementação foram:

- **Flutter** → utilizado para criação da interface de forma declarativa e responsiva.  
- **Arquitetura MVVM (Model–View–ViewModel)** → garante a separação entre a camada visual, a lógica de apresentação e os dados.  
- **MethodChannel** → recurso do Flutter que permite a comunicação bidirecional entre o aplicativo e a plataforma hospedeira.  
- **Integração Nativa Android** → responsável por executar chamadas específicas do sistema e retornar respostas ou efeitos visuais diretamente ao usuário.  

---

## Estrutura do Projeto

O código foi organizado seguindo princípios de MVVM, resultando na seguinte hierarquia:


```
tarefa_methodchannel/
├── lib/
│ ├── main.dart # Ponto inicial da aplicação Flutter
│ ├── models/ # Camada de dados (não utilizada neste exemplo)
│ ├── views/
│ │ └── tela_principal.dart # Camada de apresentação (interface da tela principal)
│ └── viewmodels/
│ └── comunicacao_nativa.dart # Lógica de interação com a camada nativa
│
└── android/
└── .../MainActivity.kt # Configuração do canal e resposta às chamadas
```

## Responsabilidades dos Arquivos

  
---

## Responsabilidade dos Arquivos

- **main.dart** → define a tela inicial do aplicativo e configura o ponto de entrada.  
- **views/tela_principal.dart** → camada **View**, responsável apenas por renderizar a interface (AppBar e botões) e repassar as ações ao ViewModel.  
- **viewmodels/comunicacao_nativa.dart** → camada **ViewModel**, onde o canal de comunicação é estabelecido. Expõe métodos que podem ser chamados pela interface.  
- **MainActivity.kt** → lado nativo que escuta as chamadas do canal e executa ações do sistema, exibindo elementos visuais ao usuário.  
