import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

// Widget principal do app (precisa ser Stateful porque os dados mudam)
class MeuApp extends StatefulWidget {
  @override
  State<MeuApp> createState() => _MeuAppState();
}

// Classe que guarda e controla as informações da tela
class _MeuAppState extends State<MeuApp> {

  // Guarda se o Switch está ligado (true) ou desligado (false)
  bool ligado = false;

  // Guarda se o Checkbox está marcado ou não
  bool aceito = false;

  // Guarda o valor do Slider (número decimal)
  double valor = 50;

  // Guarda qual opção foi escolhida no SegmentedButton
  String opcao = "A";

  void clicarIcone() {
    // Esse método é chamado quando o botão é clicado
    print("Clicou no coração");
    // Mostra mensagem no console (terminal)
  }

  void alterarSwitch(bool novoValor) {
    // Método para atualizar o Switch

    setState(() {
      // setState avisa o Flutter para atualizar a tela

      ligado = novoValor;
      // Atualiza o valor da variável

      print(novoValor);
      // Mostra o novo valor no console
    });
  }

  void alterarCheckbox(bool novoValor) {
    // Método para atualizar o Checkbox

    setState(() {
      aceito = novoValor;
      print(novoValor);
    });
  }

  void alterarSlider(double novoValor) {
    // Método para atualizar o Slider

    setState(() {
      valor = novoValor;
      print(novoValor);
    });
  }

  void alterarOpcao(String novaOpcao) {
    // Método para atualizar o SegmentedButton

    setState(() {
      opcao = novaOpcao;
      print(novaOpcao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Estrutura base do aplicativo
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Galeria de Widgets"),
        ), // AppBar

        body: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("IconButton"),

              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: clicarIcone,
              ), // IconButton

              SizedBox(height: 20),

              // =================== SWITCH ===================
              Text("Switch"),

              Switch(
                value: ligado,

                onChanged: (valor) {
                  alterarSwitch(valor);
                },
              ), // Switch

              SizedBox(height: 20),

              // =================== CHECKBOX ===================
              Text("Checkbox"),

              Checkbox(
                value: aceito,
                // Valor atual do Checkbox

                onChanged: (valor) {
                  alterarCheckbox(valor!);
                },
              ), // Checkbox

              SizedBox(height: 20),

              // =================== SLIDER ===================
              Text("Slider: ${valor.toInt()}"),
              // Mostra o valor do slider (sem casas decimais)

              Slider(
                min: 0,
                // Valor mínimo

                max: 100,
                // Valor máximo

                value: valor,
                // Valor atual

                onChanged: (novoValor) {
                  alterarSlider(novoValor);
                  // Atualiza o valor chamando o método
                },
              ), // Slider

              SizedBox(height: 20),

              // =================== SEGMENTED BUTTON ===================
              Text("SegmentedButton"),

              SegmentedButton<String>(
                segments: [
                  // Lista de opções

                  ButtonSegment(value: "A", label: Text("Opção A")),
                  ButtonSegment(value: "B", label: Text("Opção B")),
                  ButtonSegment(value: "C", label: Text("Opção C")),
                ],

                selected: {opcao},
                // Qual opção está selecionada (precisa ser um Set)

                onSelectionChanged: (novaSelecao) {
                  alterarOpcao(novaSelecao.first);
                  // Pega a opção escolhida e chama o método
                },
              ), // SegmentedButton
            ],
          ), // Column
        ), // Padding
      ), // Scaffold
    ); // MaterialApp
  }
}