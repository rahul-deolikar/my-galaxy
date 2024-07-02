
# Key Concepts 

**Control Node (Master)**

- A computer with Ansible installed.
- Runs commands and playbooks.
- Needs Python, but can't be a Windows computer.
- Can be a laptop, desktop, or server.
- You can have more than one control node.
  
**Managed Nodes(NNodes)**

- The devices or servers Ansible manages. Also called "hosts".
- Ansible isn't installed on these devices.
  
**Inventory**

- A list of the devices (hosts) Ansible manages.
- Includes details like IP addresses.
- Organizes devices into groups for easy management.
  
**Modules**

- Small pieces of code that do specific tasks.
- Used to perform actions like user management or network setup.
- Can be used alone or combined in playbooks.
  
**Tasks**

- Single actions that Ansible performs.
- Can be run once with a quick command.
  
**Playbooks**

- Lists of tasks saved to run in order.
- Written in an easy-to-read format called YAML.
- Can include variables and multiple tasks.

**What is Ansible**
- It is configuration managment tool, open-source
- use yaml scripting
- works on push managment
- One master can control configuration of manyservers.
- It is agentless and communicate through SSH.
- Script are called playbook.
- light weight.
- automation friendly.

**Important**
1. Ansible-server - the machine where ansible is installed && Playbook can be run here.
2. Module - command or sets of commands to be executed clint side.
3. Inventory - fillcontaing data about client side.
4. Play - execution of playbook.
5. Ad Hoc commands - can be perform a quick function.
6. Inventory file location -> /etc/ansible/hosts.


[On master]
steps: 
``sudo apt update``
``sudo apt install ansible -y``

Open inventory file
``sudo vim /etc/ansible/hosts``

[servers]
server1 ansible_host = ip

[all:vars]
ansible_paython_interpreter = path
--------------------------------------------
 ``ansible-inventery  --list -y``
 test connection
``ansible all -m ping -u root or --private-key = path``
  ``ansible all -a "of -h"``
 `` ansible server -a "uptime"``
