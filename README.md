# ansible-vagrant-demo
## Instalation
1. [Vagrant 2.4.1](https://developer.hashicorp.com/vagrant/install)
1. [VirtualBox 7.0.20](https://www.virtualbox.org/wiki/Download_Old_Builds_7_0)
1. [Ansible 2.17.4](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu)

## Commands
### Vagrant Commands
1. Initalize the `Vagrantfile`. This will generate a file called `Vagrantfile`.
    ```Bash
    vagrant init --minimal
    ```

1. Copy the prepared `Vargantfile_Prepared` into the generated `Vagrantfile`:
    ```Bash
    cp Vargantfile_Prepared Vagrantfile
    ```

1. Spin up the VMs defined in the `Vagrantfile`:
    ```Bash
    vagrant up
    ```

1. Destroy VMs:
    ```Bash
    vagrant destroy -f
    ```

### Ansible Commands
1. Run the Ansible playbook command using the specified configuration.
    ```Bash
    ANSIBLE_CONFIG=./ansible/ansible.cfg ansible-playbook ./ansible/main.yml
    ```

## Demo
This demo shows multiple Ansible features:
- Playbooks
- Roles
- Profiling
- Conditionals

## Script
1. Spin up VMs
    ```Bash
    vagrant up
    ```

1. Configure VMs using Ansible
    ```Bash
    ANSIBLE_CONFIG=./ansible/ansible.cfg ansible-playbook ansible/main.yml
    ```

1. Check out web servers using a script:
    ```
    ./scripts/open_ips_in_chrome.sh
    ```

1. Change `./ansible/main.yml` to use the `Nginx` role.
    ```
    - name: Nginx Role for Dev and Prod
      include_role:
        name: nginx
    ```

1. Rerun Ansible playbook
    ```Bash
    ANSIBLE_CONFIG=./ansible/ansible.cfg ansible-playbook ansible/main.yml
    ```

1. While playbook is running add profiling to `ansible.cfg`:
    ```
    callbacks_enabled = timer, profile_tasks, profile_roles
    ```

1. Show that web servers are still configured the same.

1. Add conditionals in `./ansible/main.yml`:
    ```
    - name: Nginx Role for Dev and Prod
      include_role:
        name: nginx
      when: inventory_hostname != "infra"

    - name: Apache Role for Infra
      include_role:
        name: apache
      when: inventory_hostname == "infra"
    ```

1. Show that only infra is now using Apache as web server.
