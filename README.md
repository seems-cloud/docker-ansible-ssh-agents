```bash
ansible -i inventories/inventory.yaml -m ping all
```

```bash
ansible-playbook -i inventories/inventory.yaml roles/common.yml --list-tags
```

```bash
ansible-playbook -i inventories/inventory.yaml roles/common.yml --tags all --limit all
```
