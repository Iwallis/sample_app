# README

Steps for uploading to heroku

1. rails test
2. git push
3. git push heroku
4. if any migrations
    * heroku db:migrate

* locally I need to uninstall bcrypt and reinstall with --platform=ruby option

* coffee-script-source needs to be verison 1.8.0 to work on windows

* puma webserver used in production

* sqlite used in all environments
