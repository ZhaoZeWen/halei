SET NAMES UTF8;
DROP DATABASE IF EXISTS halei;
CREATE DATABASE halei CHARSET=UTF8;
USE halei;

/*哈雷摩托车型号家族*/
CREATE TABLE hl_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);
/**哈雷摩托车**/
CREATE TABLE hl_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,			#所属型号家族编号
  title VARCHAR(128),			#主标题
  price DECIMAL(10,2),			#价格
  type VARCHAR(64),			#类型

  lname	VARCHAR(32),			#商品名称
  displacement  VARCHAR(32),		#排量
  tank_capacity VARCHAR(32),		#油箱容量
  details VARCHAR(1024),		#产品详细说明

  shelf_time BIGINT,			#上架时间
  sold_count INT,			#已售出的数量
  is_onsale BOOLEAN			#是否促销中
);

/*哈雷摩托车图片*/
CREATE TABLE hl_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,				#摩托车编号
  sm VARCHAR(128),			#小图片路径
  md VARCHAR(128),			#中图片路径
  lg VARCHAR(128)			#大图片路径 
);

/**用户信息**/
CREATE TABLE hl_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),			 #头像图片路径
  user_name VARCHAR(32),		 #用户名，如王小明
  gender INT				 #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE hl_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,				 #用户编号
  receiver VARCHAR(16),			    #接收人姓名
  province VARCHAR(16),			    #省
  city VARCHAR(16),		            #市
  county VARCHAR(16),			    #县
  address VARCHAR(128),			    #详细地址
  cellphone VARCHAR(16),		    #手机
  fixedphone VARCHAR(16),		    #固定电话
  postcode CHAR(6),			    #邮编
  tag VARCHAR(16),		            #标签名
	
  is_default BOOLEAN			    #是否为当前用户的默认收货地址
);


/**购物车条目**/
CREATE TABLE hl_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,				#用户编号
  lid INT,				#商品编号
  count INT,				#购买数量
  is_checked BOOLEAN			#是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE hl_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  aid INT,
  status INT,				 #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,			 #下单时间
  pay_time BIGINT,			 #付款时间
  deliver_time BIGINT,			 #发货时间
  received_time BIGINT			 #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE hl_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  oid INT,				#订单编号
  lid INT,				#产品编号
  count INT				#购买数量
);


/****首页轮播广告商品****/
CREATE TABLE hl_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE hl_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**摩托车型号家族**/
INSERT INTO hl_laptop_family VALUES
(NULL,'哈雷Softail® Slim'),								#哈雷软尾司令系列
(NULL,'哈雷Electra Glide® Ultra Limited'),				#哈雷旗舰滑翔系列
(NULL,'哈雷Ultra Classic® Electra Glide®'),				#哈雷至尊滑翔底座版系列
(NULL,'哈雷Road Glide® Custom'),						#哈雷公路滑翔系列
(NULL,'哈雷Blackline®'),								#哈雷夜行者系列
(NULL,'哈雷Road King®'),								#哈雷路王系列
(NULL,'哈雷BREAKOUT®'),								#哈雷突破者系列
(NULL,'哈雷Fat Boy® Special'),							#哈雷肥仔定制系列
(NULL,'哈雷SWITCHBACK™');								#哈雷戴纳征途系列

