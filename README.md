# GitHub Trending

Projeto para buscar os reposioritos destaques das linguages Java, Ruby, Go,C e Python

Especificaçoes

* Ruby 2.4.5

* Rails 5.0.3

* PostgreSQL

Rodando o projeto

* Baixar o projeto e acessar a pasta dele no terminal
* Rodar bundle install para instalar as gems
* Rodar rails db:create para criar o banco
* Rodar rails db:migrate para executar as migraçoes
* Rodar rails s
* Acessar http://localhost:3000

Rodando os testes

* Na pasta do projeto rodar rails:db:migrate RAILS_ENV=test para executar as migraçoes no banco de teste
* Rodar rails db:test:prepare para preparar o database
* Rodar rspec spec/ para executar os testes

Link Heroku: https://github-trendings.herokuapp.com
