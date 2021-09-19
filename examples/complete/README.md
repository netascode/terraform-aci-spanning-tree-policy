<!-- BEGIN_TF_DOCS -->
# Spanning Tree Policy Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

```hcl
module "aci_spanning_tree_policy" {
  source  = "netascode/spanning-tree-policy/aci"
  version = ">= 0.0.1"

  name        = "STP1"
  bpdu_filter = true
  bpdu_guard  = true
}

```
<!-- END_TF_DOCS -->