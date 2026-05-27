output "vpc_id" {
  description = "ID de la VPC"
  value       = module.networking.vpc_id
}

output "ec2_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = module.compute.public_ip
}

output "s3_bucket_name" {
  description = "Nombre del bucket S3"
  value       = module.storage.bucket_name
}
