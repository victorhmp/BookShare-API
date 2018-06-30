# RELATÓRIO

# INTEGRANTES

Nomes:  Kaique Komata           NUSP: 10297741</br>
        Ricardo Hideki Kojo     NUSP: 10295429</br>
        Victor Hugo M. Pinto    NUSP: 10297720</br>
        Yurick Yussuke Honda    NUSP: 10258984</br>

## PRIMEIRA FASE

### IDEIA

A ideia inicial é a uma plataforma onde os usuários possam oferecer livros que não queiram mais ou que achem bacana compartilhar com outras pessoas, recebendo outro livro de um usuário com o mesmo propósito. 

### REUNIÃO

Nessa primeira parte, antes de iniciar o desenvolvimento propriamente dito, foram feitas três reuniões. 
Na primeira reunião discutiu-se a proposta a ser oferecida pelo projeto, realizando um "brainstorm" para tornar a ideia cada vez mais inovadora e impactante para com o público a ser atingido. Assim, a partir do objetivo inicial, foi se levantando funcionalidades que podem ser implementadas posteriormente e melhorarão a experiência do usuário, como: integração do sistema de troca com os Correios, criação de sistema de pontuação relacionado a quantidade de trocas efetuadas, etc.
Na segunda reunião o foco foi as tecnologias que utilizaríamos para o desenvolvimento. Assim, após diversas discussões sobre as tecnologias que integraríamos ao Rails, concluiu-se haveria melhor desempenho na programação com o uso do Docker. Além disso, como o uso de ReactJS tornou-se popular, a decisão foi utilizá-lo para a programação do Cliente. Vale ressaltar que para melhor organização das tarefas e dos objetivos a serem cumpridos, os integrantes estão usando o Trello.
Na terceira reunião se fez a preparação para o início do desenvolvimento, realizando uma ordenação nas funcionalidades que seriam implementadas e a discussão sobre os modelos do banco de dados e os relacionamentos entre as tabelas. Tudo isso foi feito por meio de .

### DOCKER

Foi feito o setup do Docker e Compose para unificar o ambiente de desenvolvimento e evitar problemas de incompatibilidade. 

Em cada repositório (API e Client), foram criados seus respectivos Dockerfile, docker-compose.yml e .dockerignore. Inclusive, a API e o Client foram criados dentro de containers com seus respectivos comandos de geração do template inicial.

Como descrito no `CONTRIBUTING.md`, para rodar localmente a API, basta fazer: 

```bash
$ docker-compose build
$ docker-comppose run --rm api rails db:setup
$ docker-compose up
```

E para o cliente:

```bash
$ docker-compose build
$ docker-compose up
```

### MODELOS E CONTROLADORES

Nessa primeira fase já foram criadas todas as tabelas do banco de dados na API do projeto e seus controladores. Os controladores de cada modelo criado tem seu CRUD implementado seguindo as restrições de autenticação de login do usuário, por meio das tokens.
As tabelas criadas foram: 
* Advertisements: anúncios de livros dos quais o usuário está disposto a realizar a troca;
* Offers: oferta de um usuário após visualizar um anúncio;
* Trades: os dados da troca entre os usuários;
* Users: o usuário e todo o processo de criação e dados de usuário;
* Wishlists: lista de desejos do usuário que busca um certo livro em específico, o ajudando quando livros de sua wishlists são ofertados;

### CLIENTE

Sabendo da dificuldade do processo de programação/desenvolvimento do Cliente, foi criada uma página inicial e um logo para a plataforma, com redirecionamento para páginas básicas de registro e login, porém sem integração com o CRUD dos controladores da API.

## SEGUNDA FASE

### EXECUÇÃO

Para teste da plataforma, basta executar a API e o Cliente juntamente como descrito nos repositórios. Alguns dos principais serviços de SwaB já estão disponíveis, tornando relativamente fácil seu uso, já nesta fase. Porém, ainda faltam diversas funcionalidades que tornam a plataforma realmente utilizável.

### REUNIÃO

Não foram feitas tantas reuniões quanto na primeira fase. Todas as reuniões feitas foram online e visando decisões mais imediatas, dado que cada integrante se responsabilizou por determinada parte do projeto, todos sabem o que cada integrante deve implementar. Assim, as reuniões tinham um formato decisivo em questão de implementação. Porém, para a terceira fase, planejamos reuniões semanais, pois como a terceira fase é conclusiva, é preciso maior comunicação entre os membros da equipe para um maior desempenho nessa reta final.

### CLIENTE

Para a terceira fase, foi desenvolvido grande parte do cliente, mais especificamente o feed, lista de desejos, login e registro de usuário. O grupo optou por utilizar React, então o processo torna-se um pouco mais lento pois estamos em processo de aprendizado da ferramenta em paralelo à implementação do projeto. É importante ressaltar que há um membro responsável pelo design do projeto, assim as páginas e componentes visuais se fazem juntos das funcionalidades.

### O QUE FALTA

