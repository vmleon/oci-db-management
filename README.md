# OCI Database Management Workshop

[Workshop Content with LiveLabs format](https://vmleon.github.io/oci-db-management/terraform/livelabs/workshops/freetier/index.html)

## Deployment

```bash
git clone https://github.com/vmleon/oci-db-management.git
```

```bash
cd oci-db-management
```

```bash
cd scripts
```

```bash
npm install
```

```bash
cd ..
```

```bash
npx zx scripts/tfvars.mjs
```

Answer with the compartment name and type `ENTER`.

```bash
cd terraform
```

```bash
terraform init
```

```bash
terraform apply -auto-approve
```

```bash
cd ..
```

## Clean up


```bash
cd terraform
```

```bash
terraform destroy -auto-approve
```