/*哈雷摩托车*/
INSERT INTO hl_laptop VALUES
(1,1,'哈雷软尾司令Softail® Slim',134999,'太子车','哈雷Softail® Slim','1585ml','19.7L','骑最帅的车.日最爱的妞',150123456789,2968,true),
(2,1,'哈雷软尾司令Softail® Slim',137999,'太子车','哈雷Softail® Slim','1685ml','19.7L','骑最帅的车.日最爱的妞',151123456789,1968,false),
(3,1,'哈雷软尾司令Softail® Slim',139999,'太子车','哈雷Softail® Slim','1785ml','19.7L','骑最帅的车.日最爱的妞',151123456789,2068,false),
(4,1,'哈雷软尾司令Softail® Slim',141999,'太子车','哈雷Softail® Slim','1655ml','19.7L','骑最帅的车.日最爱的妞',151123456789,3168,false),
(5,1,'哈雷软尾司令Softail® Slim',142999,'太子车','哈雷Softail® Slim','1765ml','19.7L','骑最帅的车.日最爱的妞',150123456789,2868,false),
(6,2,'哈雷旗舰滑翔Electra Glide® Ultra Limited',234999,'太子车','哈雷Electra Glide® Ultra Limited','1690ml','22.7L','骑最帅的车.日最爱的妞',150123456789,968,true),
(7,2,'哈雷旗舰滑翔Electra Glide® Ultra Limited',244999,'太子车','哈雷Electra Glide® Ultra Limited','1790ml','22.7L','骑最帅的车.日最爱的妞',153123456789,468,true),
(8,2,'哈雷旗舰滑翔Electra Glide® Ultra Limited',254999,'太子车','哈雷Electra Glide® Ultra Limited','1890ml','22.7L','骑最帅的车.日最爱的妞',150123456789,868,false),
(9,2,'哈雷旗舰滑翔Electra Glide® Ultra Limited',254999,'太子车','哈雷Electra Glide® Ultra Limited','1890ml','22.7L','骑最帅的车.日最爱的妞',151123456789,988,false),
(10,2,'哈雷旗舰滑翔Electra Glide® Ultra Limited',253999,'太子车','哈雷Electra Glide® Ultra Limited','1590ml','22.7L','骑最帅的车.日最爱的妞',152123456789,1968,true),
(11,3,'哈雷至尊滑翔底座版Ultra Classic® Electra Glide®',334999,'太子车','哈雷Ultra Classic® Electra Glide®','1690ml','22.7L','骑最帅的车.日最爱的妞',153123456789,1768,false),
(12,3,'哈雷至尊滑翔底座版Ultra Classic® Electra Glide®',344999,'太子车','哈雷Ultra Classic® Electra Glide®','1690ml','22.7L','骑最帅的车.日最爱的妞',150123456789,1468,false),
(13,3,'哈雷至尊滑翔底座版Ultra Classic® Electra Glide®',354999,'太子车','哈雷Ultra Classic® Electra Glide®','1690ml','22.7L','骑最帅的车.日最爱的妞',154123456789,3768,false),
(14,3,'哈雷至尊滑翔底座版Ultra Classic® Electra Glide®',364999,'太子车','哈雷Ultra Classic® Electra Glide®','1690ml','22.7L','骑最帅的车.日最爱的妞',150123456789,1568,false),
(15,3,'哈雷至尊滑翔底座版Ultra Classic® Electra Glide®',374999,'太子车','哈雷Ultra Classic® Electra Glide®','1690ml','22.7L','骑最帅的车.日最爱的妞',153123456789,1668,false),
(16,4,'哈雷公路滑翔Road Glide® Custom',354999,'太子车','哈雷Road Glide® Custom','1690ml','22.7L','骑最帅的车.日最爱的妞',150123456789,2968,false),
(17,4,'哈雷公路滑翔Road Glide® Custom',344999,'太子车','哈雷Road Glide® Custom','1690ml','22.7L','骑最帅的车.日最爱的妞',154123456789,968,false),
(18,4,'哈雷公路滑翔Road Glide® Custom',364999,'太子车','哈雷Road Glide® Custom','1690ml','22.7L','骑最帅的车.日最爱的妞',152123456789,768,false),
(19,4,'哈雷公路滑翔Road Glide® Custom',374999,'太子车','哈雷Road Glide® Custom','1690ml','22.7L','骑最帅的车.日最爱的妞',152123456789,868,false),
(20,4,'哈雷公路滑翔Road Glide® Custom',384999,'太子车','哈雷Road Glide® Custom','1690ml','22.7L','骑最帅的车.日最爱的妞',152123456789,998,false),
(21,5,'哈雷夜行者Blackline®',174999,'太子车','哈雷Blackline®','1585ml','19.7L','骑最帅的车.日最爱的妞',150123456789,1268,false),
(22,5,'哈雷夜行者Blackline®',164999,'太子车','哈雷Blackline®','1585ml','19.7L','骑最帅的车.日最爱的妞',155123456789,2456,false),
(23,5,'哈雷夜行者Blackline®',154999,'太子车','哈雷Blackline®','1585ml','19.7L','骑最帅的车.日最爱的妞',152123456789,2368,false),
(24,5,'哈雷夜行者Blackline®',144999,'太子车','哈雷Blackline®','1585ml','19.7L','骑最帅的车.日最爱的妞',151123456789,2368,false),
(25,5,'哈雷夜行者Blackline®',134999,'太子车','哈雷Blackline®','1585ml','19.7L','骑最帅的车.日最爱的妞',152123456789,2768,false),
(26,6,'哈雷路王Road King®',114499,'太子车','哈雷Road King®','1690ml','22.7L','骑最帅的车.日最爱的妞',150123456789,2468,true),
(27,6,'哈雷路王Road King®',124499,'太子车','哈雷Road King®','1690ml','22.7L','骑最帅的车.日最爱的妞',150123456789,2468,true),
(28,6,'哈雷路王Road King®',134499,'太子车','哈雷Road King®','1690ml','22.7L','骑最帅的车.日最爱的妞',151123456789,2468,true),
(29,6,'哈雷路王Road King®',123499,'太子车','哈雷Road King®','1690ml','22.7L','骑最帅的车.日最爱的妞',151123456789,2468,true),
(30,6,'哈雷路王Road King®',145499,'太子车','哈雷Road King®','1690ml','22.7L','骑最帅的车.日最爱的妞',152323456789,2468,true),
(31,7,'哈雷突破者BREAKOUT®',239499,'太子车','哈雷BREAKOUT®','1585ml','19.7L','骑最帅的车.日最爱的妞',152723456789,2568,false),
(32,7,'哈雷突破者BREAKOUT®',249499,'太子车','哈雷BREAKOUT®','1585ml','19.7L','骑最帅的车.日最爱的妞',152323456789,1668,false),
(33,7,'哈雷突破者BREAKOUT®',234499,'太子车','哈雷BREAKOUT®','1585ml','19.7L','骑最帅的车.日最爱的妞',151623456789,1968,false),
(34,7,'哈雷突破者BREAKOUT®',278499,'太子车','哈雷BREAKOUT®','1585ml','19.7L','骑最帅的车.日最爱的妞',151923456789,1768,false),
(35,8,'哈雷肥仔定制Fat Boy® Special',275499,'太子车','哈雷Fat Boy® Special','1801ml','22.7L','骑最帅的车.日最爱的妞',153623456789,2868,false),
(36,8,'哈雷肥仔定制Fat Boy® Special',269499,'太子车','哈雷Fat Boy® Special','1801ml','22.7L','骑最帅的车.日最爱的妞',150923456789,2968,false),
(37,8,'哈雷肥仔定制Fat Boy® Special',258499,'太子车','哈雷Fat Boy® Special','1801ml','22.7L','骑最帅的车.日最爱的妞',153923456789,2368,false),
(38,8,'哈雷肥仔定制Fat Boy® Special',267499,'太子车','哈雷Fat Boy® Special','1801ml','22.7L','骑最帅的车.日最爱的妞',153823456789,2668,false),
(39,9,'哈雷戴纳征途SWITCHBACK™',185499,'太子车','哈雷SWITCHBACK™','1690ml','17.8L','骑最帅的车.日最爱的妞',150723456789,2768,true),
(40,9,'哈雷戴纳征途SWITCHBACK™',195499,'太子车','哈雷SWITCHBACK™','1690ml','17.8L','骑最帅的车.日最爱的妞',153723456789,1768,true),
(41,9,'哈雷戴纳征途SWITCHBACK™',195499,'太子车','哈雷SWITCHBACK™','1690ml','17.8L','骑最帅的车.日最爱的妞',152723456789,2768,true),
(42,9,'哈雷戴纳征途SWITCHBACK™',196499,'太子车','哈雷SWITCHBACK™','1690ml','17.8L','骑最帅的车.日最爱的妞',151723456789,3768,true);

