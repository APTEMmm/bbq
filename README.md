# BBQ

Handy app for organizing events with your friends 

## Cloning project
You need `Ruby 2.7.6` and `Rails 6.1.6.1` versions

1) Write the code below into your terminal or console:
    ```sh
    git clone https://github.com/APTEMmm/bbq.git
    ```

2) Run `bundle install`

   If you don't have ruby yet go to [rvm.io](https://rvm.io/) and download it

3) Run migrations
   ```sh
   bundle exec rails db:migrate 
   ```

4) Update credentials

   Open credentials editor through:
   ```shell 
     EDITOR=<your_prefered_editor> rails credentials:edit 
   ```
   and set your credentials according to the pattern
   ```shell
   # yandex cloud tokens
   yc:
     access_key_id: <your_key>
     secret_access_key: <your_key>
     
   # mailjet tokens
   mailjet:
     api_key: <your_key>
     secret_key: <your_key>
     sender: <your_sender_email>
     hostname: <hostname_link>
     
   # vps uses postgres
   vps:
     db:
       username: <db_username>
       password: <db_password>
       database: <db_name>
   yandex_map:
     api_key: <your_key>
     
   # github and google omniauth tokens
   production:
     omniauth_github_id: <your_key>
     omniauth_github_id: <your_key>
     omniauth_google_id: <your_key>
     omniauth_google_secret: <your_key>
   ```
## Editing project
* Create new branch with `git checkout -b new_feature`, edit files and push them into repo
* Editing in master will be removed
