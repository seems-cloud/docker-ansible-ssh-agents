```bash
ansible -i inventories/inventory.yaml -m ping all
```

```bash
ansible-playbook -i inventories/inventory.yaml roles/common.yml --list-tags
```

```bash
ansible-playbook -i inventories/inventory.yaml roles/common.yml --tags all --limit all

ansible-playbook -i inventories/inventory.yaml roles/common.yml --tags prepare-foo --limit app

ansible-playbook -i inventories/inventory.yaml roles/common.yml --tags prepare-foo --limit db
```