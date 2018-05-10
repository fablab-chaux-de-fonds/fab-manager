FABMGRPATH=$(abspath ..)
docker run -d --restart unless-stopped -v $FABMGRPATH/postgresql:/var/lib/postgresql/data --name fabmanager-postgres postgres:9.4
docker run -d --restart unless-stopped -v $FABMGRPATH/redis:/data --name fabmanager-redis redis:3.0
docker run -d --restart unless-stopped -v $FABMGRPATH/elasticsearch:/usr/share/elasticsearch/data --name fabmanager-elastic elasticsearch:1.7
