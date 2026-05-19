describe('Gerenciamento de Inscrições para Eventos', () => {
    beforeEach(() => {
        cy.visit('/evento/gerenciamento-inscricoes')
    })

    it('Validar layout do formulário de inscrição', () => {
        cy.contains('Gerenciamento de Evento: Workshop de Testes')
            .should('be.visible')
        cy.contains('Página de controle para o Organizador de Eventos')
            .should('be.visible')

        cy.contains('Inscrever Novo Participante')
            .should('be.visible')
        cy.get('[data-testid="input-nome"]')
            .should('be.visible')
        cy.get('[data-testid="input-email"]')
            .should('be.visible')
        cy.get('[data-testid="input-telefone"]')
            .should('be.visible')

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.visible')
            .and('be.disabled')

        cy.contains('Lista de Inscritos')
            .should('be.visible')

        cy.get('[data-testid="contador-vagas"]')
            .should('contain.text', 'Vagas: 47/50')
    })

    it('Deve realizar inscrição de participante com sucesso', () => {

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.disabled')

        cy.get('[data-testid="input-nome"]')
            .should('be.visible')
            .type('Maria Silva')

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.disabled')

        cy.get('[data-testid="input-email"]')
            .should('be.visible')
            .type('maria.silva@email.com')

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.enabled')
            .click()

        cy.contains('Inscrição realizada com sucesso!')
            .should('be.visible')
    })

    it('Deve validar atualização da lista de inscritos após nova inscrição', () => {

        cy.contains('Lista de Inscritos')
            .should('be.visible')

        cy.get('[data-testid="lista-inscritos"]')
            .should('contain', 'Maria Silva')
            .and('contain', 'maria.silva@email.com')

        cy.get('[data-testid="contador-vagas"]')
            .should('contain.text', 'Vagas: 48/50')
    })

    it('Validar não preenchimento dos campos obrigatórios', () => {

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.disabled')

        cy.get('[data-testid="input-nome"]')
            .should('be.visible')
            .type('João Silva')

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.disabled')

        cy.get('[data-testid="input-nome"]')
            .clear()

        cy.get('[data-testid="input-email"]')
            .type('joao@email.com')

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.disabled')
    })

    it('Deve impedir inscrição quando vagas estiverem esgotadas', () => {

        cy.contains('Lista de Inscritos')
            .should('be.visible')

        cy.get('[data-testid="contador-vagas"]')
            .should('contain.text', 'Vagas: 50/50')

        cy.contains('Inscrever Novo Participante')
            .should('be.visible')

        cy.get('[data-testid="input-nome"]')
            .should('be.visible')
            .type('Ana Maria Silva')

        cy.get('[data-testid="input-email"]')
            .should('be.visible')
            .type('anamaria@email.com')

        cy.get('[data-testid="btn-inscrever"]')
            .should('be.enabled')
            .click()

        cy.contains('Vagas esgotadas!')
            .should('be.visible')
    })

    it('Deve remover inscrição de participante', () => {

        cy.get('[data-testid="lista-inscritos"]')
            .should('contain', 'Maria Silva')

        cy.contains('Maria Silva')
            .parents('[data-testid="item-inscrito"]')
            .contains('Remover')
            .click()

        cy.get('[data-testid="lista-inscritos"]')
            .should('not.contain', 'Maria Silva')

        cy.get('[data-testid="contador-vagas"]')
            .should('contain.text', 'Vagas: 46/50')
    })

    it('Validar lista de participantes', () => {
        cy.get('[data-testid="lista-inscritos"]')
            .should('contain', 'Carlos Pereira')
            .and('contain', 'carlos.p@email.com')
            .and('contain', 'Juliana Costa')
            .and('contain', 'juliana.costa@example.com')
            .and('contain', 'Ricardo Martins de Souza')
            .and('contain', 'ricardo.souza@emailprovider.net')

        cy.get('[data-testid="contador-vagas"]')
            .should('contain.text', 'Vagas: 47/50')
    })
})