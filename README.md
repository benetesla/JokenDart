# Jogo de Jokenpo em Flutter

Este é um aplicativo simples de jogo de Jokenpo desenvolvido em Flutter. O jogo permite que o usuário escolha entre pedra, papel e tesoura, enquanto o aplicativo faz uma escolha aleatória. O resultado é exibido com base nas regras tradicionais do jogo.

## Funcionalidades

### Escolha do App

O aplicativo faz uma escolha aleatória entre pedra, papel e tesoura quando o usuário toca na área da escolha do App.

```dart
GestureDetector(
  onTap: () {
    setState(() {
      escolhaApp = escolhaAppFuncao();
      resultado = calcularResultado();
    });
  },
  child: Image.asset(
    'image/$escolhaApp.png',
    height: 95,
  ),
),
```

### Escolha do Usuário

O usuário pode escolher entre pedra, papel e tesoura, tocando na imagem correspondente na tela.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Expanded(
      child: GestureDetector(
        onTap: () => escolhaUsuarioFuncao('pedra'),
        child: Image.asset(
          'image/pedra.png',
          height: 95,
        ),
      ),
    ),
    Expanded(
      child: GestureDetector(
        onTap: () => escolhaUsuarioFuncao('papel'),
        child: Image.asset('image/papel.png', height: 95),
      ),
    ),
    Expanded(
      child: GestureDetector(
        onTap: () => escolhaUsuarioFuncao('tesoura'),
        child: Image.asset(
          'image/tesoura.png',
          height: 95,
        ),
      ),
    ),
  ],
),
```

### Resultado

O resultado do jogo é exibido com base nas escolhas do usuário e do App.

```dart
Padding(
  padding: const EdgeInsets.only(top: 32, bottom: 16),
  child: Text(
    resultado,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
),
```

## Estrutura do Código

O código está estruturado usando um `StatefulWidget` para gerenciar o estado do jogo. Há funções para calcular a escolha do App, calcular o resultado e atualizar o estado do jogo quando o usuário faz uma escolha.

## Como Executar

Certifique-se de ter o Flutter instalado em seu ambiente de desenvolvimento. Clone o repositório, navegue até o diretório do projeto e execute:

```bash
flutter run
```

Isso iniciará o aplicativo no emulador ou dispositivo conectado.

Divirta-se jogando Jokenpo no seu aplicativo Flutter!