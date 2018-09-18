rm -rf packages/
mkdir packages/

for N in {1..100}; do
  mkdir "packages/package$N"
  cat shared/package.json | sed "s/replaceMeWithPackageName/package$N/" > "packages/package$N/package.json"
done
