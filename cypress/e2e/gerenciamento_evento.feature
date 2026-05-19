Perguntas para refinamento com PO

- O sistema deve impedir cadastro duplicado? Caso sim, qual mensagem deve ser exibida?
- O campo e-mail validará apenas o formato ou também a existência/domínio do e-mail?
- Qual mensagem deve ser exibida para e-mail inválido?
- O campo Nome terá limite mínimo e máximo de caracteres?
- Ao informar números ou caracteres especiais no campo Nome Completo, qual mensagem de validação deve ser exibida?
- O telefone, mesmo sendo opcional, deverá ter máscara? Quais formatos serão aceitos?
- Deve ter ordenação ou campo de busca?
- Quando o limite de vagas esgotar, seria possivel bloquear o formulário de inscrição e exibir alguma mensagem? acredito que seria melhor para o usuário, pois ele já saberia que não é mais possivel se inscrever antes de preencher todo o formulário.
- Se houver apenas uma vaga disponível e duas inscrições ocorrerem ao mesmo tempo, como o sistema deve tratar essa situação?
- Qual será o conteúdo/template do e-mail de confirmação?
- A inscrição deve ser concluída mesmo se houver falha no envio do e-mail?
- Ao remover um participante, deverá existir popup/modal de confirmação?
- Após remover, deverá ser exibida mensagem de sucesso?
- Os dados da inscrição deverão ser persistidos em banco de dados? Quais informações devem ser armazenadas?
- Haverá algum log para inclusão e remoção de participantes?
- Como que ficaria o layout quando o telefone for preenchido? Ele deve se adaptar para não quebrar o design?
- Como ficaria o layout quando o nome e o e-mail ter muitos caracteres? Ele deve se adaptar para não quebrar o design?  


Sugestão de melhoria 

- Tornar o formulário responsivo para diferentes resoluções e dispositivos móveis
- Adicionar feedback visual durante o envio da inscrição, como spinner/loading, evitando múltiplos cliques no botão Inscrever
- Exibir as mensagens de erro em vermelho próximas aos campos inválidos para melhorar a experiência do usuário e facilitar correções
- Exibir a mensagem de sucesso de forma visível e amigável, utilizando modal ou notificação destacada na tela
- Garantir adaptação do layout para nomes e e-mails com muitos caracteres, evitando quebra visual da interface
 

Cenários de teste 

Cenário: Validar layout do formulário de inscrição

Dado que o organizador do evento acessa a página de inscrição
E o título da página é "Gerenciamento de eventos: Workshop de testes"
E abaixo do título há um parágrafo explicativo sobre o evento com a mensagem "Página de controle para o Organizador do evento"
Quando o organizador do evento visualiza o formulário de inscrição
Então do lado direito do formulário deve o formulário de inscrição com o título "Inscrever novo participante"
E abaixo d  os campos de entrada para Nome Completo, E-mail e Telefone
E o botão "Inscrever" deve estar presente abaixo dos campos de entrada
E do lado esquerdo do formulário deve haver uma lista de inscritos com o título "Lista de inscritos"
E ao lado do título da lista de inscritos deve haver um contador indicando o número de inscritos com o texto "vagas 0/50"
E a lista deverá estar vazia inicialmente 

Cenário: Preenchimento do formulário de inscrição com sucesso

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado
E preenche os campos obrigatórios: Nome Completo e E-mail corretamente
E o botão "Inscrever" é habilitado
Quando clicar no botão "Inscrever"
Então o sistema deverá registrar a inscrição com sucesso
E exibir a mensagem: "Inscrição realizada com sucesso!"
E enviar um e-mail de confirmação para o endereço fornecido
E o formulário deve ser resetado para permitir novas inscrições

Cenário: Preenchimento do formulário de inscrição com telefone preenchido

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado
E preenche os campos obrigatórios: Nome Completo e E-mail corretamente
E preenche o campo de telefone com um número válido
E o botão "Inscrever" é habilitado
Quando clicar no botão "Inscrever"
Então o sistema deverá registrar a inscrição com sucesso    
E exibir a mensagem: "Inscrição realizada com sucesso!"
E enviar um e-mail de confirmação para o endereço fornecido
E o formulário deve ser resetado para permitir novas inscrições

