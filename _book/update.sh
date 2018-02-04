cd .. &&\
gitbook build hadoop-the-definitive-guide-4th-edition hadoop-the-definitive-guide-4th-edition/docs &&\
gitbook build hadoop-the-definitive-guide-4th-edition hadoop-the-definitive-guide-4th-edition/_book &&\
cd hadoop-the-definitive-guide-4th-edition &&\
git add . &&\
git commit -m 'update gitbook' &&\
git push gitbook master
