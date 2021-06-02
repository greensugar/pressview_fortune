# pressview_fortune
#First at all : I'm so sorry to say that, I can't push my code to git,bcz my  current job  dont allow to use this 
# But I can list all command and steps
# Here's my instructions:


# install hugo  (only fit centos)
chmod 755 install_huog.sh && bash install_create_hugo.sh

# install fortune (plz install lack of  deps)
wget https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/f/fortune-mod-1.99.1-17.el7.x86_64.rpm
rpm  -ivh   fortune-mod-1.99.1-17.el7.x86_64.rpm           
 
 #copy  fortune_file to hugo
cp -a /usr/share/games/fortune  /data/fortune/themes/
# alter config.toml  
#echo 'theme = "fortune"' >>/data/fortune/config.toml

# remanage by github  (currently  ,I can't do these)
cd /data/fortune
git init
git remote add origin https://github.com/your_project_git_url
git add -A
git commit -m "first commit"
git push -u origin master  #input your sign username and password

#if you local not sign git_user plz oprate:
git config --global user.email "your_email_name"
git config --global user.name "your_username_ongithub"


# edit own wordpress
hugo new fortune/first.md
gedit  content/fortune/first.md

cat archetypes/first.md
+++
title = "{{ replace .Name "-" " " | title }}"
author = "name"
comments = true # set false to hide Disqus
date = "{{ .Date }}"
draft = true
image = ""
menu = ""               # set "main" to add this content to the main menu
share = true    # set false to hide share buttons
slug = "post-title"
+++

# copy first.md by archetypes/first.md  (template ,can edit)
hugo new blog/second.md

cat /usr/share/games/fortune/work >> /data/fortune/content/blog/second.md

# Finally , browser the website_url  ip:2134

