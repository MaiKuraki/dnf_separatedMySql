#! /bin/bash

# 定义方法
initMysql(){
  # 清理数据
  rm -rf /var/lib/mysql/*
  # 启动mysql
  mysql_install_db --user=mysql
  service mysql start

  # 导入数据
  mysql -u root <<EOF
CREATE SCHEMA d_channel DEFAULT CHARACTER SET utf8 ;
use d_channel;
source /init/d_channel.sql;
CREATE SCHEMA d_guild DEFAULT CHARACTER SET utf8 ;
use d_guild;
source /init/d_guild.sql;
CREATE SCHEMA d_taiwan_secu DEFAULT CHARACTER SET utf8 ;
use d_taiwan_secu;
source /init/d_taiwan_secu.sql;
CREATE SCHEMA d_taiwan DEFAULT CHARACTER SET utf8 ;
use d_taiwan;
source /init/d_taiwan.sql;
CREATE SCHEMA d_technical_report DEFAULT CHARACTER SET utf8 ;
use d_technical_report;
source /init/d_technical_report.sql;
CREATE SCHEMA taiwan_billing DEFAULT CHARACTER SET utf8 ;
use taiwan_billing;
source /init/taiwan_billing.sql;
CREATE SCHEMA taiwan_cain_2nd DEFAULT CHARACTER SET utf8 ;
use taiwan_cain_2nd;
source /init/taiwan_cain_2nd.sql;
CREATE SCHEMA taiwan_cain_auction_cera DEFAULT CHARACTER SET utf8 ;
use taiwan_cain_auction_cera;
source /init/taiwan_cain_auction_cera.sql;
CREATE SCHEMA taiwan_cain_auction_gold DEFAULT CHARACTER SET utf8 ;
use taiwan_cain_auction_gold;
source /init/taiwan_cain_auction_gold.sql;
CREATE SCHEMA taiwan_cain_log DEFAULT CHARACTER SET utf8 ;
use taiwan_cain_log;
source /init/taiwan_cain_log.sql;
CREATE SCHEMA taiwan_cain_web DEFAULT CHARACTER SET utf8 ;
use taiwan_cain_web;
source /init/taiwan_cain_web.sql;
CREATE SCHEMA taiwan_cain DEFAULT CHARACTER SET utf8 ;
use taiwan_cain;
source /init/taiwan_cain.sql;
CREATE SCHEMA taiwan_game_event DEFAULT CHARACTER SET utf8 ;
use taiwan_game_event;
source /init/taiwan_game_event.sql;
CREATE SCHEMA taiwan_login_play DEFAULT CHARACTER SET utf8 ;
use taiwan_login_play;
source /init/taiwan_login_play.sql;
CREATE SCHEMA taiwan_login DEFAULT CHARACTER SET utf8 ;
use taiwan_login;
source /init/taiwan_login.sql;
CREATE SCHEMA taiwan_main_web DEFAULT CHARACTER SET utf8 ;
use taiwan_main_web;
source /init/taiwan_main_web.sql;
CREATE SCHEMA taiwan_mng_manager DEFAULT CHARACTER SET utf8 ;
use taiwan_mng_manager;
source /init/taiwan_mng_manager.sql;
CREATE SCHEMA taiwan_prod DEFAULT CHARACTER SET utf8 ;
use taiwan_prod;
source /init/taiwan_prod.sql;
CREATE SCHEMA taiwan_pvp DEFAULT CHARACTER SET utf8 ;
use taiwan_pvp;
source /init/taiwan_pvp.sql;
CREATE SCHEMA taiwan_se_event DEFAULT CHARACTER SET utf8 ;
use taiwan_se_event;
source /init/taiwan_se_event.sql;
CREATE SCHEMA taiwan_siroco DEFAULT CHARACTER SET utf8 ;
use taiwan_siroco;
source /init/taiwan_siroco.sql;
CREATE SCHEMA tw DEFAULT CHARACTER SET utf8 ;
use tw;
source /init/tw.sql;
flush PRIVILEGES;
EOF
  service mysql stop
  echo "init mysql success"
}
# 赋予权限
chmod 777 -R /var/lib/mysql

# 判断数据库是否初始化过
if [ ! -d "/var/lib/mysql/d_taiwan" ];then
  tar -zxvf /init/init_sql.tgz
  initMysql
else
  echo "mysql have already inited, do nothing!"
fi