Cenário: Preenchimento do formulário de inscrição com campo email vazio

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado 
Quando preencher o campo Nome Completo e deixar o campo E-mail vazio
Então o botão "Inscrever" deve permanecer desabilitado

Cenário: Preenchimento do formulário de inscrição com campo nome vazio

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado     
Quando preencher o campo E-mail e deixar o campo Nome Completo vazio
Então o botão "Inscrever" deve permanecer desabilitado

Cenário: Validação de formato de e-mail

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado
Quando preencher o campo E-mail com um formato inválido (ex: "usuario@dominio")
E preencher o campo Nome Completo corretamente
E clicar no botão "Inscrever"
Então o sistema deve exibir uma mensagem de erro indicando que o formato do e-mail é inválido

Cenário: Preenchimento do formulário de inscrição com nome contendo caracteres especiais

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado
Quando preencher o campo Nome Completo com caracteres especiais (ex: "João@Silva!")
E preencher o campo E-mail corretamente
E clicar no botão "Inscrever"
Então o sistema deve exibir uma mensagem de erro indicando que o nome não pode conter caracteres especiais

Cenário: Preenchimento do formulário de inscrição com nome contendo números

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado 
Quando preencher o campo Nome Completo com números (ex: "João123")
E preencher o campo E-mail corretamente 
E clicar no botão "Inscrever"
Então o sistema deve exibir uma mensagem de erro indicando que o nome não pode conter números

Cenário: Preenchimento do formulário de inscrição com telefone em formato inválido

Dado que o organizador do evento acessa a página de inscrição
E o botão "Inscrever" está desabilitado 
E preencher os campos obrigatórios: Nome Completo e E-mail corretamente
Quando preencher o campo de telefone com um formato inválido (ex: "12345")
E clicar no botão "Inscrever"
Então o sistema deve exibir uma mensagem de erro indicando que o formato do telefone é inválido

Cenário: Validar limite de vagas

Dado que o organizador do evento acessa a página de inscrição
E o limite de vagas é de 50 
E 50 inscrições já foram realizadas
Quando preencher os campos obrigatórios: Nome Completo e E-mail corretamente
E clicar no botão "Inscrever"
Então o sistema deve exibir a mensagem "Vagas esgotadas!"
E impedir o envio da inscrição

Cenário: Validar atualização da lista de inscritos em tempo real

Dado que o organizador do evento acessa a página de inscrição
E o limite de vagas é de 50
E 49 inscrições já foram realizadas
Quando preencher os campos obrigatórios: Nome Completo e E-mail corretamente
E clicar no botão "Inscrever"
Então o sistema deve registrar a inscrição com sucesso
E exibir a mensagem: "Inscrição realizada com sucesso!"
E enviar um e-mail de confirmação para o endereço fornecido
E o formulário deve ser resetado para permitir novas inscrições
E o número de vagas disponíveis deve ser atualizado para 0

Cenário: Validar dados da lista de inscritos

Dado que o organizador do evento acessa a página de inscrição
E realizou a inscrição com os seguintes dados: Nome Completo "Maria Silva", E-mail "maria.silva@example.com"    
Quando acessar a lista de inscritos
Então o sistema deve exibir os dados da inscrição, incluindo Nome Completo "Maria Silva" e E-mail "maria.silva@example.com"
E ao lado do nome do participante deve haver um botão "Remover" para permitir a exclusão da inscrição
E o botão será de ícone de lixeira para facilitar a identificação da função de remoção da inscrição

Cenário: Remover inscrição da lista de inscritos

Dado que o Organizador do evento acessa a página de inscrição
E há uma inscrição existente na lista de inscritos com o nome "Maria Silva"
Quando clicar no botão "Remover" ao lado do nome "Maria Silva"  
Então o participante "Maria Silva" deve ser removido da lista de inscritos
E a contagem de vagas disponíveis deve ser atualizada para 0    para refletir a remoção da inscrição

