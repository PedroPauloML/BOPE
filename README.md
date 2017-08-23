## BOPE SYSTEM

Sistema de gerenciamento de atividades para instituições educacionais.

## Dependências do projeto

* ImageMagick (https://www.imagemagick.org)

```
sudo apt-get update
sudo apt-get install imagemagick
```

## Funcionalidades

* Cadastro e gerenciamento de usuários (acesso: parcial/total);
* Cadastro e gerenciamento de equipes;
* Cadastro e gerenciamento de projetos;
* Cadastro e gerenciamento de sprints;
* Gerenciamento das semanas das sprints;
* Cadastro e gerenciamento de atividades;
* Cadastro e gerenciamento de rótulos;
* Cadastro e gerenciamento de status;
* Cadastro e gerenciamento de cores;

## Funcionamento

As equipes são compostas de um número ilimitados de usuários, podendo esses estar em mais de uma equipe.
Cada equipe tem somente um projeto, sendo ele divido em sprints (etapas), que são compostas por semanas. O cadastro das atividades são relacionadas a um projeto e a uma sprint.
Os rótulos e os status são elementos que se relacionam com as atividades.
As cores se relacionam com os rótulos e os status.

Cada usuário tem um nível de acesso no sistema (acesso: parcial/total). Esse acesso restringe a ele as funcionalidades do sistema.

> **Função do acesso parcial:** contabilização de horas no projeto escolhido e que esteja em andamento. Além de outras.
> **Função exclusiva do acesso total:** gerenciamento total do sistema e geração de relatórios. Além de outras.