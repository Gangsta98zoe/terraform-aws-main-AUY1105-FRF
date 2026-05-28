# terraform-aws-main-AUY1105-FRF — Repositorio Principal

## Objetivos del repositorio
Orquesta los 3 módulos de infraestructura AWS para desplegar
el stack completo: VPC + EC2 + S3.

## Propósito general
Actúa como controlador central que integra los módulos desacoplados
desarrollados en repositorios independientes.

## Estructura de módulos

terraform-aws-main-AUY1105-FRF/
├── main.tf           # Llama a los 3 módulos
├── variables.tf      # Variables globales
├── outputs.tf        # Outputs del stack
├── terraform.tfvars  # Valores por defecto
└── .github/workflows/ # CI/CD automático

Módulos externos (repos independientes):
├── terraform-aws-vpc-AUY1105-FRF  → VPC, subredes, IGW
├── terraform-aws-ec2-AUY1105-FRF  → EC2 + Security Group
└── terraform-aws-s3-AUY1105-FRF   → S3 con versionado

## Historial de versiones
| Versión | Tipo  | Descripción |
|---------|-------|-------------|
| v0.1.0  | Init  | Código monolítico base (Evaluación 1) |
| v0.2.0  | MINOR | Integración primer módulo (vpc) |
| v0.2.1  | PATCH | Fix fuente de módulos a repos nuevos |
| v1.0.0  | MAJOR | Arquitectura modular completa |

## Instrucciones de uso

```bash
export AWS_ACCESS_KEY_ID=<key>
export AWS_SECRET_ACCESS_KEY=<secret>
export AWS_SESSION_TOKEN=<token>
terraform init
terraform plan
terraform apply
terraform output
terraform destroy
```

## CI/CD
GitHub Actions ejecuta en cada PR a main:
- terraform fmt -check
- terraform validate
- tflint
- checkov (análisis de seguridad)
