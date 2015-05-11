script_path=`pwd`

if [ -z "$1" ]; then
  echo 'usage: create_rails_project.sh <path_to_project> [use_react]'
  exit
fi

if [ -e $1 ]; then
  echo "$1 is already exists."
  exit
fi

echo
echo $'\e[32m------------------------------------ \e[m'
echo $'\e[32minstall rails... \e[m'
echo $'\e[32m------------------------------------ \e[m'
echo

mkdir $1

cp Gemfile $1/Gemfile
cp rails_gitignore $1/.gitignore

cd $1

bundle install --path vendor/bundle
bundle exec rails new . -d mysql

cp config/database.yml config/database.yml.example

echo
echo $'\e[32m------------------------------------ \e[m'
echo $'\e[32mPlease edit config/database.yml \e[m'
echo $'\e[32m------------------------------------ \e[m'
echo

if test $2 -eq 1
then
  cp ${script_path}/react_files/package.json package.json
  cp ${script_path}/react_files/app.jsx app/assets/javascripts/app.jsx
  cp ${script_path}/react_files/app-routes.jsx app/assets/javascripts/app-routes.jsx

  sh ${script_path}/install_react.sh
fi
