# **VollMed - Aplicativo de Gestão de Consultas Médicas**

O **VollMed** é um aplicativo mobile desenvolvido para facilitar a gestão de consultas médicas. Com foco em escalabilidade, usabilidade e boas práticas de desenvolvimento, o projeto oferece funcionalidades completas para pacientes gerenciarem seus compromissos médicos de forma intuitiva e eficiente.

---

## **Funcionalidades Principais**
- **Visualizar especialistas disponíveis** com informações detalhadas.
- **Agendar consultas** escolhendo horários e datas no calendário.
- **Reagendar ou cancelar consultas** com ações simples e intuitivas.
- **Autenticação segura** utilizando Keychain e UserDefaults.
- **Tratamento de erros** com mensagens animadas e informativas (SnackBarErrorView).
- **Skeletons e animações personalizadas** para melhorar a experiência do usuário.

---

## **Estrutura do Projeto**
O projeto utiliza o padrão arquitetural **MVVM (Model-View-ViewModel)** para organizar e desacoplar responsabilidades. Isso permite:
- Código mais limpo, modular e fácil de manter.
- Reutilização de lógica com camadas de serviços.

### **Camadas Implementadas**
1. **ViewModel:** Centraliza a lógica de negócio e intermedia a View e os serviços.
2. **Networking:** Modularização de endpoints por funcionalidades:
   - `HomeNetworkingService`: Endpoints relacionados à tela inicial.
   - `AuthenticationService`: Gerencia login, logout e autenticação do usuário.
3. **Tratamento de Erros:** 
   - **SnackBarErrorView:** Mensagens dinâmicas e animadas para informar erros ao usuário.
4. **Skeletons e Animações:** Indicam carregamento de informações enquanto os dados são processados.

---

## **Tecnologias e Ferramentas**
- **SwiftUI:** Framework para construção da interface de usuário.
- **Keychain e UserDefaults:** Armazenamento seguro de tokens de autenticação.
- **DatePicker e TextEditor:** Componentes para seleção de datas e entrada de texto.
- **HTTP Requests:** Integração com APIs REST utilizando métodos como POST, PATCH e DELETE.
- **@Published e @ObservedObject:** Gerenciamento de estados na interface.

---

## **Como Executar o Projeto**
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/vollmed.git
   cd vollmed
   ```
2. Abra o projeto no **Xcode**.
3. Execute no simulador ou dispositivo real:
   - Requisitos mínimos: iOS 14+.

---

## **Contribuição**
Contribuições são bem-vindas! Caso encontre algum problema ou tenha sugestões, sinta-se à vontade para abrir uma **issue** ou enviar um **pull request**.

---

## **Licença**
Este projeto é licenciado sob a [MIT License](LICENSE).

---

> **Nota:** Este projeto foi desenvolvido como parte de um curso, com foco no aprendizado de padrões arquiteturais, boas práticas de desenvolvimento e implementação de soluções robustas.
