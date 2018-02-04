git checkout master &&\
gitbook build &&\
git add . &&\
git commit -m 'update gitbook' &&\
git push origin master &&\
git checkout gh-pages &&\
git checkout master -- _book &&\
git add _book &&\
mv _book/* ./ &&\
git add . &&\
git commit -m 'update gitbook' &&\
git push origin gh-pages

