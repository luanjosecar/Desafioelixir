# Desafioelixir

Sistema desenvolvido a partir da linguagem elixir que se alimenta de uma API e retornar uma lista de valores ordenados

## Instalação

De forma a rodar o código se é necessário instalar os sistemas Elixir/Earlang. Os passos para a instalação podem ser encontrado em

https://elixir-lang.org/install.html

Com os mesmos instalados no terminal executaremos as seguintes linhas de código :

```bash
# Baixando o repositório

$ git clone https://github.com/luanjosecar/Desafioelixir.git

# Entrar na pasta
$ cd Desafioelixir

# Instalar dependências adicionais
$ mix deps.get

# Execução da aplicação

$ mix run --no-halt

```

A aplicação irá iniciar a alimentação com base na API de Link

http://challenge.dienekes.com.br/api/numbers?page

Variando o valor de páge até encontrar um retorno do formato []

Então será iniciado um servidor REST na porta 4000, quer retornará a lista alimentada de forma ordenada.

## Docker

A aplicação também está disponivel no Docker:

```bash
$ docker push luanjosecar/desafioelixir:tagname
```
