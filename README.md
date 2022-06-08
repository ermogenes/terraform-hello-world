# Terraform Hello-World

Criaremos uma instância EC2 na AWS.

## Instalação

Instale o binário do Terraform CLI.
- Windows: baixe o executável e coloque no path.
- Linux: use o gerenciador de pacotes da distribuição.

Instale a extensão do VsCode oficial da Hashicorp.

Crie uma pasta e abra no VsCode.

## Primeiros passos

Crie um arquivo `main.tf`.

Obtenha uma chave de acesso na AWS.

Selecione uma região, um AMI e um tipo de instância.

⚠ _Os códigos de AMI e os tipos de instância disponíveis mudam por região. Consulte na AWs Console._

```
provider "aws" {
  region = "us-east-1"
  access_key = "xxxxxxxx"
  secret_key = "yyyyyyyy"
}

resource "aws_instance" "ec2_tf_hello-world" {
    ami = "ami-0022f774911c1d690" // Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
    instance_type = "t2.micro"
}
```

Abra um terminal e inicialize o projeto:

```bash
terraform init
```

As dependências serão instaladas (ex. provedor para a AWS).

## Visualizando o plano de execução

```bash
terraform plan
```

Serão exibidos os itens a serem modificados. No exemplo abaixo, será criada uma instância nova.

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.ec2_tf_hello-world will be created
  + resource "aws_instance" "ec2_tf_hello-world" {
      + ami                                  = "ami-0022f774911c1d690"
      + arn                                  = (known after apply)    
      + associate_public_ip_address          = (known after apply)    
      + availability_zone                    = (known after apply)    
      + cpu_core_count                       = (known after apply)    
      + cpu_threads_per_core                 = (known after apply)    
      + disable_api_termination              = (known after apply)    
      + ebs_optimized                        = (known after apply)    
      + get_password_data                    = false
      + host_id                              = (known after apply)    
      + id                                   = (known after apply)    
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id                 = (known after apply)
              + capacity_reservation_resource_group_arn = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + maintenance_options {
          + auto_recovery = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_card_index    = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

## Executando o plano

```bash
terraform apply
```

O plano será exibido e será solicitada uma confirmação. Digite `yes`.

```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

Sua infra será criada após alguns segundos.

```
aws_instance.ec2_tf_hello-world: Creating...
aws_instance.ec2_tf_hello-world: Still creating... [10s elapsed]
aws_instance.ec2_tf_hello-world: Still creating... [20s elapsed]
aws_instance.ec2_tf_hello-world: Still creating... [30s elapsed]
aws_instance.ec2_tf_hello-world: Still creating... [40s elapsed]
aws_instance.ec2_tf_hello-world: Still creating... [50s elapsed]
aws_instance.ec2_tf_hello-world: Creation complete after 54s [id=i-0e48e99596d5ec5e5]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

Ao refazer o `plan`, veja que nada precisa mais ser alterado:

```
aws_instance.ec2_tf_hello-world: Refreshing state... [id=i-0e48e99596d5ec5e5]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
```

Caso repita o comando `apply`, os recursos já existem e não serão recriados.

```
aws_instance.ec2_tf_hello-world: Refreshing state... [id=i-0e48e99596d5ec5e5]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```
`
## Modificando o recurso

Vamos adicionar uma tag ao recurso:

```
    tags = {
      Name = "terraform-hello-world"
    }
```

Ao executar o `plan`, ele detecta a modificação.

```
aws_instance.ec2_tf_hello-world: Refreshing state... [id=i-0e48e99596d5ec5e5]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.ec2_tf_hello-world will be updated in-place        
  ~ resource "aws_instance" "ec2_tf_hello-world" {
        id                                   = "i-0e48e99596d5ec5e5"
      ~ tags                                 = {
          + "Name" = "terraform-hello-world"
        }
      ~ tags_all                             = {
          + "Name" = "terraform-hello-world"
        }
        # (28 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

Ao fazer o `apply` e confirmar com `yes`, a tag é criada.

```
aws_instance.ec2_tf_hello-world: Modifying... [id=i-0e48e99596d5ec5e5]
aws_instance.ec2_tf_hello-world: Modifications complete after 2s [id=i-0e48e99596d5ec5e5]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```

A tag `Name` representa o nome do recurso para exibição no AWS Console.
