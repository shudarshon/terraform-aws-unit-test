# frozen_string_literal: true

require 'awspec'
require 'aws-sdk'
require 'rhcl'

# Parse and load our terraform manifest into config_main
config_main = Rhcl.parse(File.open('main.tf'))
ec2_name = config_main['module']['ec2']['instance_name']
sg_id = config_main['module']['ec2']['security_group']

# Load the terraform state file and convert it into a Ruby hash
state_file = './terraform.tfstate.d/kitchen-terraform-default-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)
subnet_id = tf_state['modules'][1]['resources']['aws_instance.DevInstanceAWS']['primary']['attributes']['subnet_id']
root_volume_id = tf_state['modules'][1]['resources']['aws_instance.DevInstanceAWS']['primary']['attributes']['root_block_device.0.volume_id']

# Test the EC2 resource
describe ec2(ec2_name.to_s) do
  it { should exist }
end

describe ec2(ec2_name.to_s) do
  it { should be_running }
end

describe ec2(ec2_name.to_s) do
  it { should belong_to_subnet(subnet_id.to_s) }
end

describe ec2(ec2_name.to_s) do
  it { should have_ebs(root_volume_id.to_s) }
end

describe ec2(ec2_name.to_s) do
  it { should have_security_group(sg_id.to_s) }
end