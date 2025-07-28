# Projeto Terraform para Oracle Cloud Infrastructure (OCI)

Este projeto utiliza o Terraform para provisionar recursos na Oracle Cloud Infrastructure (OCI), incluindo compartimentos, redes, instâncias e chaves SSH.

## Estrutura do Projeto

- **main.tf**: Criação do compartment e consulta de domínios de disponibilidade.
- **network.tf**: Criação da VCN, subnet, gateway de internet, tabela de rotas e regras de segurança.
- **instance.tf**: Provisão da instância compute, geração e armazenamento das chaves SSH.
- **variables.tf**: Definição das variáveis de entrada.
- **terraform.tfvars**: Valores das variáveis sensíveis e de configuração.
- **output.tf**: Outputs relevantes, como IP público da instância.
- **user-data-ubuntu.sh / user-data-oracle.sh**: Scripts de inicialização para as VMs.
- **.ssh/**: Diretório para armazenamento das chaves SSH geradas.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Conta na Oracle Cloud com permissões para criar recursos
- Chave API configurada

## Como usar

1. Clone o repositório e acesse o diretório do projeto.
2. Configure as variáveis em `terraform.tfvars` conforme sua conta OCI.
3. Inicialize o Terraform: `terraform init`
4. Validar o código Terraform antes de aplicar: `terraform validate`
5. Aplicar as alterações no OCI: `terraform apply`
6. Destruir os recursos criados: `terraform destroy`

### Exemplo do arquivo `terraform.tfvars`
```hcl
# Exemplo de arquivo terraform.tfvars

tenancy_ocid        = "ocid1.tenancy.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
user_ocid           = "ocid1.user.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
compartment_ocid    = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
fingerprint         = "aa:bb:cc:dd:ee:ff:00:11:22:33:44:55:66:77:88:99"
private_key_path    = "/caminho/para/sua/chave.pem"
region              = "sa-saopaulo-1"

project_name        = "meu_projeto"
shape               = "VM.Standard.E2.1.Micro"
subnet              = "ocid1.subnet.oc1.sa-saopaulo-1.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
public_key_instance = "./minha_chave_ssh.pub"
```

## Observações

- O script de inicialização (user-data-ubuntu.sh ou user-data-oracle.sh) instala pacotes 
essenciais e configura o ambiente da VM.
- As chaves SSH são geradas automaticamente e salvas em .ssh/.
- Certifique-se de manter suas chaves privadas em segurança.

## Licença
MIT