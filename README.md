# Terraform arch
 - Um único binário Go
 - Escrever em HCL um ou vários arquivos com a extensão .tf
 - O Terraform lê todos os arquivos do diretório corrente e planeja a melhor ordem em que deve criar os recursos
 - Executa uma sequência de chamadas de API para o provider configurado na ordem correta
 - Após a execução do planejamento (apply) o Terraform criará um arquivo `.tfstate` com o estado atual
 - Esse arquivo é usado para comparar o estado desejado com o existente em cloud e serve para aplicar somente o que for diferente
 - O arquivo `.tfstate` precisa ser persistido em um local compartilhado
 - Terraform workflow: write > plan > apply
