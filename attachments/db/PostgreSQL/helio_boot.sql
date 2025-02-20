-- ----------------------------
-- Table structure for sys_data_dict_classified & sys_data_dict_item
-- ----------------------------
CREATE TABLE "sys_data_dict_classified" (
  "id" int8 NOT NULL,
  "tenant_id" int8,
  "revision" int8 NOT NULL DEFAULT 1,
  "del_flag" int2 NOT NULL DEFAULT 0,
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_at" timestamp(6) NOT NULL,
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL DEFAULT 1,
  "description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
);
COMMENT ON COLUMN "sys_data_dict_classified"."id" IS '主键ID';
COMMENT ON COLUMN "sys_data_dict_classified"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "sys_data_dict_classified"."revision" IS '乐观锁';
COMMENT ON COLUMN "sys_data_dict_classified"."del_flag" IS '逻辑删除标识';
COMMENT ON COLUMN "sys_data_dict_classified"."created_at" IS '创建时刻';
COMMENT ON COLUMN "sys_data_dict_classified"."created_by" IS '创建者';
COMMENT ON COLUMN "sys_data_dict_classified"."updated_at" IS '更新时刻';
COMMENT ON COLUMN "sys_data_dict_classified"."updated_by" IS '更新者';
COMMENT ON COLUMN "sys_data_dict_classified"."code" IS '分类编码';
COMMENT ON COLUMN "sys_data_dict_classified"."name" IS '分类名称';
COMMENT ON COLUMN "sys_data_dict_classified"."status" IS '状态';
COMMENT ON COLUMN "sys_data_dict_classified"."description" IS '分类描述';
COMMENT ON TABLE "sys_data_dict_classified" IS '数据字典分类';
ALTER TABLE "sys_data_dict_classified" ADD PRIMARY KEY ("id");

