
#类目-----------------------------------------------
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('800',1,'类目管理','800','category/list.do','706');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('801',0,'类目添加','1','category/add.do','800');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('802',0,'删除类目','2','category/delete.do','800');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('803',0,'类目修改','3','category/update.do','800');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('805',0,'类目查看','5','category/detail.do','800');

#商品-----------------------------------------------
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('808',1,'商品管理','807','product/list.do','706');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('809',0,'商品添加','1','product/add.do','808');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('810',0,'删除商品','2','product/delete.do','808');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('811',0,'商品修改','3','product/update.do','808');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('813',0,'商品查看','5','product/detail.do','808');

#访问日志-----------------------------------------------
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('816',1,'访问日志管理','814','accessLog/list.do','706');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('817',0,'访问日志添加','1','accessLog/add.do','816');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('818',0,'删除访问日志','2','accessLog/delete.do','816');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('819',0,'访问日志修改','3','accessLog/update.do','816');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('821',0,'访问日志查看','5','accessLog/detail.do','816');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('836',0,'数据统计','5','accessLog/stat.do','706');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('837',0,'全部数据统计','5','accessLog/allStat.do','706');

#注册申请-----------------------------------------------
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('824',1,'注册申请管理','821','registerApply/list.do','706');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('825',0,'注册申请添加','1','registerApply/add.do','824');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('826',0,'删除注册申请','2','registerApply/delete.do','824');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('827',0,'注册申请修改','3','registerApply/update.do','824');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('829',0,'注册申请查看','5','registerApply/detail.do','824');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('835',0,'注册申请处理','5','registerApply/deal.do','824');

INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('830',1,'我的商品','807','product/myList.do','706');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('831',0,'商品添加','1','product/myAdd.do','830');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('832',0,'删除商品','2','product/myDelete.do','830');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('833',0,'商品修改','3','product/myUpdate.do','830');
INSERT INTO `sys_function_point` (`id`,`is_display`, `name`, `order_num`, `url`, `parent`)VALUES ('834',0,'商品查看','5','product/myDetail.do','830');