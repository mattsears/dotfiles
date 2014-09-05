#rbenv versions --bare
RBENVPATH=`rbenv root`
echo $RBENVPATH
RUBIES=`ls $RBENVPATH/versions`
for ruby in $RUBIES; do
  echo '---------------------------------------'
  echo $ruby
  rbenv local $ruby
  gem uninstall vagrant -aIx
done