CREATE TABLE "sys_data_dict_item" (
  "id" int8 NOT NULL,
  "tenant_id" int8,
  "revision" int8 NOT NULL DEFAULT 1,
  "del_flag" int2 NOT NULL DEFAULT 0,
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_at" timestamp(6) NOT NULL,
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "classified_id" int8 NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "label" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(4096) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL DEFAULT 1,
  "sort" int4 NOT NULL DEFAULT 1,
  "description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
);
COMMENT ON COLUMN "sys_data_dict_item"."id" IS '主键ID';
COMMENT ON COLUMN "sys_data_dict_item"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "sys_data_dict_item"."revision" IS '乐观锁';
COMMENT ON COLUMN "sys_data_dict_item"."del_flag" IS '逻辑删除标识';
COMMENT ON COLUMN "sys_data_dict_item"."created_at" IS '创建时刻';
COMMENT ON COLUMN "sys_data_dict_item"."created_by" IS '创建者';
COMMENT ON COLUMN "sys_data_dict_item"."updated_at" IS '更新时刻';
COMMENT ON COLUMN "sys_data_dict_item"."updated_by" IS '更新者';
COMMENT ON COLUMN "sys_data_dict_item"."classified_id" IS '所属分类ID';
COMMENT ON COLUMN "sys_data_dict_item"."code" IS '字典项编码';
COMMENT ON COLUMN "sys_data_dict_item"."label" IS '字典项标签';
COMMENT ON COLUMN "sys_data_dict_item"."value" IS '字典项值';
COMMENT ON COLUMN "sys_data_dict_item"."status" IS '状态';
COMMENT ON COLUMN "sys_data_dict_item"."sort" IS '排序';
COMMENT ON COLUMN "sys_data_dict_item"."description" IS '描述';
COMMENT ON TABLE "sys_data_dict_item" IS '数据字典项';
ALTER TABLE "sys_data_dict_item" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "sys_dept";
CREATE TABLE "sys_dept"
(
    "id"         int8         NOT NULL,
    "tenant_id"  int8,
    "revision"   int8         NOT NULL DEFAULT 1,
    "del_flag"   int2         NOT NULL DEFAULT 0,
    "created_at" timestamp(6) NOT NULL,
    "created_by" varchar(255),
    "updated_at" timestamp(6) NOT NULL,
    "updated_by" varchar(255),
    "title"      varchar(50)  NOT NULL,
    "parent_id"  int8         NOT NULL,
    "sort"       int4         NOT NULL,
    "status"     int4         NOT NULL
)
;
COMMENT
ON COLUMN "sys_dept"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_dept"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_dept"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_dept"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_dept"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_dept"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_dept"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_dept"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_dept"."title" IS '名称';
COMMENT
ON COLUMN "sys_dept"."parent_id" IS '上级ID(根节点设置为0)';
COMMENT
ON COLUMN "sys_dept"."sort" IS '排序';
COMMENT
ON COLUMN "sys_dept"."status" IS '状态(0=禁用 1=启用)';
COMMENT
ON TABLE "sys_dept" IS '部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "sys_log";
CREATE TABLE "sys_log"
(
    "id"         int8         NOT NULL,
    "tenant_id"  int8,
    "revision"   int8         NOT NULL DEFAULT 1,
    "del_flag"   int2         NOT NULL DEFAULT 0,
    "created_at" timestamp(6) NOT NULL,
    "created_by" varchar(255),
    "updated_at" timestamp(6) NOT NULL,
    "updated_by" varchar(255),
    "user_id"    int8,
    "username"   varchar(50),
    "operation"  varchar(255),
    "method"     varchar(500),
    "params"     text,
    "ip"         varchar(128),
    "status"     int4         NOT NULL
)
;
COMMENT
ON COLUMN "sys_log"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_log"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_log"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_log"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_log"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_log"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_log"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_log"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_log"."user_id" IS '用户ID';
COMMENT
ON COLUMN "sys_log"."username" IS '用户账号';
COMMENT
ON COLUMN "sys_log"."operation" IS '操作内容';
COMMENT
ON COLUMN "sys_log"."method" IS '请求方法';
COMMENT
ON COLUMN "sys_log"."params" IS '请求参数';
COMMENT
ON COLUMN "sys_log"."ip" IS 'IP地址';
COMMENT
ON COLUMN "sys_log"."status" IS '状态(参考SysLogStatusEnum)';
COMMENT
ON TABLE "sys_log" IS '后台操作日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "sys_menu";
CREATE TABLE "sys_menu"
(
    "id"            int8         NOT NULL,
    "tenant_id"     int8,
    "revision"      int8         NOT NULL DEFAULT 1,
    "del_flag"      int2         NOT NULL DEFAULT 0,
    "created_at"    timestamp(6) NOT NULL,
    "created_by"    varchar(255),
    "updated_at"    timestamp(6) NOT NULL,
    "updated_by"    varchar(255),
    "title"         varchar(50)  NOT NULL,
    "parent_id"     int8         NOT NULL,
    "type"          int4         NOT NULL,
    "permission"    varchar(255) NOT NULL,
    "icon"          varchar(255),
    "sort"          int4,
    "status"        int4         NOT NULL,
    "component"     varchar(255),
    "external_link" varchar(255)
)
;
COMMENT
ON COLUMN "sys_menu"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_menu"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_menu"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_menu"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_menu"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_menu"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_menu"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_menu"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_menu"."title" IS '名称';
COMMENT
ON COLUMN "sys_menu"."parent_id" IS '上级菜单ID(根节点设置为0)';
COMMENT
ON COLUMN "sys_menu"."type" IS '菜单类型(参考MenuTypeEnum)';
COMMENT
ON COLUMN "sys_menu"."permission" IS '权限标识';
COMMENT
ON COLUMN "sys_menu"."icon" IS '图标';
COMMENT
ON COLUMN "sys_menu"."sort" IS '排序';
COMMENT
ON COLUMN "sys_menu"."status" IS '状态(0=禁用 1=启用)';
COMMENT
ON COLUMN "sys_menu"."component" IS '组件';
COMMENT
ON COLUMN "sys_menu"."external_link" IS '外链地址';
COMMENT
ON TABLE "sys_menu" IS '后台菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO "sys_menu"
VALUES (1, 0, 1, 0, '2021-06-01 17:16:48', NULL, '2021-06-02 17:14:16', NULL, '系统管理', 0, 0, 'Sys',
        'ant-design:setting-outlined', 3, 1, 'LAYOUT', '');
INSERT INTO "sys_menu"
VALUES (2, 0, 1, 0, '2021-06-01 17:13:13', NULL, '2021-07-18 00:10:33', 'admin', '中控台', 0, 0, 'Dashboard',
        'ant-design:appstore-outlined', 1, 1, 'LAYOUT', '');
