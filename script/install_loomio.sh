#!/usr/bin/env bash

# 일단 최신 상태로
sudo apt-get update && sudo apt-get upgrade -qq -y

# 필수 패키지 설치
sudo apt-get -qq -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# 루비 환경 만들기
cd ~/
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

rbenv install 2.3.0 && rbenv global 2.3.0
echo "gem: --no-document" > ~/.gemrc
gem install bundler

# 노드 환경 만들기
git clone https://github.com/OiNutter/nodenv.git ~/.nodenv
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(nodenv init -)"' >> ~/.bash_profile
git clone https://github.com/OiNutter/node-build.git ~/.nodenv/plugins/node-build
git clone https://github.com/jawshooah/nodenv-npm-rehash.git ~/.nodenv/plugins/nodenv-npm-rehash
source ~/.bash_profile

nodenv install 5.4.0 && nodenv global 5.4.0

# 프로젝트 클론
git clone https://github.com/parti-xyz/loomio.git ~/loomio

# 데이터베이스 준비 postgres 9.4
sudo add-apt-repository "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update && sudo apt-get -qq -y install postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 postgresql-server-dev-9.4
sudo -u postgres createuser -s ubuntu
sudo -u postgres createdb ubuntu

# ruby part, loomio
cd ~/loomio && bundle 
cp ~/loomio/config/database.example.yml ~/loomio/config/database.yml
rake db:setup

# js part, loomio
npm -g i bower
npm -g i lineman
cd ~/loomio/lineman && npm i && bower i
