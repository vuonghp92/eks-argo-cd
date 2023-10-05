default:
	@echo "The following commands are available:"
	@echo " - plan               : runs terraform plan for an environment"
	@echo " - apply              : runs terraform apply for an environment"
	@echo " - destroy            : will delete the entire project's infrastructure"

plan:
	./terraform init -backend-config=$(value ENV)/backend.tfbackend

	echo "Pulling the required modules..."
	./terraform get

	./terraform plan -var-file="$(value ENV)/terraform.tfvars" -out $(value ENV).plan

targetplan:
	@terraform init -backend-config=$(value ENV)/backend.tfbackend

	@echo "Pulling the required modules..."
	@terraform get

	@terraform plan  \
  	  -var-file="$(value ENV)/terraform.tfvars" \
		-target "$(value restype).$(value resname)" \
		-out $(value ENV).plan


apply:
	@echo "Will be applying the following to [$(value ENV)]environment:"
	./terraform show -no-color $(value ENV).plan

	./terraform apply $(value ENV).plan
	@rm $(value ENV).plan



taint:
	@terraform init -backend-config=$(value ENV)/backend.tfbackend

	@echo "Pulling the required modules..."
	@terraform get

	@terraform taint  \
		 "$(value restype).$(value resname)"

	@ENV=$(value ENV) restype=$(value restype) resname=$(value resname) make targetplan

	@ENV=$(value ENV) make apply


destroy:
	@echo "Are you really sure you want to completely destroy [$(value ENV)]  environment ?"
	@read -p "Press enter to continue"
	./terraform destroy \
		-var-file="$(value ENV)/terraform.tfvars"

destroytarget:
	@echo "Are you really sure you want to completely destroy [$(value ENV)]  Resource:  [$(value restype).$(value resname)]  ?"
	@read -p "Press enter to continue"
	@terraform destroy \
  	  -var-file="$(value ENV)/terraform.tfvars" \
		-target "$(value restype).$(value resname)" \
