# Curso GIT
## Índice

1. [Introdução](#introdução)
2. [Instalação](#instalação)
3. [Comandos](#comandos-e-definições-dos-comandos-estudadosomandos)


## Introdução

Repositório do curso de Git com anotações diversas sobre o conteúdo abordado no curso.

## Instalação do GIT

Para instalação, foi seguido instruções do guia oficial no site [site oficial](https://git-scm.com/).

## Comandos e definições dos comandos estudados.

### Exibindo logs

```sh
git log
```

### Configurando seu nome de usuário e e-mail (globalmente)
```sh
git config --global user.name "Nome Sobrenome"
```
```sh
git config --global user.email seuemail@email.com
```

### Configurando o nome da Branch Padrão

```sh
 git config --global init.defaultBranch main

```

## Trabalhando com repositórios

#### Clona um repositório 

Clona um repositório Git existente para um novo diretório (pasta) local.


```sh
git clone https://github.com/user/repositorio.git
```

#### Clona um repositório 
```sh
git clone https://github.com/user/repositorio.git
```

### Criando um Repositório Local

#### Inicializa o repositório local.
```sh
git init 

```

#### Conecte o repositório local com o repositório remoto:
```sh
git remote add origin https://github.com/username/nome-do-repositorio.git
```

#### Exibe o status do repositório, mostra arquivos e diretórios rastreados para comitar.
```sh
git status 
```
#### Adiciona todos os arquivos na fila de rastreamento
```sh
git add . 
```
#### Prepara todos os arquivos em fila de rastreamento para envio
```sh
git commit -m "mensagem de commit"
```
#### Envia “empurra” as alterações do repositório local para o remoto.
```sh
git push
```
#### Baixa “puxa” as alterações do repositório remoto para o local (busca e mescla).

```sh
git pull 
```
#### Conecanto repoistório remoto

```sh
git remote add origin https://github.com/username/nome-do-repositorio.git
```
```sh
git push -u origin main
```
## Desfazer alterações nos repositórios

#### Alterar mensagem do ultimo commit

Digitando apenas git commit --amend será aberto o editor com os dados do ultimo commit.

```sh
git commit --amend –m"nova mensagem"
```
### Desfazer um commit

git reset --soft / --hard ou --mixed

```sh
it reset --soft
```
```sh
it reset --hard
```
```sh
it reset --mixex
```
git reset nome do arquivo ---> remove o arquivo do commit.

### Trabalhando com branches

#### Exibe os branches
```sh
git branch
```

#### Trocar de Branch 

```sh
 git checkout branche
```

#### Trocar de Branch e criar uma nova

```sh
 git checkout -b nova-branch
```

#### Deletar uma Branch

```sh
 git branch –d nome-da-branch
```

#### Ver o último commit de cada Branch:

```sh
 git branch -v
```

### Comandos úteis

Baixa conteúdo da branch remota sem alterar a local

```sh
git fetch
```
Após, roda o push para atualizar o repósitório


```sh
git push
```
### Clonar um branch
git clone endereço --branch nomebrach --single-branch

### Recuperar arquivo apagado
```sh
git stash "nome do arquivo"
```

<!-- ## Contribuição -->

<!-- Contribuições são bem-vindas! Por favor, envie um pull request ou abra uma issue para discutir as mudanças que deseja fazer. -->

<!-- ## Licença -->

<!-- Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes. -->

## Contato

Para mais informações, entre em contato pelo email: icfranca@hotmail.com