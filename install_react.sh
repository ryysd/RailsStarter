echo
echo $'\e[32m------------------------------------ \e[m'
echo $'\e[32minstall react.js... \e[m'
echo $'\e[32m------------------------------------ \e[m'
echo

echo $'\e[32mnpm install \e[m'
npm install --save-dev browserify reactify watchify
npm install --save react react-router react-tap-event-plugin

echo $'\e[32mmodify application.js \e[m'
sed -i -e "s/\/\/= require_tree ./\/\/= require bundle.js/" app/assets/javascripts/application.js

echo $'\e[32mgenerate controller \e[m'
bundle exec rails g controller react index

echo
echo $'\e[32m--------------------------------------------------- \e[m'
echo $'\e[32mPlease type "npm start" to start rails server. \e[m'
echo $'\e[32m--------------------------------------------------- \e[m'
echo
