# terraform-aws-unit-test

this repository will contain infrastructure as code and rspec test cases for unit testing aws infrastructure against terraform configuration

# required tools
 
 * terraform
 * kitchen-terraform
 * rspec
 * awsspec
 * ruby
 * bundler

 # how to run

 at first, copy main.tf.env to main.tf file. then use terraform variable values according to module configuration,

 `cp main.tf.env main.tf`

 install testing dependencies gems by running,

 `bundle install --path vendor/bundle`

next, kitchen converge the test scenario which spins up the resources in aws,

 `bundle exec kitchen converge`

then verify infrastructure components by running,

 `bundle exec kitchen verify`

 once testing is done destroy the resources,

 `bundle exec kitchen destroy`