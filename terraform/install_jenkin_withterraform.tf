- hosts: all
  become: yes
  tasks:
    - name: Install Java
      apt:
        name: openjdk-11-jdk
        state: present

    - name: Install Jenkins
      apt:
        name: jenkins
        state: present

    - name: Start Jenkins service
      service:
        name: jenkins
        state: started
        enabled: yes

    - name: Open Jenkins firewall port
      ufw:
        rule: allow
        port: 8080
        proto: tcp

    - name: Wait for Jenkins to start
      uri:
        url: http://localhost:8080/
        status_code: 200
        method: head
        timeout: 60

    - name: Install suggested Jenkins plugins
      uri:
        url: http://localhost:8080/updateCenter/json/updateCenter/current/recommended/api/json
        method: get
        status_code: 200
        register: jenkins_plugins

    - name: Install Jenkins plugins
      jenkins_plugin:
        name: "{{ item }}"
        state: present
      loop: "{{ jenkins_plugins.json.plugins }}"

    - name: Restart Jenkins service
      service:
        name: jenkins
        state: restarted