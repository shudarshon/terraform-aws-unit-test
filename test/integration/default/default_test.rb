# frozen_string_literal: true

require 'awspec'
require 'aws-sdk'
require 'rhcl'

# Load the terraform state file and convert it into a Ruby hash
state_file = 'terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)
ec2_name = tf_state['modules'][0]['resources']['aws_instance.DevInstanceAWS']['primary']['attributes']['tags.Name']
subnet_id = tf_state['modules'][0]['resources']['aws_instance.DevInstanceAWS']['primary']['attributes']['subnet_id']

# Test the EC2 resource
describe ec2(ec2_name.to_s) do
  it { should exist }
end

describe ec2(ec2_name.to_s) do
  it { should belong_to_subnet(subnet_id.to_s) }
end