INSERT INTO "sys_menu"
VALUES (3, 0, 1, 0, '2021-06-01 17:14:22', NULL, '2021-06-02 11:24:38', NULL, '分析页(后台登录后默认首页)', 2, 1,
        'Dashboard:analysis', 'ant-design:fund-outlined', 1, 1, '/dashboard/analysis/index', '');
INSERT INTO "sys_menu"
VALUES (4, 0, 1, 0, '2021-06-01 17:14:47', NULL, '2021-06-02 11:32:23', NULL, '工作台', 2, 1, 'Dashboard:workbench',
        'ant-design:database-outlined', 2, 1, '/dashboard/workbench/index', '');
INSERT INTO "sys_menu"
VALUES (5, 0, 1, 0, '2021-06-01 17:15:38', NULL, '2021-07-15 23:56:43', 'admin', '关于', 0, 1, 'About',
        'ant-design:eye-outlined', 2, 1, '/sys/about/index', '');
INSERT INTO "sys_menu"
VALUES (6, 0, 1, 0, '2021-06-02 16:06:58', NULL, '2021-07-17 23:55:52', 'admin', '学(mo)习(yu)', 2, 3, '',
        'ant-design:zhihu-outlined', 3, 1, 'https://www.zhihu.com/', 'https://www.zhihu.com/');
INSERT INTO "sys_menu"
VALUES (7, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '部门管理', 1, 1, 'SysDept',
        'ant-design:flag-outlined', 1, 1, '/sys/SysDept/index', '');
