# Changelog — terraform-aws-main-AUY1105-FRF

## [v1.1.0] - 2026-07-08
### Changed
- Módulo vpc actualizado v1.0.0 → v1.1.0 (locals common_tags)
- Módulo s3 actualizado v1.0.0 → v1.1.0 (versions.tf + cifrado SSE AES256)
- Workflows CI con permissions de mínimo privilegio y excepciones Checkov documentadas

La actualización de módulos es explícita vía ?ref: los releases nuevos de los
módulos no afectan a este repositorio hasta cambiar la referencia (pin SemVer).

## [v1.0.0] - 2026-05-27
### Added
- Arquitectura modular completa: vpc + ec2 + s3
- GitHub Actions: terraform fmt, validate, tflint, checkov
- Documentación completa README.md y CHANGELOG.md

### Changed
- Sources actualizados a repos nuevos (terraform-aws-*-AUY1105-FRF)
- Módulos referenciados con tag v1.0.0

---

## [v0.2.1] - 2026-05-27
### Fixed
- Corrige referencias de source a los repositorios correctos

---

## [v0.2.0] - 2026-05-27
### Added
- Integración del módulo vpc con variables y outputs

---

## [v0.1.0] - 2026-05-27
### Added
- Código monolítico base heredado de Evaluación Parcial 1
