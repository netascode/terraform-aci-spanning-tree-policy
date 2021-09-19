output "dn" {
  value       = aci_rest.stpIfPol.id
  description = "Distinguished name of `stpIfPol` object."
}

output "name" {
  value       = aci_rest.stpIfPol.content.name
  description = "Spanning tree policy name."
}