/**哈雷摩托车图片**/
INSERT INTO hl_laptop_pic VALUES
(NULL,1,'imgs/product/sm/20160308152235972_S.jpg','imgs/product/md/20160308152235972_S.jpg','imgs/product/lg/20160308152235972_S.jpg'),
(NULL,1,'imgs/product/sm/201305151249469333_S.jpg','imgs/product/md/201305151249469333_S.jpg','imgs/product/lg/201305151249469333_S.jpg'),
(NULL,1,'imgs/product/sm/201502041602447672_S.jpg','imgs/product/md/201502041602447672_S.jpg','imgs/product/lg/201502041602447672_S.jpg'),
(NULL,1,'imgs/product/sm/201502041602281422_S.jpg','imgs/product/md/201502041602281422_S.jpg','imgs/product/lg/201502041602281422_S.jpg'),
(NULL,1,'imgs/product/sm/201305151340595915_S.jpg','imgs/product/md/201305151340595915_S.jpg','imgs/product/lg/201305151340595915_S.jpg'),
(NULL,1,'imgs/product/sm/201305151405165350_S.jpg','imgs/product/md/201305151405165350_S.jpg','imgs/product/lg/201305151405165350_S.jpg'),
(NULL,2,'imgs/product/sm/2015020416461592843_S.jpg','imgs/product/md/2015020416461592843_S.jpg','imgs/product/lg/2015020416461592843_S.jpg'),
(NULL,2,'imgs/product/sm/2015020416461990587_S.jpg','imgs/product/md/2015020416461990587_S.jpg','imgs/product/lg/2015020416461990587_S.jpg'),
(NULL,2,'imgs/product/sm/2015020416461124840_S.jpg','imgs/product/md/2015020416461124840_S.jpg','imgs/product/lg/2015020416461124840_S.jpg'),
(NULL,2,'imgs/product/sm/2015020416460616192_S.jpg','imgs/product/md/2015020416460616192_S.jpg','imgs/product/lg/2015020416460616192_S.jpg'),
(NULL,2,'imgs/product/sm/2015020416460176567_S.jpg','imgs/product/md/2015020416460176567_S.jpg','imgs/product/lg/2015020416460176567_S.jpg'),
(NULL,3,'imgs/product/sm/2015020416285425505_S.jpg','imgs/product/md/2015020416285425505_S.jpg','imgs/product/lg/2015020416285425505_S.jpg'),
(NULL,3,'imgs/product/sm/2015020416285021947_S.jpg','imgs/product/md/2015020416285021947_S.jpg','imgs/product/lg/2015020416285021947_S.jpg'),
(NULL,3,'imgs/product/sm/2015020416284743222_S.jpg','imgs/product/md/2015020416284743222_S.jpg','imgs/product/lg/2015020416284743222_S.jpg'),
(NULL,3,'imgs/product/sm/2015020416284341533_S.jpg','imgs/product/md/2015020416284341533_S.jpg','imgs/product/lg/2015020416284341533_S.jpg'),
(NULL,3,'imgs/product/sm/2015020416283635326_S.jpg','imgs/product/md/2015020416283635326_S.jpg','imgs/product/lg/2015020416283635326_S.jpg'),
(NULL,4,'imgs/product/sm/2015020416283267739_S.jpg','imgs/product/md/2015020416283267739_S.jpg','imgs/product/lg/2015020416283267739_S.jpg'),
(NULL,4,'imgs/product/sm/2015020416282041606_S.jpg','imgs/product/md/2015020416282041606_S.jpg','imgs/product/lg/2015020416282041606_S.jpg'),
(NULL,4,'imgs/product/sm/2015020416115622140_S.jpg','imgs/product/md/2015020416115622140_S.jpg','imgs/product/lg/2015020416115622140_S.jpg'),
(NULL,4,'imgs/product/sm/2015020416115467245_S.jpg','imgs/product/md/2015020416115467245_S.jpg','imgs/product/lg/2015020416115467245_S.jpg'),
(NULL,4,'imgs/product/sm/2015020416115228887_S.jpg','imgs/product/md/2015020416115228887_S.jpg','imgs/product/lg/2015020416115228887_S.jpg'),
(NULL,5,'imgs/product/sm/2015020416115037609_S.jpg','imgs/product/md/2015020416115037609_S.jpg','imgs/product/lg/2015020416115037609_S.jpg'),
(NULL,5,'imgs/product/sm/2015020416114355172_S.jpg','imgs/product/md/2015020416114355172_S.jpg','imgs/product/lg/2015020416114355172_S.jpg'),
(NULL,5,'imgs/product/sm/2015020416114150707_S.jpg','imgs/product/md/2015020416114150707_S.jpg','imgs/product/lg/2015020416114150707_S.jpg'),
(NULL,5,'imgs/product/sm/2015020416113881016_S.jpg','imgs/product/md/2015020416113881016_S.jpg','imgs/product/lg/2015020416113881016_S.jpg'),
(NULL,5,'imgs/product/sm/2015020416113634280_S.jpg','imgs/product/md/2015020416113634280_S.jpg','imgs/product/lg/2015020416113634280_S.jpg'),
(NULL,6,'imgs/product/sm/2015020416113235326_S.jpg','imgs/product/md/2015020416113235326_S.jpg','imgs/product/lg/2015020416113235326_S.jpg'),
(NULL,6,'imgs/product/sm/2015020416025043105_S.jpg','imgs/product/md/2015020416025043105_S.jpg','imgs/product/lg/2015020416025043105_S.jpg'),
(NULL,6,'imgs/product/sm/2015020416024787932_S.jpg','imgs/product/md/2015020416024787932_S.jpg','imgs/product/lg/2015020416024787932_S.jpg'),
(NULL,6,'imgs/product/sm/2015020416024168505_S.jpg','imgs/product/md/2015020416024168505_S.jpg','imgs/product/lg/2015020416024168505_S.jpg'),
(NULL,6,'imgs/product/sm/2015020416023844677_S.jpg','imgs/product/md/2015020416023844677_S.jpg','imgs/product/lg/2015020416023844677_S.jpg'),
(NULL,7,'imgs/product/sm/2015020416023535817_S.jpg','imgs/product/md/2015020416023535817_S.jpg','imgs/product/lg/2015020416023535817_S.jpg'),
(NULL,7,'imgs/product/sm/2015020416023199299_S.jpg','imgs/product/md/2015020416023199299_S.jpg','imgs/product/lg/2015020416023199299_S.jpg'),
(NULL,7,'imgs/product/sm/2015020416022535958_S.jpg','imgs/product/md/2015020416022535958_S.jpg','imgs/product/lg/2015020416022535958_S.jpg'),
(NULL,7,'imgs/product/sm/2015020416021880848_S.jpg','imgs/product/md/2015020416021880848_S.jpg','imgs/product/lg/2015020416021880848_S.jpg'),
(NULL,7,'imgs/product/sm/2015020416020962713_S.jpg','imgs/product/md/2015020416020962713_S.jpg','imgs/product/lg/2015020416020962713_S.jpg'),
(NULL,7,'imgs/product/sm/2013051514053076571_S.jpg','imgs/product/md/2013051514053076571_S.jpg','imgs/product/lg/2013051514053076571_S.jpg'),
(NULL,8,'imgs/product/sm/2013051514052865192_S.jpg','imgs/product/md/2013051514052865192_S.jpg','imgs/product/lg/2013051514052865192_S.jpg'),
(NULL,8,'imgs/product/sm/2013051514052727707_S.jpg','imgs/product/md/2013051514052727707_S.jpg','imgs/product/lg/2013051514052727707_S.jpg'),
(NULL,9,'imgs/product/sm/2013051514052498188_S.jpg','imgs/product/md/2013051514052498188_S.jpg','imgs/product/lg/2013051514052498188_S.jpg'),
(NULL,9,'imgs/product/sm/2013051514052365498_S.jpg','imgs/product/md/2013051514052365498_S.jpg','imgs/product/lg/2013051514052365498_S.jpg'),
(NULL,9,'imgs/product/sm/2013051514052160487_S.jpg','imgs/product/md/2013051514052160487_S.jpg','imgs/product/lg/2013051514052160487_S.jpg'),
(NULL,9,'imgs/product/sm/2013051514052076215_S.jpg','imgs/product/md/2013051514052076215_S.jpg','imgs/product/lg/2013051514052076215_S.jpg'),
(NULL,9,'imgs/product/sm/2013051513590917967_S.jpg','imgs/product/md/2013051513590917967_S.jpg','imgs/product/lg/2013051513590917967_S.jpg'),
(NULL,10,'imgs/product/sm/2013051513590769543_S.jpg','imgs/product/md/2013051513590769543_S.jpg','imgs/product/lg/2013051513590769543_S.jpg'),
(NULL,10,'imgs/product/sm/2013051513590345862_S.jpg','imgs/product/md/2013051513590345862_S.jpg','imgs/product/lg/2013051513590345862_S.jpg'),
(NULL,10,'imgs/product/sm/2013051513590076176_S.jpg','imgs/product/md/2013051513590076176_S.jpg','imgs/product/lg/2013051513590076176_S.jpg'),
(NULL,10,'imgs/product/sm/2013051513585928247_S.jpg','imgs/product/md/2013051513585928247_S.jpg','imgs/product/lg/2013051513585928247_S.jpg'),
(NULL,10,'imgs/product/sm/2013051513585721281_S.jpg','imgs/product/md/2013051513585721281_S.jpg','imgs/product/lg/2013051513585721281_S.jpg'),
(NULL,10,'imgs/product/sm/2013051513585683740_S.jpg','imgs/product/md/2013051513585683740_S.jpg','imgs/product/lg/2013051513585683740_S.jpg'),
(NULL,11,'imgs/product/sm/2013051513410639732_S.jpg','imgs/product/md/2013051513410639732_S.jpg','imgs/product/lg/2013051513410639732_S.jpg'),
(NULL,11,'imgs/product/sm/2013051513410588403_S.jpg','imgs/product/md/2013051513410588403_S.jpg','imgs/product/lg/2013051513410588403_S.jpg'),
(NULL,11,'imgs/product/sm/2013051513410349933_S.jpg','imgs/product/md/2013051513410349933_S.jpg','imgs/product/lg/2013051513410349933_S.jpg'),
(NULL,11,'imgs/product/sm/2013051513410178290_S.jpg','imgs/product/md/2013051513410178290_S.jpg','imgs/product/lg/2013051513410178290_S.jpg'),
(NULL,11,'imgs/product/sm/2013051513405895764_S.jpg','imgs/product/md/2013051513405895764_S.jpg','imgs/product/lg/2013051513405895764_S.jpg'),
(NULL,12,'imgs/product/sm/2013051513405652451_S.jpg','imgs/product/md/2013051513405652451_S.jpg','imgs/product/lg/2013051513405652451_S.jpg'),
(NULL,12,'imgs/product/sm/2013051513405423181_S.jpg','imgs/product/md/2013051513405423181_S.jpg','imgs/product/lg/2013051513405423181_S.jpg'),
(NULL,12,'imgs/product/sm/2013051513405356303_S.jpg','imgs/product/md/2013051513405356303_S.jpg','imgs/product/lg/2013051513405356303_S.jpg'),
(NULL,12,'imgs/product/sm/2013051513290568505_S.jpg','imgs/product/md/2013051513290568505_S.jpg','imgs/product/lg/2013051513290568505_S.jpg'),
(NULL,12,'imgs/product/sm/2013051513290456813_S.jpg','imgs/product/md/2013051513290456813_S.jpg','imgs/product/lg/2013051513290456813_S.jpg'),
(NULL,13,'imgs/product/sm/2013051513290390783_S.jpg','imgs/product/md/2013051513290390783_S.jpg','imgs/product/lg/2013051513290390783_S.jpg'),
(NULL,13,'imgs/product/sm/2013051513290054546_S.jpg','imgs/product/md/2013051513290054546_S.jpg','imgs/product/lg/2013051513290054546_S.jpg'),
(NULL,13,'imgs/product/sm/2013051513285934352_S.jpg','imgs/product/md/2013051513285934352_S.jpg','imgs/product/lg/2013051513285934352_S.jpg'),
(NULL,13,'imgs/product/sm/2013051513285735504_S.jpg','imgs/product/md/2013051513285735504_S.jpg','imgs/product/lg/2013051513285735504_S.jpg'),
(NULL,13,'imgs/product/sm/2013051513285541436_S.jpg','imgs/product/md/2013051513285541436_S.jpg','imgs/product/lg/2013051513285541436_S.jpg'),
(NULL,14,'imgs/product/sm/2013051513285270812_S.jpg','imgs/product/md/2013051513285270812_S.jpg','imgs/product/lg/2013051513285270812_S.jpg'),
(NULL,14,'imgs/product/sm/2013051513205286912_S.jpg','imgs/product/md/2013051513205286912_S.jpg','imgs/product/lg/2013051513205286912_S.jpg'),
(NULL,14,'imgs/product/sm/2013051513205149870_S.jpg','imgs/product/md/2013051513205149870_S.jpg','imgs/product/lg/2013051513205149870_S.jpg'),
(NULL,14,'imgs/product/sm/2013051513204929814_S.jpg','imgs/product/md/2013051513204929814_S.jpg','imgs/product/lg/2013051513204929814_S.jpg'),
(NULL,14,'imgs/product/sm/2013051513204566348_S.jpg','imgs/product/md/2013051513204566348_S.jpg','imgs/product/lg/2013051513204566348_S.jpg'),
(NULL,15,'imgs/product/sm/2013051513204457719_S.jpg','imgs/product/md/2013051513204457719_S.jpg','imgs/product/lg/2013051513204457719_S.jpg'),
(NULL,15,'imgs/product/sm/2013051513204033273_S.jpg','imgs/product/md/2013051513204033273_S.jpg','imgs/product/lg/2013051513204033273_S.jpg'),
(NULL,15,'imgs/product/sm/2013051512495038318_S.jpg','imgs/product/md/2013051512495038318_S.jpg','imgs/product/lg/2013051512495038318_S.jpg'),
(NULL,15,'imgs/product/sm/2013051512494939783_S.jpg','imgs/product/md/2013051512494939783_S.jpg','imgs/product/lg/2013051512494939783_S.jpg'),
(NULL,15,'imgs/product/sm/2013051512494449793_S.jpg','imgs/product/md/2013051512494449793_S.jpg','imgs/product/lg/2013051512494449793_S.jpg'),
(NULL,16,'imgs/product/sm/2013051512494320252_S.jpg','imgs/product/md/2013051512494320252_S.jpg','imgs/product/lg/2013051512494320252_S.jpg'),
(NULL,16,'imgs/product/sm/2013051512494193619_S.jpg','imgs/product/md/2013051512494193619_S.jpg','imgs/product/lg/2013051512494193619_S.jpg'),
(NULL,16,'imgs/product/sm/2013051512494051782_S.jpg','imgs/product/md/2013051512494051782_S.jpg','imgs/product/lg/2013051512494051782_S.jpg'),
(NULL,16,'imgs/product/sm/2013051511504874533_S.jpg','imgs/product/md/2013051511504874533_S.jpg','imgs/product/lg/2013051511504874533_S.jpg'),
(NULL,16,'imgs/product/sm/2013051511504625978_S.jpg','imgs/product/md/2013051511504625978_S.jpg','imgs/product/lg/2013051511504625978_S.jpg'),
(NULL,17,'imgs/product/sm/2013051511504621583_S.jpg','imgs/product/md/2013051511504621583_S.jpg','imgs/product/lg/2013051511504621583_S.jpg'),
(NULL,17,'imgs/product/sm/2013051511504523960_S.jpg','imgs/product/md/2013051511504523960_S.jpg','imgs/product/lg/2013051511504523960_S.jpg'),
(NULL,17,'imgs/product/sm/2013051511504299610_S.jpg','imgs/product/md/2013051511504299610_S.jpg','imgs/product/lg/2013051511504299610_S.jpg'),
(NULL,17,'imgs/product/sm/2013051511504052040_S.jpg','imgs/product/md/2013051511504052040_S.jpg','imgs/product/lg/2013051511504052040_S.jpg'),
(NULL,17,'imgs/product/sm/2013051511503963831_S.jpg','imgs/product/md/2013051511503963831_S.jpg','imgs/product/lg/2013051511503963831_S.jpg'),
(NULL,18,'imgs/product/sm/2013051511503896753_S.jpg','imgs/product/md/2013051511503896753_S.jpg','imgs/product/lg/2013051511503896753_S.jpg'),
(NULL,18,'imgs/product/sm/2013051511503680640_S.jpg','imgs/product/md/2013051511503680640_S.jpg','imgs/product/lg/2013051511503680640_S.jpg'),
(NULL,18,'imgs/product/sm/201603081541285784_S.jpg','imgs/product/md/201603081541285784_S.jpg','imgs/product/lg/201603081541285784_S.jpg'),
(NULL,18,'imgs/product/sm/201603081541008937_S.jpg','imgs/product/md/201603081541008937_S.jpg','imgs/product/lg/201603081541008937_S.jpg'),
(NULL,18,'imgs/product/sm/201603081540452146_S.jpg','imgs/product/md/201603081540452146_S.jpg','imgs/product/lg/201603081540452146_S.jpg'),
(NULL,18,'imgs/product/sm/201603081522135698_S.jpg','imgs/product/md/201603081522135698_S.jpg','imgs/product/lg/201603081522135698_S.jpg'),
(NULL,18,'imgs/product/sm/201508121126044297_S.jpg','imgs/product/md/201508121126044297_S.jpg','imgs/product/lg/201508121126044297_S.jpg'),
(NULL,19,'imgs/product/sm/201502051648231349_S.jpg','imgs/product/md/201502051648231349_S.jpg','imgs/product/lg/201502051648231349_S.jpg'),
(NULL,19,'imgs/product/sm/201502041645539726_S.jpg','imgs/product/md/201502041645539726_S.jpg','imgs/product/lg/201502041645539726_S.jpg'),
(NULL,19,'imgs/product/sm/201502041628409374_S.jpg','imgs/product/md/201502041628409374_S.jpg','imgs/product/lg/201502041628409374_S.jpg'),
(NULL,19,'imgs/product/sm/201502041628231041_S.jpg','imgs/product/md/201502041628231041_S.jpg','imgs/product/lg/201502041628231041_S.jpg'),
(NULL,20,'imgs/product/sm/201502041611475716_S.jpg','imgs/product/md/201502041611475716_S.jpg','imgs/product/lg/201502041611475716_S.jpg'),
(NULL,20,'imgs/product/sm/201305151359061854_S.jpg','imgs/product/md/201305151359061854_S.jpg','imgs/product/lg/201305151359061854_S.jpg'),
(NULL,20,'imgs/product/sm/201305151320471250_S.jpg','imgs/product/md/201305151320471250_S.jpg','imgs/product/lg/201305151320471250_S.jpg'),
(NULL,20,'imgs/product/sm/201305151320368829_S.jpg','imgs/product/md/201305151320368829_S.jpg','imgs/product/lg/201305151320368829_S.jpg'),
(NULL,20,'imgs/product/sm/201305151340595915_S.jpg','imgs/product/md/201305151340595915_S.jpg','imgs/product/lg/201305151340595915_S.jpg'),
(NULL,21,'imgs/product/sm/20160308152235972_S.jpg','imgs/product/md/20160308152235972_S.jpg','imgs/product/lg/20160308152235972_S.jpg'),
(NULL,21,'imgs/product/sm/201305151249469333_S.jpg','imgs/product/md/201305151249469333_S.jpg','imgs/product/lg/201305151249469333_S.jpg'),
(NULL,21,'imgs/product/sm/201502041602447672_S.jpg','imgs/product/md/201502041602447672_S.jpg','imgs/product/lg/201502041602447672_S.jpg'),
(NULL,21,'imgs/product/sm/201502041602281422_S.jpg','imgs/product/md/201502041602281422_S.jpg','imgs/product/lg/201502041602281422_S.jpg'),
(NULL,21,'imgs/product/sm/201305151340595915_S.jpg','imgs/product/md/201305151340595915_S.jpg','imgs/product/lg/201305151340595915_S.jpg'),
(NULL,21,'imgs/product/sm/201305151405165350_S.jpg','imgs/product/md/201305151405165350_S.jpg','imgs/product/lg/201305151405165350_S.jpg'),
(NULL,22,'imgs/product/sm/2015020416461592843_S.jpg','imgs/product/md/2015020416461592843_S.jpg','imgs/product/lg/2015020416461592843_S.jpg'),
(NULL,22,'imgs/product/sm/2015020416461990587_S.jpg','imgs/product/md/2015020416461990587_S.jpg','imgs/product/lg/2015020416461990587_S.jpg'),
(NULL,22,'imgs/product/sm/2015020416461124840_S.jpg','imgs/product/md/2015020416461124840_S.jpg','imgs/product/lg/2015020416461124840_S.jpg'),
(NULL,22,'imgs/product/sm/2015020416460616192_S.jpg','imgs/product/md/2015020416460616192_S.jpg','imgs/product/lg/2015020416460616192_S.jpg'),
(NULL,22,'imgs/product/sm/2015020416460176567_S.jpg','imgs/product/md/2015020416460176567_S.jpg','imgs/product/lg/2015020416460176567_S.jpg'),
(NULL,23,'imgs/product/sm/2015020416285425505_S.jpg','imgs/product/md/2015020416285425505_S.jpg','imgs/product/lg/2015020416285425505_S.jpg'),
(NULL,23,'imgs/product/sm/2015020416285021947_S.jpg','imgs/product/md/2015020416285021947_S.jpg','imgs/product/lg/2015020416285021947_S.jpg'),
(NULL,23,'imgs/product/sm/2015020416284743222_S.jpg','imgs/product/md/2015020416284743222_S.jpg','imgs/product/lg/2015020416284743222_S.jpg'),
(NULL,23,'imgs/product/sm/2015020416284341533_S.jpg','imgs/product/md/2015020416284341533_S.jpg','imgs/product/lg/2015020416284341533_S.jpg'),
(NULL,23,'imgs/product/sm/2015020416283635326_S.jpg','imgs/product/md/2015020416283635326_S.jpg','imgs/product/lg/2015020416283635326_S.jpg'),
(NULL,24,'imgs/product/sm/2015020416283267739_S.jpg','imgs/product/md/2015020416283267739_S.jpg','imgs/product/lg/2015020416283267739_S.jpg'),
(NULL,24,'imgs/product/sm/2015020416282041606_S.jpg','imgs/product/md/2015020416282041606_S.jpg','imgs/product/lg/2015020416282041606_S.jpg'),
(NULL,24,'imgs/product/sm/2015020416115622140_S.jpg','imgs/product/md/2015020416115622140_S.jpg','imgs/product/lg/2015020416115622140_S.jpg'),
(NULL,24,'imgs/product/sm/2015020416115467245_S.jpg','imgs/product/md/2015020416115467245_S.jpg','imgs/product/lg/2015020416115467245_S.jpg'),
(NULL,24,'imgs/product/sm/2015020416115228887_S.jpg','imgs/product/md/2015020416115228887_S.jpg','imgs/product/lg/2015020416115228887_S.jpg'),
(NULL,25,'imgs/product/sm/2015020416115037609_S.jpg','imgs/product/md/2015020416115037609_S.jpg','imgs/product/lg/2015020416115037609_S.jpg'),
(NULL,25,'imgs/product/sm/2015020416114355172_S.jpg','imgs/product/md/2015020416114355172_S.jpg','imgs/product/lg/2015020416114355172_S.jpg'),
(NULL,25,'imgs/product/sm/2015020416114150707_S.jpg','imgs/product/md/2015020416114150707_S.jpg','imgs/product/lg/2015020416114150707_S.jpg'),
(NULL,25,'imgs/product/sm/2015020416113881016_S.jpg','imgs/product/md/2015020416113881016_S.jpg','imgs/product/lg/2015020416113881016_S.jpg'),
(NULL,25,'imgs/product/sm/2015020416113634280_S.jpg','imgs/product/md/2015020416113634280_S.jpg','imgs/product/lg/2015020416113634280_S.jpg'),
(NULL,26,'imgs/product/sm/2015020416113235326_S.jpg','imgs/product/md/2015020416113235326_S.jpg','imgs/product/lg/2015020416113235326_S.jpg'),
(NULL,26,'imgs/product/sm/2015020416025043105_S.jpg','imgs/product/md/2015020416025043105_S.jpg','imgs/product/lg/2015020416025043105_S.jpg'),
(NULL,26,'imgs/product/sm/2015020416024787932_S.jpg','imgs/product/md/2015020416024787932_S.jpg','imgs/product/lg/2015020416024787932_S.jpg'),
(NULL,26,'imgs/product/sm/2015020416024168505_S.jpg','imgs/product/md/2015020416024168505_S.jpg','imgs/product/lg/2015020416024168505_S.jpg'),
(NULL,26,'imgs/product/sm/2015020416023844677_S.jpg','imgs/product/md/2015020416023844677_S.jpg','imgs/product/lg/2015020416023844677_S.jpg'),
(NULL,27,'imgs/product/sm/2015020416023535817_S.jpg','imgs/product/md/2015020416023535817_S.jpg','imgs/product/lg/2015020416023535817_S.jpg'),
(NULL,27,'imgs/product/sm/2015020416023199299_S.jpg','imgs/product/md/2015020416023199299_S.jpg','imgs/product/lg/2015020416023199299_S.jpg'),
(NULL,27,'imgs/product/sm/2015020416022535958_S.jpg','imgs/product/md/2015020416022535958_S.jpg','imgs/product/lg/2015020416022535958_S.jpg'),
(NULL,27,'imgs/product/sm/2015020416021880848_S.jpg','imgs/product/md/2015020416021880848_S.jpg','imgs/product/lg/2015020416021880848_S.jpg'),
(NULL,27,'imgs/product/sm/2015020416020962713_S.jpg','imgs/product/md/2015020416020962713_S.jpg','imgs/product/lg/2015020416020962713_S.jpg'),
(NULL,27,'imgs/product/sm/2013051514053076571_S.jpg','imgs/product/md/2013051514053076571_S.jpg','imgs/product/lg/2013051514053076571_S.jpg'),
(NULL,28,'imgs/product/sm/2013051514052865192_S.jpg','imgs/product/md/2013051514052865192_S.jpg','imgs/product/lg/2013051514052865192_S.jpg'),
(NULL,28,'imgs/product/sm/2013051514052727707_S.jpg','imgs/product/md/2013051514052727707_S.jpg','imgs/product/lg/2013051514052727707_S.jpg'),
(NULL,29,'imgs/product/sm/2013051514052498188_S.jpg','imgs/product/md/2013051514052498188_S.jpg','imgs/product/lg/2013051514052498188_S.jpg'),
(NULL,29,'imgs/product/sm/2013051514052365498_S.jpg','imgs/product/md/2013051514052365498_S.jpg','imgs/product/lg/2013051514052365498_S.jpg'),
(NULL,29,'imgs/product/sm/2013051514052160487_S.jpg','imgs/product/md/2013051514052160487_S.jpg','imgs/product/lg/2013051514052160487_S.jpg'),
(NULL,29,'imgs/product/sm/2013051514052076215_S.jpg','imgs/product/md/2013051514052076215_S.jpg','imgs/product/lg/2013051514052076215_S.jpg'),
(NULL,29,'imgs/product/sm/2013051513590917967_S.jpg','imgs/product/md/2013051513590917967_S.jpg','imgs/product/lg/2013051513590917967_S.jpg'),
(NULL,30,'imgs/product/sm/2013051513590769543_S.jpg','imgs/product/md/2013051513590769543_S.jpg','imgs/product/lg/2013051513590769543_S.jpg'),
(NULL,30,'imgs/product/sm/2013051513590345862_S.jpg','imgs/product/md/2013051513590345862_S.jpg','imgs/product/lg/2013051513590345862_S.jpg'),
(NULL,30,'imgs/product/sm/2013051513590076176_S.jpg','imgs/product/md/2013051513590076176_S.jpg','imgs/product/lg/2013051513590076176_S.jpg'),
(NULL,30,'imgs/product/sm/2013051513585928247_S.jpg','imgs/product/md/2013051513585928247_S.jpg','imgs/product/lg/2013051513585928247_S.jpg'),
(NULL,30,'imgs/product/sm/2013051513585721281_S.jpg','imgs/product/md/2013051513585721281_S.jpg','imgs/product/lg/2013051513585721281_S.jpg'),
(NULL,30,'imgs/product/sm/2013051513585683740_S.jpg','imgs/product/md/2013051513585683740_S.jpg','imgs/product/lg/2013051513585683740_S.jpg'),
(NULL,31,'imgs/product/sm/2013051513410639732_S.jpg','imgs/product/md/2013051513410639732_S.jpg','imgs/product/lg/2013051513410639732_S.jpg'),
(NULL,31,'imgs/product/sm/2013051513410588403_S.jpg','imgs/product/md/2013051513410588403_S.jpg','imgs/product/lg/2013051513410588403_S.jpg'),
(NULL,31,'imgs/product/sm/2013051513410349933_S.jpg','imgs/product/md/2013051513410349933_S.jpg','imgs/product/lg/2013051513410349933_S.jpg'),
(NULL,31,'imgs/product/sm/2013051513410178290_S.jpg','imgs/product/md/2013051513410178290_S.jpg','imgs/product/lg/2013051513410178290_S.jpg'),
(NULL,31,'imgs/product/sm/2013051513405895764_S.jpg','imgs/product/md/2013051513405895764_S.jpg','imgs/product/lg/2013051513405895764_S.jpg'),
(NULL,32,'imgs/product/sm/2013051513405652451_S.jpg','imgs/product/md/2013051513405652451_S.jpg','imgs/product/lg/2013051513405652451_S.jpg'),
(NULL,32,'imgs/product/sm/2013051513405423181_S.jpg','imgs/product/md/2013051513405423181_S.jpg','imgs/product/lg/2013051513405423181_S.jpg'),
(NULL,32,'imgs/product/sm/2013051513405356303_S.jpg','imgs/product/md/2013051513405356303_S.jpg','imgs/product/lg/2013051513405356303_S.jpg'),
(NULL,32,'imgs/product/sm/2013051513290568505_S.jpg','imgs/product/md/2013051513290568505_S.jpg','imgs/product/lg/2013051513290568505_S.jpg'),
(NULL,32,'imgs/product/sm/2013051513290456813_S.jpg','imgs/product/md/2013051513290456813_S.jpg','imgs/product/lg/2013051513290456813_S.jpg'),
(NULL,33,'imgs/product/sm/2013051513290390783_S.jpg','imgs/product/md/2013051513290390783_S.jpg','imgs/product/lg/2013051513290390783_S.jpg'),
(NULL,33,'imgs/product/sm/2013051513290054546_S.jpg','imgs/product/md/2013051513290054546_S.jpg','imgs/product/lg/2013051513290054546_S.jpg'),
(NULL,33,'imgs/product/sm/2013051513285934352_S.jpg','imgs/product/md/2013051513285934352_S.jpg','imgs/product/lg/2013051513285934352_S.jpg'),
(NULL,33,'imgs/product/sm/2013051513285735504_S.jpg','imgs/product/md/2013051513285735504_S.jpg','imgs/product/lg/2013051513285735504_S.jpg'),
(NULL,33,'imgs/product/sm/2013051513285541436_S.jpg','imgs/product/md/2013051513285541436_S.jpg','imgs/product/lg/2013051513285541436_S.jpg'),
(NULL,34,'imgs/product/sm/2013051513285270812_S.jpg','imgs/product/md/2013051513285270812_S.jpg','imgs/product/lg/2013051513285270812_S.jpg'),
(NULL,34,'imgs/product/sm/2013051513205286912_S.jpg','imgs/product/md/2013051513205286912_S.jpg','imgs/product/lg/2013051513205286912_S.jpg'),
(NULL,34,'imgs/product/sm/2013051513205149870_S.jpg','imgs/product/md/2013051513205149870_S.jpg','imgs/product/lg/2013051513205149870_S.jpg'),
(NULL,34,'imgs/product/sm/2013051513204929814_S.jpg','imgs/product/md/2013051513204929814_S.jpg','imgs/product/lg/2013051513204929814_S.jpg'),
(NULL,34,'imgs/product/sm/2013051513204566348_S.jpg','imgs/product/md/2013051513204566348_S.jpg','imgs/product/lg/2013051513204566348_S.jpg'),
(NULL,35,'imgs/product/sm/2013051513204457719_S.jpg','imgs/product/md/2013051513204457719_S.jpg','imgs/product/lg/2013051513204457719_S.jpg'),
(NULL,35,'imgs/product/sm/2013051513204033273_S.jpg','imgs/product/md/2013051513204033273_S.jpg','imgs/product/lg/2013051513204033273_S.jpg'),
(NULL,35,'imgs/product/sm/2013051512495038318_S.jpg','imgs/product/md/2013051512495038318_S.jpg','imgs/product/lg/2013051512495038318_S.jpg'),
(NULL,35,'imgs/product/sm/2013051512494939783_S.jpg','imgs/product/md/2013051512494939783_S.jpg','imgs/product/lg/2013051512494939783_S.jpg'),
(NULL,35,'imgs/product/sm/2013051512494449793_S.jpg','imgs/product/md/2013051512494449793_S.jpg','imgs/product/lg/2013051512494449793_S.jpg'),
(NULL,36,'imgs/product/sm/2013051512494320252_S.jpg','imgs/product/md/2013051512494320252_S.jpg','imgs/product/lg/2013051512494320252_S.jpg'),
(NULL,36,'imgs/product/sm/2013051512494193619_S.jpg','imgs/product/md/2013051512494193619_S.jpg','imgs/product/lg/2013051512494193619_S.jpg'),
(NULL,36,'imgs/product/sm/2013051512494051782_S.jpg','imgs/product/md/2013051512494051782_S.jpg','imgs/product/lg/2013051512494051782_S.jpg'),
(NULL,36,'imgs/product/sm/2013051511504874533_S.jpg','imgs/product/md/2013051511504874533_S.jpg','imgs/product/lg/2013051511504874533_S.jpg'),
(NULL,36,'imgs/product/sm/2013051511504625978_S.jpg','imgs/product/md/2013051511504625978_S.jpg','imgs/product/lg/2013051511504625978_S.jpg'),
(NULL,37,'imgs/product/sm/2013051511504621583_S.jpg','imgs/product/md/2013051511504621583_S.jpg','imgs/product/lg/2013051511504621583_S.jpg'),
(NULL,37,'imgs/product/sm/2013051511504523960_S.jpg','imgs/product/md/2013051511504523960_S.jpg','imgs/product/lg/2013051511504523960_S.jpg'),
(NULL,37,'imgs/product/sm/2013051511504299610_S.jpg','imgs/product/md/2013051511504299610_S.jpg','imgs/product/lg/2013051511504299610_S.jpg'),
(NULL,37,'imgs/product/sm/2013051511504052040_S.jpg','imgs/product/md/2013051511504052040_S.jpg','imgs/product/lg/2013051511504052040_S.jpg'),
(NULL,37,'imgs/product/sm/2013051511503963831_S.jpg','imgs/product/md/2013051511503963831_S.jpg','imgs/product/lg/2013051511503963831_S.jpg'),
(NULL,38,'imgs/product/sm/2013051511503896753_S.jpg','imgs/product/md/2013051511503896753_S.jpg','imgs/product/lg/2013051511503896753_S.jpg'),
(NULL,38,'imgs/product/sm/2013051511503680640_S.jpg','imgs/product/md/2013051511503680640_S.jpg','imgs/product/lg/2013051511503680640_S.jpg'),
(NULL,38,'imgs/product/sm/201603081541285784_S.jpg','imgs/product/md/201603081541285784_S.jpg','imgs/product/lg/201603081541285784_S.jpg'),
(NULL,38,'imgs/product/sm/201603081541008937_S.jpg','imgs/product/md/201603081541008937_S.jpg','imgs/product/lg/201603081541008937_S.jpg'),
(NULL,38,'imgs/product/sm/201603081540452146_S.jpg','imgs/product/md/201603081540452146_S.jpg','imgs/product/lg/201603081540452146_S.jpg'),
(NULL,38,'imgs/product/sm/201603081522135698_S.jpg','imgs/product/md/201603081522135698_S.jpg','imgs/product/lg/201603081522135698_S.jpg'),
(NULL,38,'imgs/product/sm/201508121126044297_S.jpg','imgs/product/md/201508121126044297_S.jpg','imgs/product/lg/201508121126044297_S.jpg'),
(NULL,39,'imgs/product/sm/201502051648231349_S.jpg','imgs/product/md/201502051648231349_S.jpg','imgs/product/lg/201502051648231349_S.jpg'),
(NULL,39,'imgs/product/sm/201502041645539726_S.jpg','imgs/product/md/201502041645539726_S.jpg','imgs/product/lg/201502041645539726_S.jpg'),
(NULL,39,'imgs/product/sm/201502041628409374_S.jpg','imgs/product/md/201502041628409374_S.jpg','imgs/product/lg/201502041628409374_S.jpg'),
(NULL,39,'imgs/product/sm/201502041628231041_S.jpg','imgs/product/md/201502041628231041_S.jpg','imgs/product/lg/201502041628231041_S.jpg'),
(NULL,40,'imgs/product/sm/201502041611475716_S.jpg','imgs/product/md/201502041611475716_S.jpg','imgs/product/lg/201502041611475716_S.jpg'),
(NULL,40,'imgs/product/sm/201305151359061854_S.jpg','imgs/product/md/201305151359061854_S.jpg','imgs/product/lg/201305151359061854_S.jpg'),
(NULL,40,'imgs/product/sm/201305151320471250_S.jpg','imgs/product/md/201305151320471250_S.jpg','imgs/product/lg/201305151320471250_S.jpg'),
(NULL,40,'imgs/product/sm/201305151320368829_S.jpg','imgs/product/md/201305151320368829_S.jpg','imgs/product/lg/201305151320368829_S.jpg'),
(NULL,40,'imgs/product/sm/201305151340595915_S.jpg','imgs/product/md/201305151340595915_S.jpg','imgs/product/lg/201305151340595915_S.jpg'),
(NULL,41,'imgs/product/sm/2015020416023535817_S.jpg','imgs/product/md/2015020416023535817_S.jpg','imgs/product/lg/2015020416023535817_S.jpg'),
(NULL,41,'imgs/product/sm/2015020416023199299_S.jpg','imgs/product/md/2015020416023199299_S.jpg','imgs/product/lg/2015020416023199299_S.jpg'),
(NULL,41,'imgs/product/sm/2015020416022535958_S.jpg','imgs/product/md/2015020416022535958_S.jpg','imgs/product/lg/2015020416022535958_S.jpg'),
(NULL,41,'imgs/product/sm/2015020416021880848_S.jpg','imgs/product/md/2015020416021880848_S.jpg','imgs/product/lg/2015020416021880848_S.jpg'),
(NULL,41,'imgs/product/sm/2015020416020962713_S.jpg','imgs/product/md/2015020416020962713_S.jpg','imgs/product/lg/2015020416020962713_S.jpg'),
(NULL,41,'imgs/product/sm/2013051514053076571_S.jpg','imgs/product/md/2013051514053076571_S.jpg','imgs/product/lg/2013051514053076571_S.jpg'),
(NULL,42,'imgs/product/sm/2013051514052865192_S.jpg','imgs/product/md/2013051514052865192_S.jpg','imgs/product/lg/2013051514052865192_S.jpg'),
(NULL,42,'imgs/product/sm/2013051514052727707_S.jpg','imgs/product/md/2013051514052727707_S.jpg','imgs/product/lg/2013051514052727707_S.jpg'),
(NULL,42,'imgs/product/sm/2013051514052498188_S.jpg','imgs/product/md/2013051514052498188_S.jpg','imgs/product/lg/2013051514052498188_S.jpg'),
(NULL,42,'imgs/product/sm/2013051514052365498_S.jpg','imgs/product/md/2013051514052365498_S.jpg','imgs/product/lg/2013051514052365498_S.jpg'),
(NULL,42,'imgs/product/sm/2013051514052160487_S.jpg','imgs/product/md/2013051514052160487_S.jpg','imgs/product/lg/2013051514052160487_S.jpg'),
(NULL,42,'imgs/product/sm/2013051514052076215_S.jpg','imgs/product/md/2013051514052076215_S.jpg','imgs/product/lg/2013051514052076215_S.jpg');

