# Automação Cypress - Formulário de Contato

Projeto de automação E2E utilizando Cypress para validar o preenchimento do formulário de contato do site Scale.

## Tecnologias utilizadas

- Cypress
- JavaScript
- Node.js

## Cenário automatizado

O teste realiza:

- Acesso ao site
- Scroll até a seção de contato
- Preenchimento do formulário
- Seleção do assunto
- Upload de arquivo PDF
- Validação dos campos preenchidos

## Estrutura do projeto

```bash
cypress/
 ├── e2e/
 │    └── contato_scale.cy.js
 ├── fixtures/
 │    └── pdf automação.pdf