# LOGITECH EXPRESS

## Diagnóstico do Problema e Arquitetura Sugerida

### 1. Introdução

A LogiTech Express é uma empresa multinacional do setor de logística que possui problemas relacionados à organização de seus dados, à estrutura do backend e à segurança das informações.

O sistema atual apresenta dificuldades que podem prejudicar a manutenção, a evolução e a confiabilidade da aplicação. Entre os principais problemas identificados estão a falta de normalização do banco de dados, a duplicação de informações de motoristas, o armazenamento inadequado de ferramentas e itens de frota e a mistura de diferentes responsabilidades dentro do backend.

Diante desses problemas, foi proposta uma reorganização da estrutura do sistema, utilizando um banco de dados normalizado e uma arquitetura baseada em MVC e Repository.

---

# 2. Diagnóstico do Problema

## 2.1 Falta de normalização do banco de dados

Um dos principais problemas encontrados está relacionado à estrutura do banco de dados.

O banco atual apresenta informações que não estão devidamente organizadas e normalizadas. Isso pode causar duplicidade de dados e dificultar a realização de consultas e alterações.

Um exemplo apresentado no desafio é o armazenamento de itens e ferramentas de uma frota como uma lista de informações separadas por vírgulas.

Esse tipo de armazenamento dificulta o controle individual dos dados.

Por exemplo:

**Frota 01**

**Ferramentas:** GPS, Rádio, Kit de primeiros socorros

Nesse formato, as ferramentas estão agrupadas dentro de um único campo.

A proposta é separar essas informações em entidades próprias, permitindo que cada ferramenta seja cadastrada e relacionada corretamente à sua respectiva frota.

---

## 2.2 Duplicação de motoristas

Outro problema identificado é a existência de motoristas duplicados no banco de dados.

Quando o mesmo motorista é cadastrado mais de uma vez, podem surgir inconsistências nas informações.

Por exemplo, um cadastro pode possuir um telefone atualizado enquanto outro cadastro do mesmo motorista possui um telefone antigo.

Para evitar esse problema, os motoristas devem possuir uma tabela própria e um identificador único.

A tabela pode utilizar:

- `id_motorista`
- `nome`
- `cpf`
- `telefone`
- `cnh`
- `id_frota`

O campo `id_motorista` será utilizado como chave primária para identificar cada motorista.

---

## 2.3 Backend com responsabilidades misturadas

O backend atual também apresenta problemas de organização.

Segundo o diagnóstico do desafio, a aplicação mistura responsabilidades como:

- lógica das rotas;
- conexão com o banco de dados;
- regras da aplicação;
- respostas enviadas para a interface.

Quando todas essas funções ficam concentradas nos mesmos arquivos, o código se torna mais difícil de entender, testar e modificar.

Por isso, será necessário separar as responsabilidades em diferentes camadas.

---

## 2.4 Problemas de segurança

Também foram identificados problemas relacionados à segurança, principalmente envolvendo credenciais e tokens de API expostos.

Informações sensíveis não devem ficar diretamente dentro dos arquivos do projeto que serão enviados para o repositório.

Para solucionar esse problema, a arquitetura proposta utilizará um arquivo `.env` para armazenar informações sensíveis e um `.gitignore` para impedir que esse arquivo seja enviado ao repositório.

A utilização dessas ferramentas faz parte da proposta de segurança apresentada no desafio.

---

# 3. Arquitetura Sugerida

Para solucionar os problemas encontrados, será utilizada uma arquitetura organizada em diferentes camadas.

A proposta apresentada no desafio utiliza os conceitos de **MVC (Model-View-Controller)** juntamente com o padrão **Repository**, buscando tornar o backend mais organizado e escalável.

A estrutura sugerida pode ser representada da seguinte maneira:

```text
FRONTEND
   │
   ▼
ROUTES
   │
   ▼
CONTROLLER
   │
   ▼
SERVICE
   │
   ▼
REPOSITORY
   │
   ▼
DATABASE