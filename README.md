# DartGuard 
DartGuard é um protótipo de um app de seguros. Esse repositório demonstra o cadastro de usuários, autenticação de usuário e o visual do aplicativo. 


## Ferramentas utilizadas
- Flutter
- Dart
- Firebase Authentication
- Firebase Firestore
- Firebase Hosting
- Provider
- Mocktail


## Executar

### Credenciais de Teste
```
CPF: 12345678901
Senha: 123456
```
Seu próprio usuário pode ser criado caso queira.

### Aplicação web
Acesse a aplicação web através do link https://dartguard-ad57a.web.app/#/wrapper

### Aplicação Android (apk)
- Faça o download do APK em https://github.com/victorfidelis/DartGuard/tree/main/apk
- Execute o APK em seu dispositivo Android
- Abra o aplicativo

### Aplicação Android (ambiente de desenvolvimento)

Requisitos:
- Flutter atualizado
- Dart atualizado
- Emulador ou dispositivo físico Andoird com o modo de depuração ativado
- VS Code (Esta documentação usa o VS Code, porém o Android Studio também pode ser usado)

Como executar:
- Abra seu prompt
- Faça as configurações iniciais:
  ```bash
  # Clone o repositório
  git clone https://github.com/victorfidelis/DartGuard.git
  cd DartGuard/dart_guard
  
  # Instale as dependências
  flutter pub get
  ```
- Inicie o emulador Android (ou conecte seu dispositivo físico)
- No VS Code, selecione o aparelho que deseja executar o app (canto inferior direito)
- Execute:
     ```bash
     flutter run
     ```
