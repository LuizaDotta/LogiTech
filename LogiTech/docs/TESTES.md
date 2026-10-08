# Plano de Testes — LogiTech Express

Este documento apresenta os cenários e validações que deverão ser implementados na próxima UC para verificar o funcionamento correto da aplicação, do banco de dados e das rotas da API.

---

# 1. Testes de Frotas

## 1.1 Cadastrar uma frota válida

**Objetivo:** verificar se uma frota pode ser cadastrada com todos os dados obrigatórios.

**Dados de teste:**

- Nome: Frota Norte
- Descrição: Frota responsável pelas entregas da região norte
- Localização: Luzerna

**Resultado esperado:**

- A frota deve ser cadastrada com sucesso.
- O `id_frota` deve ser gerado automaticamente.

---

## 1.2 Cadastrar frota sem nome

**Objetivo:** verificar a validação do campo obrigatório `nome`.

**Resultado esperado:**

- O cadastro deve ser recusado.
- O sistema deve informar que o nome é obrigatório.

---

## 1.3 Consultar frota existente

**Resultado esperado:**

- A frota deve ser encontrada.
- Seus dados devem ser retornados.

---

## 1.4 Consultar frota inexistente

**Resultado esperado:**

- O sistema deve informar que a frota não foi encontrada.

---

# 2. Testes de Motoristas

## 2.1 Cadastrar motorista válido

**Dados de teste:**

- Nome: João da Silva
- CPF: `12345678901`
- Telefone: `49999999999`
- CNH: `123456789`
- `id_frota`: ID de uma frota existente

**Resultado esperado:**

- Motorista cadastrado com sucesso.
- O `id_motorista` deve ser gerado automaticamente.

---

## 2.2 Cadastrar motorista sem nome

**Resultado esperado:**

- Cadastro recusado.
- O sistema deve informar que o nome é obrigatório.

---

## 2.3 Cadastrar motorista sem CPF

**Resultado esperado:**

- Cadastro recusado.

---

## 2.4 Cadastrar CPF duplicado

**Resultado esperado:**

- Cadastro recusado.
- Não deve existir outro motorista com o mesmo CPF.

---

## 2.5 Cadastrar CNH duplicada

**Resultado esperado:**

- Cadastro recusado.
- Não deve existir outro motorista com a mesma CNH.

---

## 2.6 Associar motorista a uma frota inexistente

**Resultado esperado:**

- Cadastro recusado.
- A chave estrangeira `id_frota` deve impedir a associação inválida.

---

# 3. Testes de Veículos

## 3.1 Cadastrar veículo válido

**Dados de teste:**

- Placa: `ABC1D23`
- Modelo: Sprinter
- Marca: Mercedes-Benz
- Ano: 2025
- Status: Disponível
- `id_frota`: ID existente

**Resultado esperado:**

- Veículo cadastrado com sucesso.

---

## 3.2 Cadastrar veículo sem placa

**Resultado esperado:**

- Cadastro recusado.

---

## 3.3 Cadastrar placa duplicada

**Resultado esperado:**

- Cadastro recusado.
- Não podem existir dois veículos com a mesma placa.

---

## 3.4 Associar veículo a uma frota inexistente

**Resultado esperado:**

- Cadastro recusado devido à chave estrangeira.

---

# 4. Testes de Ferramentas

## 4.1 Cadastrar ferramenta válida

**Dados de teste:**

- Nome: Rádio comunicador
- Descrição: Equipamento para comunicação
- Quantidade: 10
- `id_frota`: ID existente

**Resultado esperado:**

- Ferramenta cadastrada com sucesso.

---

## 4.2 Cadastrar ferramenta sem nome

**Resultado esperado:**

- Cadastro recusado.

---

## 4.3 Cadastrar quantidade inválida

**Exemplo:**

- Quantidade: `-5`

**Resultado esperado:**

- Cadastro recusado.
- A quantidade não pode ser negativa.

---

