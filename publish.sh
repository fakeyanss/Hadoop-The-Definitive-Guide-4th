git checkout master &&\
gitbook build &&\
git add . &&\
git commit -m 'update gitbook' &&\
git push origin master &&\
git checkout gh-pages &&\
git rm --cached -r . &&\
git clean -df &&\
git rm --cached -r . &&\
git clean -df &&\
rm -rf *~ &&\
git checkout master -- publish.sh &&\
git checkout master -- _book &&\
mv _book/* ./ &&\
rm -rf _book &&\
git add . &&\
git commit -m 'update gitbook' &&\
git push origin gh-pages &&\
git checkout master