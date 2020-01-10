amazon-linux-extras install epel -y
yum install ansible -y

cat > /root/ansible.yml << EOF
---
- hosts: 127.0.0.1
  tasks:
    - name: ensure nginx is at the latest version
      package: name=nginx state=present
    - name: start nginx
      service:
          name: nginx
          state: started
EOF

ansible-playbook --connection=local --inventory 127.0.0.1, /root/ansible.yml