## 4.4 Associar ferramenta a uma frota inexistente

**Resultado esperado:**

- Cadastro recusado devido à chave estrangeira.

---

# 5. Testes de Clientes

## 5.1 Cadastrar cliente válido

**Dados de teste:**

- Nome: Empresa Exemplo
- CPF/CNPJ: `12345678000199`
- Telefone: `49999999999`
- E-mail: cliente@email.com
- Endereço: Rua Principal, 100
- Cidade: Luzerna
- Estado: SC

**Resultado esperado:**

- Cliente cadastrado com sucesso.

---

## 5.2 Cadastrar cliente sem nome

**Resultado esperado:**

- Cadastro recusado.

---

## 5.3 Cadastrar e-mail duplicado

**Resultado esperado:**

- Cadastro recusado.

---

## 5.4 Cadastrar CPF/CNPJ duplicado

**Resultado esperado:**

- Cadastro recusado.

---

# 6. Testes de Entregas

## 6.1 Criar entrega válida

**Dados necessários:**

- Data da entrega
- Hora da entrega
- Status
- Origem
- Destino
- Cliente existente
- Motorista existente
- Veículo existente

**Resultado esperado:**

- Entrega cadastrada com sucesso.
- O `id_entrega` deve ser gerado automaticamente.

---

## 6.2 Criar entrega sem cliente

**Resultado esperado:**

- Cadastro recusado.

---

## 6.3 Criar entrega com cliente inexistente

**Resultado esperado:**

- Cadastro recusado pela chave estrangeira.

---

## 6.4 Criar entrega com motorista inexistente

**Resultado esperado:**

- Cadastro recusado pela chave estrangeira.

---

## 6.5 Criar entrega com veículo inexistente

**Resultado esperado:**

- Cadastro recusado pela chave estrangeira.

---

## 6.6 Criar entrega sem origem

**Resultado esperado:**

- Cadastro recusado.

---

## 6.7 Criar entrega sem destino

**Resultado esperado:**

- Cadastro recusado.

---

# 7. Testes de Itens da Entrega

## 7.1 Cadastrar item válido

**Dados de teste:**

- Descrição: Caixa de produtos
- Quantidade: 5
- Peso: 20,50 kg
- `id_entrega`: ID existente

**Resultado esperado:**

- Item cadastrado com sucesso.

---

## 7.2 Cadastrar item sem descrição

**Resultado esperado:**

- Cadastro recusado.

---

## 7.3 Cadastrar quantidade inválida

**Exemplo:**

- Quantidade: `-2`

**Resultado esperado:**

- Cadastro recusado.

---

## 7.4 Cadastrar peso inválido

**Exemplo:**

- Peso: `-10,00`

**Resultado esperado:**

- Cadastro recusado.

---

## 7.5 Associar item a uma entrega inexistente

**Resultado esperado:**

- Cadastro recusado pela chave estrangeira.

---

# 8. Testes de Relacionamentos

## 8.1 Verificar relacionamento Frota → Motoristas

**Objetivo:** verificar se um motorista pode ser relacionado corretamente a uma frota.

**Resultado esperado:**

- O motorista deve possuir um `id_frota` correspondente a uma frota existente.

---

## 8.2 Verificar relacionamento Frota → Veículos

**Objetivo:** verificar se um veículo pode ser relacionado corretamente a uma frota.

**Resultado esperado:**

- O veículo deve possuir um `id_frota` correspondente a uma frota existente.

---

## 8.3 Verificar relacionamento Cliente → Entregas

**Resultado esperado:**

- Uma entrega deve estar associada a um cliente existente.

---

## 8.4 Verificar relacionamento Motorista → Entregas

**Resultado esperado:**

- Uma entrega deve possuir um motorista existente.

---

## 8.5 Verificar relacionamento Veículo → Entregas

**Resultado esperado:**

- Uma entrega deve possuir um veículo existente.

---

## 8.6 Verificar relacionamento Entrega → Itens

**Resultado esperado:**

