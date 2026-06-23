# 📋 Task Manager - Flutter

Esse é um projeto de gerenciamento de tarefas feito com Flutter. A ideia foi praticar organização de código, UI e manipulação de estado, sem usar banco de dados (tudo em memória).

---

## 🚀 Como rodar o projeto

```
git clone https://github.com/pygaudiello/task_manager.git
cd <PASTA_DO_PROJETO_NO_SEU_COMPUTADOR> 
flutter pub get
flutter run
```

---

## 📱 O que esse app faz

- Cria tarefas com título e descrição  
- Lista tarefas em formato de cards  
- Marca tarefas como concluídas  
- Tarefas concluídas ficam com destaque visual (texto riscado, cor diferente no card e indicador de status “Concluído”)  
- Conta tarefas pendentes  
- Exibe data e hora de criação  
- Valida formulário antes de salvar  
- Navegação simples entre telas  

---

## 🧠 Regras do projeto

- Toda tarefa começa como “Em andamento”  
- Depois de concluída, as tarefas não podem ser desmarcadas
- Sem banco de dados (tudo em memória)  
- Título e descrição são obrigatórios  
- Status tem destaque visual  

---

## 🧱 Estrutura do projeto

```
lib/
├── constants/
│   ├── app_theme.dart
│   ├── colors.dart
│   ├── sizes.dart
│   └── values.dart
│
├── models/
│   └── task.dart
│
├── screens/
│   ├── home_screen.dart
│   └── create_task_screen.dart
│
└── main.dart
```

---

## 🧩 Decisões técnicas

- StatefulWidget para controle de estado  
- List<Task> em memória  
- Navigator.push/pop para navegação  
- TextEditingController para formulários  
- Validação em tempo real  
- intl para data e hora  
- constants para padronizar UI  

---

## 🤖 Uso de IA

Usei o ChatGPT como apoio durante o desenvolvimento para:

- Ajustes de formatação de data  
- Correção de lógica de tarefas concluídas  
- Correção de erros de null safety e tipagem  
- Estruturação e melhoria do README  

Todo o código e o conteúdo final foram revisados e adaptados por mim.

---

## 📷 Preview

<img width="405" height="855" alt="image" src="https://github.com/user-attachments/assets/9e3dd729-8245-4f99-92e9-c066fe7a654c" />
<img width="401" height="857" alt="image" src="https://github.com/user-attachments/assets/317e085b-308d-40db-9545-a602c3a505f0" />
<img width="396" height="853" alt="image" src="https://github.com/user-attachments/assets/5a5561e6-99cf-4d0c-b31a-fdbdc4537538" />
<img width="405" height="861" alt="image" src="https://github.com/user-attachments/assets/ad981863-d96c-4944-b435-42e25969a7be" />
<img width="403" height="861" alt="image" src="https://github.com/user-attachments/assets/5363411d-aa36-4f8a-b09c-cb4e6f652d1b" />
<img width="400" height="857" alt="image" src="https://github.com/user-attachments/assets/6adeb6a0-a00f-4f99-8d89-aa37fd91fe57" />
<img width="405" height="857" alt="image" src="https://github.com/user-attachments/assets/a70412db-7d96-429d-8fc2-ce3d8ebf0c25" />

---

## 🏁 Final

Projeto feito para praticar Flutter na prática e evoluir organização de código e estado local.
