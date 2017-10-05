FABMGRPATH=/ws/fablab-iciautour/fab-manager
docker run --rm  \
--link=fabmanager-postgres:postgres \
--link=fabmanager-redis:redis \
--link=fabmanager-elastic:elastic \
-e RAILS_ENV=development \
-e RACK_ENV=development \
--env-file=$FABMGRPATH/config/env \
-v $FABMGRPATH/plugins:/usr/src/app/plugins \
-v $FABMGRPATH/public/assets:/usr/src/app/public/assets \
-v $FABMGRPATH/public/uploads:/usr/src/app/public/uploads \
-v $FABMGRPATH/invoices:/usr/src/app/invoices \
-v $FABMGRPATH/exports:/usr/src/app/exports \
-v $FABMGRPATH/supervisor:/usr/src/app/supervisor \
fablab-iciautour/fabmanager:2.5.9 \
bundle exec rake $1