INSERT INTO "sys_menu"
VALUES (8, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '查询', 7, 2, 'SysDept:retrieve', NULL, 1,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (9, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '新增', 7, 2, 'SysDept:create', NULL, 2, 1,
        NULL, '');
INSERT INTO "sys_menu"
VALUES (10, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '删除', 7, 2, 'SysDept:delete', NULL, 3, 1,
        NULL, '');
INSERT INTO "sys_menu"
VALUES (11, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '编辑', 7, 2, 'SysDept:update', NULL, 4, 1,
        NULL, '');
INSERT INTO "sys_menu"
VALUES (12, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '角色管理', 1, 1, 'SysRole',
        'ant-design:usergroup-add-outlined', 2, 1, '/sys/SysRole/index', '');
INSERT INTO "sys_menu"
VALUES (13, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '查询', 12, 2, 'SysRole:retrieve', NULL, 1,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (14, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '新增', 12, 2, 'SysRole:create', NULL, 2,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (15, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '删除', 12, 2, 'SysRole:delete', NULL, 3,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (16, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '编辑', 12, 2, 'SysRole:update', NULL, 4,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (17, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '后台用户', 1, 1, 'SysUser',
        'ant-design:user-outlined', 3, 1, '/sys/SysUser/index', '');
INSERT INTO "sys_menu"
VALUES (18, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '查询', 17, 2, 'SysUser:retrieve', NULL, 1,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (19, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '新增', 17, 2, 'SysUser:create', NULL, 2,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (20, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '删除', 17, 2, 'SysUser:delete', NULL, 3,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (21, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '编辑', 17, 2, 'SysUser:update', NULL, 4,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (22, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '菜单管理', 1, 1, 'SysMenu',
        'ant-design:align-left-outlined', 4, 1, '/sys/SysMenu/index', '');
INSERT INTO "sys_menu"
VALUES (23, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '查询', 22, 2, 'SysMenu:retrieve', NULL, 1,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (24, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '新增', 22, 2, 'SysMenu:create', NULL, 2,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (25, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '删除', 22, 2, 'SysMenu:delete', NULL, 3,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (26, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '编辑', 22, 2, 'SysMenu:update', NULL, 4,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (27, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '参数管理', 1, 1, 'SysParam',
        'ant-design:ant-design-outlined', 5, 1, '/sys/SysParam/index', '');
INSERT INTO "sys_menu"
VALUES (28, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '查询', 27, 2, 'SysParam:retrieve', NULL,
        1, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (29, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '新增', 27, 2, 'SysParam:create', NULL, 2,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (30, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '删除', 27, 2, 'SysParam:delete', NULL, 3,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (31, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '编辑', 27, 2, 'SysParam:update', NULL, 4,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (32, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '租户管理', 1, 1, 'SysTenant',
        'ant-design:aliyun-outlined', 6, 1, '/sys/SysTenant/index', '');
INSERT INTO "sys_menu"
VALUES (33, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '查询', 32, 2, 'SysTenant:retrieve', NULL,
        1, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (34, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '新增', 32, 2, 'SysTenant:create', NULL, 2,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (35, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '删除', 32, 2, 'SysTenant:delete', NULL, 3,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (36, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '编辑', 32, 2, 'SysTenant:update', NULL, 4,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (37, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '数据字典', 1, 1, 'SysDataDict',
        'ant-design:field-string-outlined', 7, 1, '/sys/SysDataDict/index', '');
INSERT INTO "sys_menu"
VALUES (38, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '查询', 37, 2, 'SysDataDict:retrieve',
        NULL, 1, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (39, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '新增', 37, 2, 'SysDataDict:create', NULL,
        2, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (40, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '删除', 37, 2, 'SysDataDict:delete', NULL,
        3, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (41, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '编辑', 37, 2, 'SysDataDict:update', NULL,
        4, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (42, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '系统日志', 1, 1, 'SysLog',
        'ant-design:edit-twotone', 8, 1, '/sys/SysLog/index', '');
INSERT INTO "sys_menu"
VALUES (43, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '查询', 42, 2, 'SysLog:retrieve', NULL, 1,
        1, NULL, '');
INSERT INTO "sys_menu"
VALUES (44, 0, 1, 0, '2021-07-17 23:37:26', 'admin', '2021-07-17 23:38:28', 'admin', '修改当前用户密码', 1, 1, '',
        'ant-design:compass-outlined', 9, 1, '/sys/SysUser/change-password/index', '');
INSERT INTO "sys_menu"
VALUES (45, 0, 1, 0, '2021-07-17 23:39:41', 'admin', '2021-07-17 23:39:41', 'admin', '重置某用户密码', 17, 2,
        'SysUser:resetPassword', 'ant-design:redo-outlined', 5, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (46, 0, 1, 0, '2021-07-17 23:40:26', 'admin', '2021-07-17 23:40:26', 'admin', '绑定用户与角色关联关系', 17, 2,
        'SysUser:bindRoles', 'ant-design:share-alt-outlined', 6, 1, NULL, '');
INSERT INTO "sys_menu"
VALUES (47, 0, 1, 0, '2021-07-17 23:40:47', 'admin', '2021-07-17 23:41:15', 'admin', '踢某用户下线', 17, 2, 'SysUser:kickOut',
        'ant-design:disconnect-outlined', 7, 1, 'LAYOUT', '');
INSERT INTO "sys_menu"
VALUES (48, 0, 1, 0, '2022-06-29 17:35:26', 'admin', '2022-06-29 17:35:26', 'admin', '绑定角色与菜单关联关系', 12, 2, 'SysRole:bindMenus',
        'ant-design:share-alt-outlined', 5, 1, NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS "sys_param";
CREATE TABLE "sys_param"
(
    "id"          int8         NOT NULL,
    "tenant_id"   int8,
    "revision"    int8         NOT NULL DEFAULT 1,
    "del_flag"    int2         NOT NULL DEFAULT 0,
    "created_at"  timestamp(6) NOT NULL,
    "created_by"  varchar(255),
    "updated_at"  timestamp(6) NOT NULL,
    "updated_by"  varchar(255),
    "name"        varchar(50)  NOT NULL,
    "value"       varchar(255) NOT NULL,
    "description" varchar(255) NOT NULL
)
;
COMMENT
ON COLUMN "sys_param"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_param"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_param"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_param"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_param"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_param"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_param"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_param"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_param"."name" IS '键名';
COMMENT
ON COLUMN "sys_param"."value" IS '键值';
COMMENT
ON COLUMN "sys_param"."description" IS '描述';
COMMENT
ON TABLE "sys_param" IS '系统参数';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "sys_role";
CREATE TABLE "sys_role"
(
    "id"         int8         NOT NULL,
    "tenant_id"  int8,
    "revision"   int8         NOT NULL DEFAULT 1,
    "del_flag"   int2         NOT NULL DEFAULT 0,
    "created_at" timestamp(6) NOT NULL,
    "created_by" varchar(255),
    "updated_at" timestamp(6) NOT NULL,
    "updated_by" varchar(255),
    "title"      varchar(50)  NOT NULL,
    "value"      varchar(100) NOT NULL
)
;
COMMENT
ON COLUMN "sys_role"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_role"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_role"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_role"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_role"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_role"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_role"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_role"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_role"."title" IS '名称';
COMMENT
ON COLUMN "sys_role"."value" IS '值';
COMMENT
ON TABLE "sys_role" IS '后台角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO "sys_role"
VALUES (1, 0, 1, 0, '2021-04-17 02:34:30', NULL, '2021-06-07 16:22:28', 'admin', '超级管理员(代码中固定拥有所有菜单的权限)', 'SuperAdmin');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS "sys_role_menu_relation";
CREATE TABLE "sys_role_menu_relation"
(
    "id"         int8         NOT NULL,
    "tenant_id"  int8,
    "revision"   int8         NOT NULL DEFAULT 1,
    "del_flag"   int2         NOT NULL DEFAULT 0,
    "created_at" timestamp(6) NOT NULL,
    "created_by" varchar(255),
    "updated_at" timestamp(6) NOT NULL,
    "updated_by" varchar(255),
    "role_id"    int8         NOT NULL,
    "menu_id"    int8         NOT NULL
)
;
COMMENT
ON COLUMN "sys_role_menu_relation"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_role_menu_relation"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_role_menu_relation"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_role_menu_relation"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_role_menu_relation"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_role_menu_relation"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_role_menu_relation"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_role_menu_relation"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_role_menu_relation"."role_id" IS '角色ID';
COMMENT
ON COLUMN "sys_role_menu_relation"."menu_id" IS '菜单ID';
COMMENT
ON TABLE "sys_role_menu_relation" IS '后台角色-可见菜单关联';

-- ----------------------------
-- Records of sys_role_menu_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS "sys_tenant";
CREATE TABLE "sys_tenant"
(
    "id"                   int8         NOT NULL,
    "revision"             int8         NOT NULL DEFAULT 1,
    "del_flag"             int2         NOT NULL DEFAULT 0,
    "created_at"           timestamp(6) NOT NULL,
    "created_by"           varchar(255),
    "updated_at"           timestamp(6) NOT NULL,
    "updated_by"           varchar(255),
    "remark"               varchar(255),
    "tenant_name"          varchar(50)  NOT NULL,
    "tenant_id"            int8,
    "status"               int4         NOT NULL,
    "tenant_admin_user_id" int8
)
;
COMMENT
ON COLUMN "sys_tenant"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_tenant"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_tenant"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_tenant"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_tenant"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_tenant"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_tenant"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_tenant"."remark" IS '备注';
COMMENT
ON COLUMN "sys_tenant"."tenant_name" IS '租户名';
COMMENT
ON COLUMN "sys_tenant"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_tenant"."status" IS '状态(0=禁用 1=启用)';
COMMENT
ON COLUMN "sys_tenant"."tenant_admin_user_id" IS '租户管理员用户ID';
COMMENT
ON TABLE "sys_tenant" IS '系统租户';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
BEGIN;
INSERT INTO "sys_tenant"
VALUES (1, 1, 0, '2021-05-11 16:06:47', '', '2021-06-10 16:29:32', 'admin', '可无视SQL拦截器', '超级租户', 0, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "sys_user";
CREATE TABLE "sys_user"
(
    "id"            int8         NOT NULL,
    "tenant_id"     int8,
    "revision"      int8         NOT NULL DEFAULT 1,
    "del_flag"      int2         NOT NULL DEFAULT 0,
    "created_at"    timestamp(6) NOT NULL,
    "created_by"    varchar(255),
    "updated_at"    timestamp(6) NOT NULL,
    "updated_by"    varchar(255),
    "pin"           varchar(20)  NOT NULL,
    "pwd"           varchar(255) NOT NULL,
    "salt"          varchar(64)  NOT NULL,
    "nickname"      varchar(20)  NOT NULL,
    "status"        int4         NOT NULL,
    "gender"        int4,
    "email"         varchar(255),
    "phone_no"      varchar(20),
    "last_login_at" timestamp(6)
)
;
COMMENT
ON COLUMN "sys_user"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_user"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_user"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_user"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_user"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_user"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_user"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_user"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_user"."pin" IS '账号';
COMMENT
ON COLUMN "sys_user"."pwd" IS '密码';
COMMENT
ON COLUMN "sys_user"."salt" IS '盐';
COMMENT
ON COLUMN "sys_user"."nickname" IS '昵称';
COMMENT
ON COLUMN "sys_user"."status" IS '状态(0=禁用 1=启用)';
COMMENT
ON COLUMN "sys_user"."gender" IS '性别';
COMMENT
ON COLUMN "sys_user"."email" IS '邮箱';
COMMENT
ON COLUMN "sys_user"."phone_no" IS '手机号';
COMMENT
ON COLUMN "sys_user"."last_login_at" IS '最后登录时刻';
COMMENT
ON TABLE "sys_user" IS '后台用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO "sys_user"
VALUES (1, 0, 1, 0, '2021-04-06 09:56:02', NULL, '2021-06-28 16:37:07', 'admin', 'admin',
        'b7f6692251833658a56ff2d09e9835b91384d203721bf27a544586d3c9a379ff', '6a8e9339-dfd1-4cfe-80cb-30ca9fc3d81e',
        '超级管理员', 1, 0, 'admin@example.com', '17874585544', '2021-07-18 00:32:08');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS "sys_user_dept_relation";
CREATE TABLE "sys_user_dept_relation"
(
    "id"         int8         NOT NULL,
    "tenant_id"  int8,
    "revision"   int8         NOT NULL DEFAULT 1,
    "del_flag"   int2         NOT NULL DEFAULT 0,
    "created_at" timestamp(6) NOT NULL,
    "created_by" varchar(255),
    "updated_at" timestamp(6) NOT NULL,
    "updated_by" varchar(255),
    "user_id"    int8         NOT NULL,
    "dept_id"    int8         NOT NULL
)
;
COMMENT
ON COLUMN "sys_user_dept_relation"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_user_dept_relation"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_user_dept_relation"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_user_dept_relation"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_user_dept_relation"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_user_dept_relation"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_user_dept_relation"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_user_dept_relation"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_user_dept_relation"."user_id" IS '用户ID';
COMMENT
ON COLUMN "sys_user_dept_relation"."dept_id" IS '部门ID';
COMMENT
ON TABLE "sys_user_dept_relation" IS '后台用户-部门关联';

-- ----------------------------
-- Records of sys_user_dept_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS "sys_user_role_relation";
CREATE TABLE "sys_user_role_relation"
(
    "id"         int8         NOT NULL,
    "tenant_id"  int8,
    "revision"   int8         NOT NULL DEFAULT 1,
    "del_flag"   int2         NOT NULL DEFAULT 0,
    "created_at" timestamp(6) NOT NULL,
    "created_by" varchar(255),
    "updated_at" timestamp(6) NOT NULL,
    "updated_by" varchar(255),
    "user_id"    int8         NOT NULL,
    "role_id"    int8         NOT NULL
)
;
COMMENT
ON COLUMN "sys_user_role_relation"."id" IS '主键ID';
COMMENT
ON COLUMN "sys_user_role_relation"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "sys_user_role_relation"."revision" IS '乐观锁';
COMMENT
ON COLUMN "sys_user_role_relation"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "sys_user_role_relation"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "sys_user_role_relation"."created_by" IS '创建者';
COMMENT
ON COLUMN "sys_user_role_relation"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "sys_user_role_relation"."updated_by" IS '更新者';
COMMENT
ON COLUMN "sys_user_role_relation"."user_id" IS '用户ID';
COMMENT
ON COLUMN "sys_user_role_relation"."role_id" IS '角色ID';
COMMENT
ON TABLE "sys_user_role_relation" IS '后台用户-角色关联';

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
BEGIN;
INSERT INTO "sys_user_role_relation"
VALUES (1, 0, 1, 0, '2021-01-01 18:22:12', NULL, '2021-01-01 18:22:12', NULL, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for 数据表模板
-- ----------------------------
DROP TABLE IF EXISTS "数据表模板";
CREATE TABLE "数据表模板"
(
    "id"         int8         NOT NULL,
    "tenant_id"  int8,
    "revision"   int8         NOT NULL DEFAULT 1,
    "del_flag"   int2         NOT NULL DEFAULT 0,
    "created_at" timestamp(6) NOT NULL,
    "created_by" varchar(255),
    "updated_at" timestamp(6) NOT NULL,
    "updated_by" varchar(255)
)
;
COMMENT
ON COLUMN "数据表模板"."id" IS '主键ID';
COMMENT
ON COLUMN "数据表模板"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "数据表模板"."revision" IS '乐观锁';
COMMENT
ON COLUMN "数据表模板"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "数据表模板"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "数据表模板"."created_by" IS '创建者';
COMMENT
ON COLUMN "数据表模板"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "数据表模板"."updated_by" IS '更新者';
COMMENT
ON TABLE "数据表模板" IS '数据表注释';

-- ----------------------------
-- Records of 数据表模板
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "sys_dept"
    ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_log
-- ----------------------------
ALTER TABLE "sys_log"
    ADD CONSTRAINT "sys_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "sys_menu"
    ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_param
-- ----------------------------
ALTER TABLE "sys_param"
    ADD CONSTRAINT "sys_param_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "sys_role"
    ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu_relation
-- ----------------------------
ALTER TABLE "sys_role_menu_relation"
    ADD CONSTRAINT "sys_role_menu_relation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_tenant
-- ----------------------------
ALTER TABLE "sys_tenant"
    ADD CONSTRAINT "sys_tenant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "sys_user"
    ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_dept_relation
-- ----------------------------
ALTER TABLE "sys_user_dept_relation"
    ADD CONSTRAINT "sys_user_dept_relation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_role_relation
-- ----------------------------
ALTER TABLE "sys_user_role_relation"
    ADD CONSTRAINT "sys_user_role_relation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table 数据表模板
-- ----------------------------
ALTER TABLE "数据表模板"
    ADD CONSTRAINT "数据表模板_pkey" PRIMARY KEY ("id");


-- v1.7.2 - Uncarbon - 默认内置文件上传功能
-- 建表 oss_file_info
DROP TABLE IF EXISTS "oss_file_info";
CREATE TABLE "oss_file_info"
(
    "id"                int8         NOT NULL,
    "tenant_id"         int8,
    "revision"          int8         NOT NULL DEFAULT 1,
    "del_flag"          int2         NOT NULL DEFAULT 0,
    "created_at"        timestamp(6) NOT NULL,
    "created_by"        varchar(255),
    "updated_at"        timestamp(6) NOT NULL,
    "updated_by"        varchar(255),
    "storage_platform"  varchar(50)  NOT NULL,
    "storage_base_path" varchar(255) NOT NULL,
    "storage_path"      varchar(512) NOT NULL,
    "storage_filename"  varchar(255) NOT NULL,
    "original_filename" varchar(255) NOT NULL,
    "extend_name"       varchar(16)  NOT NULL,
    "file_size"         int8         NOT NULL,
    "md5"               varchar(32)  NOT NULL,
    "classified"        varchar(50),
    "direct_url"        varchar(512)
)
;
COMMENT
ON COLUMN "oss_file_info"."id" IS '主键ID';
COMMENT
ON COLUMN "oss_file_info"."tenant_id" IS '租户ID';
COMMENT
ON COLUMN "oss_file_info"."revision" IS '乐观锁';
COMMENT
ON COLUMN "oss_file_info"."del_flag" IS '逻辑删除标识';
COMMENT
ON COLUMN "oss_file_info"."created_at" IS '创建时刻';
COMMENT
ON COLUMN "oss_file_info"."created_by" IS '创建者';
COMMENT
ON COLUMN "oss_file_info"."updated_at" IS '更新时刻';
COMMENT
ON COLUMN "oss_file_info"."updated_by" IS '更新者';
COMMENT
ON COLUMN "oss_file_info"."storage_platform" IS '存储平台';
COMMENT
ON COLUMN "oss_file_info"."storage_base_path" IS '基础存储路径';
COMMENT
ON COLUMN "oss_file_info"."storage_path" IS '存储路径';
COMMENT
ON COLUMN "oss_file_info"."storage_filename" IS '存储文件名';
COMMENT
ON COLUMN "oss_file_info"."original_filename" IS '原始文件名';
COMMENT
ON COLUMN "oss_file_info"."extend_name" IS '扩展名';
COMMENT
ON COLUMN "oss_file_info"."file_size" IS '文件大小';
COMMENT
ON COLUMN "oss_file_info"."md5" IS 'MD5';
COMMENT
ON COLUMN "oss_file_info"."classified" IS '文件类别';
COMMENT
ON COLUMN "oss_file_info"."direct_url" IS '对象存储直链';
COMMENT
ON TABLE "oss_file_info" IS '上传文件信息';

-- 主键
ALTER TABLE "oss_file_info"
    ADD CONSTRAINT "oss_file_info_pkey" PRIMARY KEY ("id");


-- v1.7.2 - Uncarbon - 新增上传文件信息管理菜单
INSERT INTO sys_menu (id, tenant_id, revision, del_flag, created_at, created_by, updated_at,
                      updated_by, title, parent_id, type, permission, icon, sort, status, component,
                      external_link)
VALUES (20220922152710, NULL, 1, 0, '2022-12-25 23:09:30', 'admin', '2022-12-26 22:02:31', 'admin', '文件管理', 0, 0,
        'Oss', 'ant-design:file-outlined', 4, 1, NULL, '');
INSERT INTO sys_menu (id, tenant_id, revision, del_flag, created_at, created_by, updated_at,
                      updated_by, title, parent_id, type, permission, icon, sort, status, component,
                      external_link)
VALUES (20220922152714, NULL, 1, 0, '2022-09-22 15:27:14', 'helio-generator', '2022-12-26 22:03:14', 'admin',
        '上传文件信息管理', 20220922152710, 1, 'OssFileInfo', 'ant-design:save-twotone', 1, 1, '/oss/OssFileInfo/index',
        '');
INSERT INTO sys_menu (id, tenant_id, revision, del_flag, created_at, created_by, updated_at,
                      updated_by, title, parent_id, type, permission, icon, sort, status, component,
                      external_link)
VALUES (20220922152715, NULL, 1, 0, '2022-09-22 15:27:14', 'helio-generator', '2022-12-26 22:01:58', 'admin', '查询',
        20220922152714, 2, 'OssFileInfo:retrieve', NULL, 1, 1, NULL, '');
INSERT INTO sys_menu (id, tenant_id, revision, del_flag, created_at, created_by, updated_at,
                      updated_by, title, parent_id, type, permission, icon, sort, status, component,
                      external_link)
VALUES (20220922152718, NULL, 1, 0, '2022-09-22 15:27:14', 'helio-generator', '2022-12-26 22:02:09', 'admin', '删除',
        20220922152714, 2, 'OssFileInfo:delete', NULL, 2, 1, NULL, '');

-- v1.8.0 - Uncarbon - 新增错误原因堆栈、用户UA、IP属地字段；表注释更新
ALTER TABLE sys_log
    ADD COLUMN error_stacktrace varchar(3000) NOT NULL DEFAULT '',
    ADD COLUMN user_agent varchar(255) NOT NULL DEFAULT '',
    ADD COLUMN ip_location_region_name varchar(100) NOT NULL DEFAULT '',
    ADD COLUMN ip_location_province_name varchar(100) NOT NULL DEFAULT '',
    ADD COLUMN ip_location_city_name varchar(100) NOT NULL DEFAULT '',
    ADD COLUMN ip_location_district_name varchar(100) NOT NULL DEFAULT '';

COMMENT ON COLUMN sys_log.error_stacktrace IS '错误原因堆栈';
COMMENT ON COLUMN sys_log.user_agent IS '用户UA';
COMMENT ON COLUMN sys_log.ip_location_region_name IS 'IP地址属地-国家或地区名';
COMMENT ON COLUMN sys_log.ip_location_province_name IS 'IP地址属地-省级行政区名';
COMMENT ON COLUMN sys_log.ip_location_city_name IS 'IP地址属地-市级行政区名';
COMMENT ON COLUMN sys_log.ip_location_district_name IS 'IP地址属地-县级行政区名';

COMMENT ON TABLE sys_log IS '系统日志';

-- v1.8.0 - Uncarbon - 订正系统菜单-权限串缺少默认值问题
ALTER TABLE "sys_menu"
    ALTER COLUMN "permission" SET DEFAULT '';
