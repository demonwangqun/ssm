--数据库初始化脚本

--创建数据库
CREATE DATABASE seckill;
--使用数据库
USE seckill;
CREATE TABLE seckill(
  seckill_id  bigint  NOT  NULL  AUTO_INCREMENT  COMMENT  '商品库存ID' ,
 name   varchar(120)  NOT  NULL  COMMENT   '商品名称' ,
number  int NOT NULL COMMENT	 '库存数量' ,
 start_time   timestamp NOT NULL  COMMENT  '开始秒杀时间' ,
end_time   timestamp NOT NULL COMMENT  '结束秒杀时间' ,
create_time   timestamp  NOT NULL DEFAULT  CURRENT_TIMESTAMP  COMMENT '创建时间' ,
 PRIMARY KEY (seckill_id),
 key   idx_start_time(start_time),
 key  idx_end_time(end_time),
 key  idx_create_time(create_tim e)
)ENGINE=InnoDB  AUTO_INCREMENT=1000  DEFAULT CHARSET=utf8 COMMENT='秒杀库存表' ;

--初始化数据
INSERT INTO seckill(name,number,start_time,end_time)
values
    ('1000元秒杀iPhone6',100,'2015-11-01  00:00:00','2015-11-02  00:00:00'),
    ('200元秒杀iPhone7',200,'2015-11-01  00:00:00','2015-11-02  00:00:00'),
    ('1元秒杀iPhone8',300,'2015-11-01  00:00:00','2015-11-02  00:00:00'),
    ('20元秒杀iPhone9',400,'2015-11-01  00:00:00','2015-11-02  00:00:00');
    
--秒杀成功明细表
--用户登录认证相关信息
create table  success_killed(
 seckill_id  bigint NOT NULL  COMMENT   '秒杀商品ID',
 user_phone  bigint  NOT NULL  COMMENT   '用户手机号',
 state  tinyint NOT NULL DEFAULT  -1  COMMENT '状态标识：-1：无效  0：成功  1：已付款  2：已发货',
 create_time  timestamp NOT NULL COMMENT '创建时间',
 PRIMARY KEY(seckill_id,user_phone),/*联合主键*/
 KEY idx_create_time(create_time) 

)ENGINE=InnoDB   DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

mysql -uroot  -p

--Ϊʲô��дDDL
--��¼ÿ�����ߵĵ�DDL�޸�
--����v1.1
ALTER TABLE seckill
DROP INDEX idx_create_time,
ADD index  idx_c_s(start_time,create_time);

--����v1.2
--ddl
    