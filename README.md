# README

Steps for uploading to heroku

1. rails test
2. git push
3. git push heroku
4. if any migrations
    1. heroku maintenance:on
    2. heroku db:migrate
    3. heroku maintenance:off

* locally I need to uninstall bcrypt and reinstall with --platform=ruby option

* coffee-script-source needs to be verison 1.8.0 to work on windows

* puma webserver used in production

* sqlite used in all environments

* to make a new branch
  * git checkout -b branch-name
  * to save:
    1. git add -A
    2. git commit -m "comment about work done"
    3. git push
    4. git checkout master
    5. git merge branch-name
    6. git push

* to set up email in production
  1. `heroku addons:create sendgrid:starter` (need to verify account on heroku)
  2. ``` ruby
     Rails.application.configure do
     .
     .
     .
     config.action_mailer.raise_delivery_errors = true
     config.action_mailer.delivery_method = :smtp
     host = '<your heroku app>.herokuapp.com'
     config.action_mailer.default_url_options = { host: host }
     ActionMailer::Base.smtp_settings = {
       :address        => 'smtp.sendgrid.net',
       :port           => '587',
       :authentication => :plain,
       :user_name      => ENV['SENDGRID_USERNAME'],
       :password       => ENV['SENDGRID_PASSWORD'],
       :domain         => 'heroku.com',
       :enable_starttls_auto => true
     }
     .
     .
     .
     end
     ```
