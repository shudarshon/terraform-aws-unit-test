converge:
	bundle exec kitchen converge

verify:	
	bundle exec kitchen verify

plan:
	`which terraform` plan

apply:
	`which terraform` apply -auto-approve

destroy:
	bundle exec kitchen destroy
	`which terraform` destroy -auto-approve
