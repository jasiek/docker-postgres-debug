VERSIONS=`ls -d -- */ | sed "s/\///g"`
set -eox
for version in $VERSIONS; do
    CID=`docker run -ePOSTGRES_HOST_AUTH_METHOD=trust -d postgres-debug:$version`
    sleep 5
    echo "CREATE EXTENSION pldbgapi;" | docker exec -i $CID psql -U postgres
    docker kill $CID
done
