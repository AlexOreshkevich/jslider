mkdir -p bin

# optimize css
cat css/jslider.css css/jslider.blue.css css/jslider.plastic.css css/jslider.round.css css/jslider.round.plastic.css > bin/jquery.slider.all.css
java -jar tools/yuicompressor-2.4.7.jar --type=css bin/jquery.slider.all.css > bin/jquery.slider.min.css
rm -f bin/jquery.slider.all.css

# optimize js
rm -f bin/jquery.slider.all.js bin/jquery.slider.min.js
cat js/jshashtable-2.1_src.js js/jquery.numberformatter-1.2.3.js js/tmpl.js js/jquery.dependClass-0.1.js js/draggable-0.1.js js/jquery.slider.js > bin/jquery.slider.all.js
uglifyjs bin/jquery.slider.all.js -mc -o bin/jquery.slider.min.js
rm -f bin/jquery.slider.all.js

# deply to the target environment
rm -f ../NomisDemo/client/jquery.slider.min.js
cp bin/jquery.slider.min.js ../NomisDemo/client/jquery.slider.min.js
