FABMGRPATH=..
docker run --restart unless-stopped  \
-d --name fabmanager-dev \
--link=fabmanager-postgres:postgres \
--link=fabmanager-redis:redis \
--link=fabmanager-elastic:elastic \
-p 3001:3000 \
-e RAILS_ENV=development \
-e RACK_ENV=development \
--env-file=$FABMGRPATH/config/env \
-v $FABMGRPATH:/usr/src/app \
fablab-iciautour/fabmanager:2.5.9
#-v $FABMGRPATH/plugins:/usr/src/app/plugins \
#-v $FABMGRPATH/public/assets:/usr/src/app/public/assets \
#-v $FABMGRPATH/public/uploads:/usr/src/app/public/uploads \
#-v $FABMGRPATH/invoices:/usr/src/app/invoices \
#-v $FABMGRPATH/exports:/usr/src/app/exports \
#-v $FABMGRPATH/supervisor:/usr/src/app/supervisor \
