# Curso GIT
## Índice

1. [Introdução](#introdução)
2. [Instalação](#instalação)
3. [Uso](#uso)
<!-- 4. [Contribuição](#contribuição) -->
<!-- 5. [Licença](#licença) -->
<!-- 6. [Contato](#contato) -->

## Introdução

Repositório do curso de Git com anotações diversas sobre o conteúdo abordado no curso.

## Instalação do GIT

Para instalação, foi seguido instruções do guia oficial no site [site oficial](https://git-scm.com/).

## Comandos e definições dos comandos aprendiso.

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

## Desfazer alterações nos repositórios




<!-- ## Contribuição -->

<!-- Contribuições são bem-vindas! Por favor, envie um pull request ou abra uma issue para discutir as mudanças que deseja fazer. -->

<!-- ## Licença -->

<!-- Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes. -->

## Contato

Para mais informações, entre em contato pelo email: icfranca@hotmail.com