/**用户信息**/
INSERT INTO hl_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13701234567', 'imgs/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '15901234568', 'imgs/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '17801234569', 'imgs/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '16901234560', 'imgs/avatar/default.png', '秦小雅', '0');



/****首页轮播广告商品****/
INSERT INTO hl_index_carousel VALUES
(NULL, 'imgs/index/banner1.jpg','轮播广告商品1','product_details.html'),
(NULL, 'imgs/index/banner2.jpg','轮播广告商品2','product_details.html'),
(NULL, 'imgs/index/banner3.jpg','轮播广告商品3','product_details.html'),
(NULL, 'imgs/index/banner4.jpg','轮播广告商品4','product_details.html'),
(NULL, 'imgs/index/banner5.jpeg','轮播广告商品5','product_details.html');

/****首页商品****/
INSERT INTO hl_index_product VALUES
(NUll,'阿普利亚Cafe150','骑最帅的车.日最爱的妞','imgs/product-details/3917_j5no3zpo.png-imageView2-2-w-1200-q-100.png',19998,'product_details.html?lid=3',7,4,1),
(NUll,'阿普利亚xdd130','骑最帅的车.日最爱的妞','imgs/product/md/2013051513285934352_S.jpg',16998,'product_details.html?lid=33',4,6,1),
(NUll,'阿普利亚z220','骑最帅的车.日最爱的妞','imgs/product-details/3917_j5nobj6n.png',23998,'product_details.html?lid=5',3,7,6),
(NUll,'阿普利亚xdd130','骑最帅的车.日最爱的妞','imgs/product-details/3917_j5npsh7w.png-imageView2-2-w-1200-q-100.png',16998,'product_details.html?lid=10',9,6,4),
(NUll,'阿普利亚xdd130','骑最帅的车.日最爱的妞','imgs/product/md/201305151320368829_S.jpg',19998,'product_details.html?lid=40',8,3,1),
(NUll,'阿普利亚xdd130','骑最帅的车.日最爱的妞','imgs/product-details/3917_j5nprwpw.png-imageView2-2-w-1200-q-100.png',22998,'product_details.html?lid=18',7,7,6),
(NUll,'阿普利亚xdd130','骑最帅的车.日最爱的妞','imgs/product-details/3917_j5nprqun.png-imageView2-2-w-1200-q-100.png',24998,'product_details.html?lid=8',9,6,1),
(NUll,'阿普利亚xdd130','骑最帅的车.日最爱的妞','imgs/product/md/201603081540452146_S.jpg',25998,'product_details.html?lid=38',6,8,1),
(NUll,'阿普利亚xdd130','骑最帅的车.日最爱的妞','imgs/product-details/3917_j5nps4aw.png-imageView2-2-w-1200-q-100.png',27998,'product_details.html?lid=9',3,2,1);