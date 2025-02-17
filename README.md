# Gerenciador de Tarefas (ASP Clássico)

Projeto de desenvolvimento de uma aplicação web de gerenciamento de tarefas (to-do list) onde os usuários podem criar, visualizar, editar e excluir tarefas.
---

## Funções

- Adicionar tarefas
- Visualizar tarefas
- Editar tarefas
- Excluir tarefas

### Adicionar Tarefas
As tarefas são adicionadas na página principal.
Para adicionar uma tarefa é necessário preencher o título, a descrição, e inserir uma data válida.
Quando uma tarefa é adicionada, o sistema notifica ao usuário que a tarefa foi criada.
![Imgur Image](https://imgur.com/wUmsHjP,jpg)
![Imgur Image](https://imgur.com/LNrCGAP,jpg)
### Visualizar Tarefas
As tarefas são visualizadas na página principal.
Quando não há tarefas criadas, o sistema avisa ao usuário que ele não possui tarefas.
Quando é criada uma tarefa, ela vai para o topo da lista de tarefas, contendo todas as suas informações.
![Imgur Image](https://imgur.com/2wPtoOG,jpg)
### Editar Tarefas
Para se editar uma tarefa, clica-se no botão de "Editar" no lado direito da tarefa.
Com isso, o usuário é enviado a outra página, na qual poderá realizar as alterações que deseja.
Clicando em "Salvar edição", as alterações feitas na tarefa são gravadas e o sistema notifica que a edição foi realizada.
![Imgur Image](https://imgur.com/W2PuHoM,jpg)
![Imgur Image](https://imgur.com/lbAZiot,jpg)

### Excluir Tarefas

Para se excluir uma tarefa, clica-se no botão de "Excluir" no lado direito da tarefa.
O sistema então pergunta se o usuário tem certeza que deseja excluir aquela tarefa, e, com a confirmação do usuário, exclui a tarefa.
Depois de removida a tarefa, o sistema notifica o usuário que a tarefa foi removida com sucesso.
![Imgur Image](https://imgur.com/05NAqWb,jpg)
![Imgur Image](https://imgur.com/NqxlAC7,jpg)

---

## Tecnologias utilizadas

- HTML
- CSS
- JavaScript
- ASP Classic
- [SQL Server] - Sistema de gerenciamento de banco de dados fornecido pelo Windows.
- [Bootstrap 5.3] -  Framework Front-End para criação de aplicações web responsivas.
---

## Decisões de Implementação

### Escolha do SQL Server

- Foi escolhido usar o SQL Server na aplicação do ASP Clássico ao invés do MySQL por conta de problemas de conexão que estavam ocorrendo devido a uma incompatibilidade entre as versões mais recentes do MYSQL e seus drivers, e o ASP Classic.
- Para conectar o SQL Server ao ASP, foi necessário instalar o Driver do Microsoft OLE DB para SQL Server(MSOLEDBSQL).
- Para utilizar o SQL Server, foi criado um logon com o nome "root" e a senha "senhaDesafio123%".
- A string de conexão usada para o SQL Server foi:"Provider=sqloledb;Data Source=localhost\SQLEXPRESS;Initial Catalog=to_do_list;User ID=root;Password=senhaDesafio123%;".

### Design e Tratamentos do Sistema
- Devido a quantidade reduzida de funções, decidiu-se colocar as funções de adicionar e visualizar diretamente na página inicial da aplicação, para evitar uma navegação redundante  e uma página inicial vazia.
- Decidiu-se dispor as tarefas em uma coluna e de forma "mais estendida" para melhor legibilidade da descrição.
- Escolheu-se limitar o número máximo de caracteres do título para 40 e da descrição para 500. Essa escolha foi feita devido ao espaçamento nos espaços das tarefas.
- O sistema não permite selecionar uma data que seja menor que o dia atual.
- O sistema verifica espaços vazios e o caractere especial "'" que causa conflito com os comandos SQL.
- Algumas funções Javascript foram passadas para um documento externo.
- Alguns estilos CSS foram passados para um documento externo.

---

## Instruções para Execução
- Instalar, pelos recursos do Windows, o Gerenciador do Serviços de Informações da Internet(IIS) e o ASP.
- Colocar os arquivos da aplicação em uma pasta dentro de "C:\inetpub\wwwroot".
- Acesso padrão a página inicial:"http://localhost/{nome_da_pasta}/".
- Obs: Pode ser necessário acessar o IIS, acessar as configurações avançadas da Pool de Aplicativos e habilitar aplicativos de 32 bits.
- Instalar o SQL Server, o Driver do Microsoft OLE DB para SQL Server(MSOLEDBSQL), gerar o banco de dados e a tabela, e criar um logon "root" com senha "senhaDesafio123%".
---

## Vídeo de execução
Link Google Drive: https://drive.google.com/file/d/1ZY_jIW_BAE1n3u1XnIuG7mtB8HN3klUu/view?usp=sharing

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
    
   [SQL Server]: <https://www.microsoft.com/pt-br/sql-server>
   [Bootstrap 5.3]: <https://getbootstrap.com/>


  
