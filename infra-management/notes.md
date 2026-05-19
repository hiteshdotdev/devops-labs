# Why Terraform for Infra Management

suppose a company using a cloud provider for deploying it's application. so for the automation of the infra of that cloud provider will be using their cloud specific automation tools. 
For example - aws uses cft and aws cli, azure used azure resource manager or azure cli and on premise org with openstack installed will be using heat templates for the automation of their infrastructure. 

now the problem is if you're currenly working with a cloud provider and using it's infra automation tools, if you decide to move to another provider, you have to learn other infra automation tool or service specific to the provider and also you have to migrate all your previous automation scripts for the newer providers automation tool. 

the other scenario is if your organization is using hybrid or multi cloud model then you might need to learn multiple infra automation tools to automate the infra on multiple providers. 

and to solve the problems we use terraform because it works with any provider whether it is cloud or on-prem so it's removes the learning curve when working with multiple providers for the infra automation.  Even the migration to other provider will only change the minimal information inside terraform scripts like the provider info and version.
