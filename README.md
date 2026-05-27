# terraform-root — Módulo Raíz

Repositorio principal que orquesta los módulos de Terraform para desplegar
la infraestructura completa en AWS.

## Estructura de módulos

```
terraform-root/
├── main.tf            # Llama a los 3 módulos externos
├── variables.tf       # Variables globales del stack
├── outputs.tf         # Outputs del stack completo
├── terraform.tfvars   # Valores por defecto (sin credenciales)
├── .gitignore
└── .github/
    └── workflows/
        ├── terraform.yml   # Workflow reutilizable: fmt, validate, tflint
        ├── checkov.yml     # Workflow reutilizable: análisis de seguridad
        └── main.yml        # Trigger: ejecuta los workflows en PR a main

Módulos externos (repositorios independientes):
├── terraform-module-networking   → VPC, subredes, IGW, rutas
├── terraform-module-compute      → EC2, Security Group
└── terraform-module-storage      → S3 Bucket con versionado
```

## ¿Qué hace cada módulo?

| Módulo | Repositorio | Descripción |
|---|---|---|
| networking | terraform-module-networking | Crea la red base: VPC, subredes pública/privada, Internet Gateway y tabla de rutas |
| compute | terraform-module-compute | Despliega una instancia EC2 con Apache y su Security Group |
| storage | terraform-module-storage | Crea un bucket S3 con versionado y acceso público bloqueado |

## Historial de versiones (SemVer)

| Versión | Tipo | Descripción |
|---|---|---|
| v0.1.0 | Inicial | Código monolítico (Prueba 1) |
| v0.2.0 | MINOR | Se agrega módulo networking con variables y outputs |
| v0.2.1 | PATCH | Fix: corrección de bug en nombre del Security Group |
| v1.0.0 | MAJOR | Arquitectura modular completa: networking + compute + storage |

## Justificación del número de versión

El salto a **v1.0.0** está justificado porque representa un cambio de
arquitectura (MAJOR): el código pasa de monolítico a modular, lo cual
rompe la estructura anterior e introduce 3 módulos independientes y
reutilizables.

- `v0.1.0` → Versión monolítica inicial (Prueba 1)
- `v0.2.0` → MINOR: primer módulo independiente + variables/outputs nuevas
- `v0.2.1` → PATCH: corrección de un bug (una línea de código)
- `v1.0.0` → MAJOR: refactorización completa a arquitectura modular

## Uso

```bash
# 1. Configurar credenciales AWS
export AWS_ACCESS_KEY_ID=<tu_access_key>
export AWS_SECRET_ACCESS_KEY=<tu_secret_key>
export AWS_SESSION_TOKEN=<tu_session_token>

# 2. Inicializar y desplegar
terraform init
terraform plan
terraform apply

# 3. Ver outputs
terraform output

# 4. Destruir (al finalizar el laboratorio)
terraform destroy
```

## Requisitos

- Terraform >= 1.0.0
- AWS CLI configurado con credenciales válidas
- Provider AWS ~> 5.0

## CI/CD

GitHub Actions valida automáticamente el código en cada Pull Request a `main`:
- `terraform fmt -check` — formato del código
- `terraform validate` — validación de sintaxis
- `tflint` — análisis estático
- `checkov` — análisis de seguridad (políticas de seguridad en la nube)