Reservamos para a terceira fase o término da implementação do processo de trocas e ofertas, além da realização de testes, pois foram feitos testes básicos de funcionalidade, mas não há testes unitários. Inicialmente, o esperado era reservar a terceira fase para a criação do design, porém achamos que o design está bem satisfatório, já que estamos o fazendo em paralelo à implementação, como dito.

## TERCEIRA FASE

### REUNIÃO

Nessa terceira fase, as reuniões foram mais conversas para saber o andamento do que cada integrante estava desenvolvendo. Isso ocorreu pois, estando o projeto com um progresso bem satisfatório, cada participante tinha conhecimento de sua função no projeto, também com o auxílio da ferramenta Trello. Além disso, com o fim do semestre, todos os participantes encontravam-se sobrecarregados com a quantidade de tarefas acadêmicas a serem realizadas.

### PROGRESSO

Ao longo do desenvolvimento de SwaB foi adquirido muito aprendizado de utilização de métodos ágeis aplicados a um <i>Software as a Service</i>. Com a ajuda das aulas do professor e o material disponibilizado, obteve-se acesso a diversas ferramentas de desenvolvimento, sendo algumas sem conhecimento por parte do grupo. <br>
Ademais, o processo de desenvolvimento em pares e o trabalho em grupo foi uma experiência de grande aprendizado ao demonstrar um ambiente de desenvolvimento. Apesar de não implementar toda a ideia inicial, a equipe como um todo sente-se muito satisfeita com o resultado do projeto, pois a grande maioria das funcionalidades propostas, foram implementadas.

### RESULTADOS

Como resultado, a maior parte das funcionalidades que tornam o sistema passível a ser utilizado por usuários reais foram criadas. Isso pode ser analizado pela criação da API, que já foi projetada idealizando o compromisso que o sistema firmava com o usuário, e no Cliente ela foi utilizada inteiramente, ou seja, tudo aquilo que foi proposto, gerou resultados finais. <br>
Ao final do desenvolvimento, o sistema pode: <br>
* Criar usuário;
* Autenticar usuário;
* Mostrar os anúncios de livros disponíveis;
* Criar anúncio sobre um certo livro;
* Ofertar um certo livro a partir de um anúncio de um outro usuário;
* Criar, deletar e atualizar lista de desejos;
* Criar, deletar e atualizar itens na lista de desejos e
* Visualizar seu perfil, na aba "Meu Usuário".

### O QUE FALTOU

O sistema pode ainda evoluir, com total certeza, principalmente observando a gama de funcionalidades que podem ser implementadas a um sistema com o caráter de SwaB. Porém, o principal ponto a ser destacado que está ausente no sistema é o teste da API, que foi deixado de lado ao observar que havia a possibilidade da equipe não conseguir desenvolver o cliente do sistema. Após isso, a API foi sendo mais testada durante a implementação do cliente, além disso as rotas e o sistema de autenticação definidos na API foram testados utilizando a ferramenta Postman. A equipe tem ciência da importância dos testes durante o desenvolvimento de um <i>software</i>, porém percebendo a falta de tempo para isso, a preferência foi manter o foco no cliente e deixar os teste da API de lado. <br>
Além disso, é contundente citar que as criações, atualizações e remoções tanto dos anúncios e ofertas quanto das listas de desejo ocorrem sem a presença de uma janela de confirmação. A equipe concorda que o ideal seria a existência de algum tipo de confirmação do usuário para o sistema executar tais ações, mas devido a conflitos com a função <i>window.confirm</i> do <i>JavaScript</i>, o envio da confirmação estaria funcionando apenas em alguns navegadores. Portanto, a equipe achou melhor retirar essa funcionalidade.

### BUG

Ainda não se conhecem muitos bugs do sistema, porém um fácilmente notável ocorre quando se cria uma lista de desejos ou um item da lista de desejos e, após ser redirecionado à pagina que os mostra, eles não se encontram lá. Percebeu-se também, que tal bug aparenta acontecer apenas no primeiro item de lista de desejos ou na primeira lista de desejos criada, portando das próximas vezes, isso não passa a ser um problema. Uma dedução é o problema no <i>"Redirect"</i> do <i>React</i>, mas não é uma certeza, já que o grupo não conseguiu resolver tal anomalia.

### SEEDS DATA

Para demonstrar o funcionamento da plataforma, populamos o arquivo `seeds.rb` com alguns usuários:

- VictorHugo
- RicardoKojo
- YurickHonda
- KaiqueKomata

A senha de todos eles é "test123". Tudo o que foi colocado no `seeds.rb` populado o bando de dados quando rodamos o comando `docker-compose run --rm api rails db:setup`.

### CONCLUSÃO

A equipe como um todo conclui que o desempenho dos integrantes foi bem satisfatório e o aprendizado enriquecedor, permitindo a entrada dos alunos no universo de desenvolvimento <i>web</i>. O conhecimento teórico de métodos ágeis aplicado ao sistema, aproximou os alunos da fronteira teoria/prática. Além disso, a experiência bônus, como opção da equipe, da utilização do <i>Docker</i> e <i>React</i> enriqueceu o conhecimento dessas ferramentas e expandiu a possibilidade de utilização delas.