#客户端链接数据库是使用的编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS around;
#创建数据库使用的编码
CREATE DATABASE around CHARSET=UTF8;
#进入创建的数据库
USE around;

#创建用户信息表
CREATE TABLE wang_user(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(16) NOT NULL,
	password VARCHAR(32) NOT NULL,
	phone CHAR(11) NOT NULL,
	nameID VARCHAR(18) NOT NULL
);

#测试员账号
INSERT INTO wang_user VALUES
(1,'王绍祥测试员001','25d55ad283aa400af464c76d713c07ad',18287326974,532523200201211212),
(2,'王绍祥测试员002',98765432,18314063847,532523197504041289),
(3,'超级管理员王绍祥','16b9a633882dd92c1c59941a9b326c24',18287326974,532523200201211212);

#创建保存诗词的表
CREATE TABLE song(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	aname VARCHAR(14) NOT NULL,
	achaodai VARCHAR(6) NOT NULL,/*朝代*/
	atitle VARCHAR(20) NOT NULL,
	atext TEXT NOT NULL,
	aaid INT /*诗词分类 1诗2词*/
);

#插入测试数据到诗词表
INSERT INTO song VALUES
(1,'岑参','唐','白雪歌送武判官归京','北风卷地白草折，胡天八月即飞雪。<br>忽如一夜春风来，千树万树梨花开。<br>散入珠帘湿罗幕，狐裘不暖锦衾薄。<br>将军角弓不得控，都护铁衣冷难着。<br>瀚海阑干百丈冰，愁云惨淡万里凝。<br>中军置酒饮归客，胡琴琵琶与羌笛。<br>纷纷暮雪下辕门，风掣红旗冻不翻。<br>轮台东门送君去，去时雪满天山路。<br>山回路转不见君，雪上空留马行处。',1),
(2,'未知','未知','蒹葭','蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。<br>蒹葭萋萋，白露未晞。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。<br>蒹葭采采，白露未已。所谓伊人，在水之涘。溯洄从之，道阻且右。溯游从之，宛在水中沚。',2);

#创建作者表
CREATE TABLE author(
	bid INT PRIMARY KEY AUTO_INCREMENT,
	bname VARCHAR(8) NOT NULL unique,
	bphone CHAR(11) NOT NULL,
	bnameID VARCHAR(18) NOT NULL unique,
	beit VARCHAr(1) unique,
	bmox VARCHAR(6) unique,
	bnameIDD VARCHAR(35)
);

#插入唯一作者
INSERT INTO author VALUES(1,'王绍祥','18287326974','532523200201211212','男','苗族','云南省红河哈尼族彝族自治州屏边苗族自治县新华乡河南村委会河南中寨村6号');

#创建商品索引表
CREATE TABLE shopping_indexes(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20) NOT NULL
);

#插入测试数据到商品索引表
INSERT INTO shopping_indexes VALUES
(1,'数码'),
(2,'生活');

#创建商城表
CREATE TABLE shopping(
	did INT PRIMARY KEY AUTO_INCREMENT,
	dtitle VARCHAR(60) NOT NULL,/*简介*/
	dgimage VARCHAR(30) NOT NULL,/*大厅图片*/
	dgimage1 VARCHAR(30) NOT NULL,
	dgimage2 VARCHAR(30) NOT NULL,
	dgimage3 VARCHAR(30) NOT NULL,
	dprice DECIMAL(10,2) NOT NULL,
	dcid INT,
	FOREIGN KEY(dcid) REFERENCES shopping_indexes(cid)
);

#插入测试数据到商城表
INSERT INTO shopping VALUES
(1,"【百亿补贴专享优惠 中国移动官旗】苹果12 Pro手机iPhone 12Pro苹果手机官方旗舰店iPhone 12Pro手机苹果","shouji00.jpg","shouji01.png","shouji02.png","shouji03.jpg","8699.99",1),
(2,"优衣库【设计师合作款】男装 +J 宽松连帽长大衣 440367","nanzhuang001.jpg","nanzhuang002.jpg","nanzhuang003.jpg","nanzhuang004.jpg","1099.00",2),
(3,"DR WEDDING幸福捧花求婚钻戒结婚钻石戒指官方旗舰店仅售部分手寸","jiezhi001.jpg","jiezhi002.jpg","jiezhi003.jpg","jiezhi004.jpg","5279.00",2),
(4,"宁美国度台式电脑主机十代酷睿i5 10400办公电脑家用游戏主机企业采购设计师电脑台式组装机全套DIY整机","diannao001.jpg","diannao002.jpg","diannao003.jpg","diannao004.jpg","3899.00",1);

#创建商场信息表
CREATE TABLE shopping_information(
	eid INT PRIMARY KEY AUTO_INCREMENT,
	ebox VARCHAR(20) NOT NULL,/*数码：内存，其他：尺寸*/
	eprice DECIMAL(10,2) NOT NULL,/*价格：列如：9999.99*/
	edid INT,
	FOREIGN KEY(edid) REFERENCES shopping(did)
);

#插入数据到商城信息表
INSERT INTO shopping_information VALUES
(1,'128G','8699.99',1),
(2,'256G','9599.00',1),
(3,'160/76A/XS','1099.00',2),
(4,'175/100A/L','1199.00',2),
(6,'主8,副6~8','5279.00',3),
(7,'8G','3899.00','4');

#创建音乐分类表
CREATE TABLE music_type(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(10) NOT NULL
);

#插入分类信息
INSERT INTO music_type VALUES
(1,'古风'),
(2,'新歌'),
(3,'怀旧'),
(4,'民族'),
(5,'DJ');

#创建歌曲列表
CREATE TABLE music(
	gid INT PRIMARY KEY AUTO_INCREMENT,
	gtitle VARCHAR(30) NOT NULL,
	gname VArCHAr(15) NOT NULL,
	gfid INT,
	FOREIGN KEY(gfid) REFERENCES music_type(fid)
);

#插入测试歌曲
INSERT INTO music VALUES
(1,'贺世哲 - 相信我没有错.mp3','贺世哲',2),
(2,'邹兴兰 - 假如你是一朵花.mp3','邹兴兰',4),
(3,'卓依婷 - 梅花三弄.mp3','卓依婷',3),
(4,'金莎 - 白蛇爱情物语.mp3','金沙',1),
(5,'季彦霖 - 渐行渐远.mp3','季彦霖',2),
(6,'火线妹 - 记忆倒带.mp3','火线妹',2),
(7,'花僮 - 浪子闲话 (DJ沈念版).mp3','花僮',5),
(8,'花僮 - 我不想再去原谅你.mp3','花僮',2),
(9,'可歆 - 过去的回不去.mp3','可歆',2),
(10,'回小仙 - 醒不来的梦.mp3','回小仙',2);