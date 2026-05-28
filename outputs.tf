CONTENIDO COMPLETO PARA outputs.tf:

output "vpc_id" {
  description = "ID de la VPC"
  value       = module.vpc.vpc_id
}

output "ec2_instance_ip" {
  description = "IP pública de la instancia EC2"
  value       = module.ec2.instance_ip
}

output "s3_bucket_name" {
  description = "Nombre del bucket S3"
  value       = module.s3.bucket_name
}