- Cada item deve estar associado a uma entrega existente.

---

# 9. Testes de Integridade do Banco

## 9.1 Testar chaves primárias

**Objetivo:** verificar se cada registro possui um identificador único.

**Resultado esperado:**

- Não devem existir duas linhas com o mesmo valor de chave primária.

---

## 9.2 Testar chaves estrangeiras

**Objetivo:** verificar se os relacionamentos entre as tabelas são respeitados.

**Resultado esperado:**

- Não deve ser possível inserir uma chave estrangeira que não exista na tabela relacionada.

---

## 9.3 Testar campos NOT NULL

**Objetivo:** verificar os campos obrigatórios.

**Resultado esperado:**

- Campos definidos como `NOT NULL` não podem receber valores vazios ou nulos.

---

## 9.4 Testar campos UNIQUE

**Objetivo:** verificar dados que não podem ser repetidos.

**Resultado esperado:**

- CPF, CNH, placa e outros campos definidos como `UNIQUE` não devem aceitar duplicidades.

---

# 10. Testes de Normalização

## 10.1 Verificar ausência de listas em uma coluna

**Objetivo:** garantir que informações como ferramentas e motoristas não sejam armazenadas em uma única coluna separadas por vírgula.

**Resultado esperado:**

- Cada informação deve estar armazenada de maneira estruturada nas tabelas correspondentes.

---

## 10.2 Verificar ausência de dados duplicados

**Objetivo:** evitar que os mesmos dados sejam repetidos desnecessariamente.

**Resultado esperado:**

- Os dados devem estar separados entre as entidades correspondentes.

---

## 10.3 Verificar relacionamentos por chaves

**Objetivo:** garantir que as relações entre as entidades sejam feitas por PK e FK.

**Resultado esperado:**

- As tabelas devem utilizar suas chaves para estabelecer os relacionamentos.

---

# 11. Testes das Rotas da API

Na próxima UC deverão ser implementados testes para as principais rotas da aplicação.

## 11.1 Testes GET

### GET /frotas

**Resultado esperado:**

- Retornar a lista de frotas cadastradas.

### GET /motoristas

**Resultado esperado:**

- Retornar a lista de motoristas cadastrados.

### GET /veiculos

**Resultado esperado:**

- Retornar a lista de veículos cadastrados.

### GET /clientes

**Resultado esperado:**

- Retornar a lista de clientes cadastrados.

### GET /entregas

**Resultado esperado:**

- Retornar a lista de entregas cadastradas.

---

## 11.2 Testes POST

### POST /frotas

**Resultado esperado:**

- Criar uma nova frota quando os dados forem válidos.

### POST /motoristas

**Resultado esperado:**

- Criar um novo motorista quando os dados forem válidos.

### POST /veiculos

**Resultado esperado:**

- Criar um novo veículo quando os dados forem válidos.

### POST /clientes

**Resultado esperado:**

- Criar um novo cliente quando os dados forem válidos.

### POST /entregas

**Resultado esperado:**

- Criar uma nova entrega quando os dados forem válidos.

---

# 12. Testes de Erros

Deverão ser testados cenários em que o usuário envia dados inválidos.

### Cenários

- Campo obrigatório ausente.
- Campo com tipo de dado incorreto.
- ID inexistente.
- Registro duplicado.
- Valor negativo onde não é permitido.
- Registro não encontrado.
- Tentativa de criar relacionamento com registro inexistente.

**Resultado esperado:**

- A API deve retornar uma resposta de erro adequada.
- O erro deve ser informado de forma clara.
- O sistema não deve inserir dados inválidos no banco.

---

# 13. Testes de Contrato JSON

As respostas da API deverão seguir o formato JSON definido no projeto.

## 13.1 Cenário de sucesso

**Resultado esperado:**

```json
{
    "id_frota": 1,
    "nome": "Frota Norte",
    "descricao": "Frota responsável pelas entregas",
    "localizacao": "Luzerna"
}