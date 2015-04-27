mkdir $1

cp Gemfile $1/Gemfile
cp rails_gitignore $1/.gitignore

cd $1

bundle install --path vendor/bundle
bundle exec rails new . -d mysql

cp config/database.yml config/database.yml.example
