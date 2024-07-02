
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
