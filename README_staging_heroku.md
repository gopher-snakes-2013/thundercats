<!-- # thunder helpers for login
# thunder rack flash
# thunder spechelper, dumps the database every time
# error for user already in the database -->

This is Zee showing us how to create a heroku staging app
  569  ls -alt .git
  570  more .git/config
  571  subl .git/config
  572  git push heroku forum_release2
  573  heroku run rake db:migrate
  574  heroku open
  575  git status
  576  git add discussion_app.rb
  577  git commit -m "moved rescue LoadError"
  578  git push heroku forum_release2
  579  heroku open
  580  heroku run rake db:migrate
  581  heroku run rake db:schema:load
  582  heroku open
  583  heroku logs
  584  git pull origin master
  585  git branch
  586  git checkout master
  587  git push heroku master
  588  git checkout forum_release2
  589  git status
  590  heroku create jokez-staging
  591  git remote
  592  git remote add staging  git@heroku.com:jokez-staging.git
  593  git push staging forum_release2:master
  594  bundle
  595  git status
  596  git add -p
  597  git status
  598  git status
  599  git commit
  600  git push staging forum_release2:master
  601  heroku run rake db:migrate
  602  heroku run rake db:migrate --app jokez-staging
  603  heroku open --app jokez-staging
  604  heroku logs
  605  heroku logs --app jokez-staging
  606  rake
  607  fg
  608  fg
  609  git staus
  610  git status
  611  git push origin
  612  git push origin forum_release2
  613  git checkout master
  614  git log
  615  git pull
  616  git log
  617  git log
  618  git status
  619  git push heroku
  620  git push heroku master
  621  git push heroku master --force
  622  heroku run rake db:migrate --app joke
  623  heroku run rake db:migrate --app jokez
