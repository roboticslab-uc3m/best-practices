#!/bin/sh

# Thanks: http://stackoverflow.com/questions/14710257/running-a-cron-job-at-230-am-every-day
# On how to automate process at 2:30 every day (type "date" to get your server time)
# crontab -e
# 30 2 * * * /your/command

echo "Update developer-manual..."
cd $HOME/developer-manual
git pull
echo "Gitbook developer-manual..."
rm -r _book/
gitbook build
gitbook pdf . _book/developer-manual.pdf
gitbook mobi . _book/developer-manual.mobi
gitbook epub . _book/developer-manual.epub
cd ..
