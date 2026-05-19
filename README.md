# Cypress Automation - Scale Systems

Projeto de automação de testes desenvolvido com Cypress.

## Objetivo

Este repositório contém:

- Automação do formulário de contato do site da Scale Systems
- Desafio técnico de gerenciamento de inscrições para eventos
- Cenários BDD utilizando Gherkin
- Exemplos de automação E2E com Cypress

## Estrutura do Projeto

```bash
cypress/
 ├── e2e/
 │    ├── contato_scale.cy.js
 │    ├── contato_scale.feature
 │    ├── gerenciamento_evento.cy.js
 │    ├── gerenciamento_evento.feature
 │
 ├── fixtures/
 ├── support/
```

## Tecnologias utilizadas

- Cypress
- JavaScript
- Gherkin / BDD
- VS Code
- Git e GitHub

## Cenários Automatizados

### Formulário de Contato
- Preenchimento do formulário
- Navegação até seção de contato
- Validações básicas

### Gerenciamento de Eventos
- Validação de layout
- Cadastro de participante
- Validação de campos obrigatórios
- Controle de vagas
- Atualização da lista de inscritos
- Remoção de participantes

## Observações

Os testes do desafio técnico foram estruturados utilizando seletores sugeridos (`data-testid`), considerando que não foi disponibilizada uma aplicação funcional para execução.