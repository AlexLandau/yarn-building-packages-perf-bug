rm -rf packages/
mkdir packages/

for N in {1..100}; do
  mkdir "packages/package$N"
  INTERNAL_DEPS_STRING=""
  I=1
  while [ $I -lt $N ]; do
    INTERNAL_DEPS_STRING+="    \"package$I\": \"0.0.1\","$'\\\n'
    let I+=1
  done
  cat shared/package.json |
      sed "s/replaceMeWithPackageName/package$N/" |
      sed "s/replaceMeWithInternalDependencies/$INTERNAL_DEPS_STRING/" > "packages/package$N/package.json"
done
