# Terraform
 - Um único binário Go
 - Escrever em HCL um ou vários arquivos com a extensão .tf
 - O Terraform lê todos os arquivos do diretório corrente e planeja a melhor ordem em que deve criar os recursos
 - Executa uma sequência de chamadas de API para o provider configurado na ordem correta
 - Após a execução do planejamento (apply) o Terraform criará um arquivo `.tfstate` com o estado atual
 - Terraform workflow: write > plan > apply

# Terraform state
É um arquivo em formato JSON que armazena uma representação do estado atual da infraestrutura gerenciada pelo Terraform. Por padrão recebe o nome `terraforn.tfstate`.
Uma boa prática é configurar um backend para armazenar o estado do Terraform que armazenará remotamente evitando conflitos quando utilizado por uma equipe.

## Funções principais

1. Rastrear recursos provisionados
Ele mantém um mapa entre os recursos definidos no código .tf e os recursos reais criados na nuvem.

2. Detectar mudanças
Permite ao Terraform saber o que precisa ser criado, modificado ou destruído ao rodar plan ou apply.

3. Evitar recriações desnecessárias
Sem ele, o Terraform não sabe o que já existe e pode tentar criar tudo de novo.

4. Controlar o ciclo de vida da infraestrutura
Contém IDs, atributos, relacionamentos e metadados dos recursos provisionados.