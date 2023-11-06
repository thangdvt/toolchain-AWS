Role Name
=========

command

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

 gitlab-rails console
 user = User.create(:username=>'root',:password=>'Admin@123',:password_confirmation=>'Admin@123',:email=>'root@example.com',:name=>'root')
 user.save!