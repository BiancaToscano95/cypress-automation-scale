describe('Contato', () => {

  it('Deve preencher o formulário de contato', () => {

    cy.viewport(1280, 720)
    cy.visit('https://www.scale.com.br/')

    cy.scrollTo('bottom', {
      ensureScrollable: false
    })

    cy.contains('contato')
      .click()

    cy.get('input[placeholder="* Nome"]')
      .should('be.visible')
      .type('Teste de Automação')

    cy.get('input[placeholder="* E-mail"]')
      .should('be.visible')
      .type('Teste@teste.com')

    cy.get('input[placeholder="* Celular"]')
      .should('be.visible')
      .type('11 95444-8580')
      .should('have.value', '(11) 95444-8580')

    cy.get('[name="assunto"]')
      .select('Vagas de emprego')

    cy.get('textarea[placeholder="* Mensagem"]')
      .should('be.visible')
      .click()
      .type('Este é um teste básico de automação para mostrar um pouco da minha experiência com Cypress')

    cy.get('input[type=file]')
      .selectFile('./cypress/fixtures/pdf automação.pdf', { force: true })

      cy.get('input[type=file]')
        .should(($input) => {
          expect($input[0].files[0].name).to.equal('pdf automação.pdf')
  
        })
    })
  })