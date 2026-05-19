# Configuration Management

## Why it is needed / which problem it solves?

The main use case of config management is to automate workflows on multiple servers.
It involves installing software components, updating systems, making them secure, and many more things.

## Available Tools

Puppet, Ansible, Chef

## Why Ansible?

Since it's the most popular open source tool for config management, which also has wider community support.
Also, the configs are written in simple YAML files so the learning curve is slightly lower.

## Ansible vs Puppet

- Ansible follows the agent-less approach while Puppet follows the agent-based approach where additional
  software needs to be installed on the target servers.
- Ansible uses YAML for config management whereas Puppet uses its own declarative language.
- Ansible mainly uses the push mechanism while Puppet mainly uses the pull mechanism.
  - Push: pushes changes from the control server (e.g. installing a newer software version).
  - Pull: managed servers periodically pull changes from the central server (e.g. running software updates).
- Ansible also supports the pull mechanism using the `ansible-pull` command.

## Supported Cloud Providers

Since Ansible uses the SSH and WinRM protocols for communication with target servers,
it is not bound to any specific cloud provider.

---

## Practical Tasks

- Installing Ansible on control node — done
- Setting up passwordless auth on managed node — should add the pub key in authorized_keys;
  private key should be present on the control node.

## Inventory File

A centralized file used for organizing managed nodes/servers. Can be written in .ini or .yml.
Supports grouping and separation of multiple servers (e.g. webservers, db servers).

## Ansible Ad Hoc Commands

- Checking connectivity with each managed host using ping.
- Installing a package on each host using its package manager.

## Ansible Playbooks

Files that contain a set of Ansible ad hoc commands, written in YAML format.
Running a playbook: `ansible-playbook -i <inventory-file> --key-file <private-key> <playbook>`

## Ansible Modules

Binaries or code which runs on managed nodes for defined tasks.

## Plugins

Code or extra features that expand Ansible's core capabilities.

## Collection

A format in which Ansible content is distributed. Can contain playbooks, roles, modules, plugins.

## Ansible Roles

Limited distribution of Ansible content for use inside plays.

## Ansible Galaxy

A platform used for distributing Ansible collections over the internet.

---

## My Doubts

Q: How does Ansible know which private key to use to connect with managed nodes when there can be multiple
   private keys on the control server?
A: Picks the default id_rsa key from the .ssh directory. The key can be specified by exporting variables
   in the Ansible config or passed as an argument when using the CLI.

Q: When making an SSH connection we need to accept host authenticity — what does Ansible do in this scenario?
A: Will look into this when reading about how SSH communication works.

Q: Can Ansible only be used for non-interactive automation work?
A: Probably yes.

---

Note: Playbooks should be idempotent — meaning they avoid state changes on consecutive runs.
