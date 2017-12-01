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
