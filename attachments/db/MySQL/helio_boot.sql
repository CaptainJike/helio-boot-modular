SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 数据表模板
-- ----------------------------
DROP TABLE IF EXISTS `数据表模板`;
CREATE TABLE `数据表模板`
(
    `id`         bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`   bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`   tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at` datetime NOT NULL COMMENT '创建时刻',
    `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at` datetime NOT NULL COMMENT '更新时刻',
    `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据表注释';

-- ----------------------------
-- Records of 数据表模板
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_data_dict_classified & sys_data_dict_item
-- ----------------------------
CREATE TABLE `sys_data_dict_classified`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `revision` bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `del_flag` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
  `created_at` datetime NOT NULL COMMENT '创建时刻',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updated_at` datetime NOT NULL COMMENT '更新时刻',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典分类' ROW_FORMAT = Dynamic;

CREATE TABLE `sys_data_dict_item`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `revision` bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `del_flag` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
  `created_at` datetime NOT NULL COMMENT '创建时刻',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updated_at` datetime NOT NULL COMMENT '更新时刻',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `classified_id` bigint(20) NOT NULL COMMENT '所属分类ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项编码',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项标签',
  `value` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项值',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `id`         bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`   bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`   tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at` datetime                                                     NOT NULL COMMENT '创建时刻',
    `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at` datetime                                                     NOT NULL COMMENT '更新时刻',
    `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `title`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
    `parent_id`  bigint(20) NOT NULL DEFAULT 0 COMMENT '上级ID(根节点设置为0)',
    `sort`       int(11) NOT NULL DEFAULT 1 COMMENT '排序',
    `status`     int(11) NOT NULL DEFAULT 0 COMMENT '状态(0=禁用 1=启用)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`
(
    `id`         bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`   bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`   tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at` datetime NOT NULL COMMENT '创建时刻',
    `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at` datetime NOT NULL COMMENT '更新时刻',
    `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `user_id`    bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
    `username`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
    `operation`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作内容',
    `method`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
    `params`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
    `ip`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
    `status`     int(11) NOT NULL DEFAULT 0 COMMENT '状态(参考SysLogStatusEnum)',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台操作日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`            bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`     bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`      bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`      tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at`    datetime                                                      NOT NULL COMMENT '创建时刻',
    `created_by`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at`    datetime                                                      NOT NULL COMMENT '更新时刻',
    `updated_by`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `title`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '名称',
    `parent_id`     bigint(20) NOT NULL DEFAULT 0 COMMENT '上级菜单ID(根节点设置为0)',
    `type`          int(11) NOT NULL DEFAULT 1 COMMENT '菜单类型(参考MenuTypeEnum)',
    `permission`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限标识',
    `icon`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
    `sort`          int(11) NULL DEFAULT 1 COMMENT '排序',
    `status`        int(11) NOT NULL DEFAULT 0 COMMENT '状态(0=禁用 1=启用)',
    `component`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件',
    `external_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '外链地址',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu`
VALUES (1, 0, 1, 0, '2021-06-01 17:16:48', NULL, '2021-06-02 17:14:16', NULL, '系统管理', 0, 0, 'Sys',
        'ant-design:setting-outlined', 3, 1, 'LAYOUT', ''),
       (2, 0, 1, 0, '2021-06-01 17:13:13', NULL, '2021-07-18 00:10:33', 'admin', '中控台', 0, 0, 'Dashboard',
        'ant-design:appstore-outlined', 1, 1, 'LAYOUT', ''),
       (3, 0, 1, 0, '2021-06-01 17:14:22', NULL, '2021-06-02 11:24:38', NULL, '分析页(后台登录后默认首页)', 2, 1,
        'Dashboard:analysis', 'ant-design:fund-outlined', 1, 1, '/dashboard/analysis/index', ''),
       (4, 0, 1, 0, '2021-06-01 17:14:47', NULL, '2021-06-02 11:32:23', NULL, '工作台', 2, 1, 'Dashboard:workbench',
        'ant-design:database-outlined', 2, 1, '/dashboard/workbench/index', ''),
       (5, 0, 1, 0, '2021-06-01 17:15:38', NULL, '2021-07-15 23:56:43', 'admin', '关于', 0, 1, 'About',
        'ant-design:eye-outlined', 2, 1, '/sys/about/index', ''),
       (6, 0, 1, 0, '2021-06-02 16:06:58', NULL, '2021-07-17 23:55:52', 'admin', '学(mo)习(yu)', 2, 3, '',
        'ant-design:zhihu-outlined', 3, 1, 'https://www.zhihu.com/', 'https://www.zhihu.com/'),
       (7, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '部门管理', 1, 1, 'SysDept',
        'ant-design:flag-outlined', 1, 1, '/sys/SysDept/index', ''),
       (8, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '查询', 7, 2, 'SysDept:retrieve', NULL, 1,
        1, NULL, ''),
       (9, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '新增', 7, 2, 'SysDept:create', NULL, 2, 1,
        NULL, ''),
       (10, 0, 1, 0, '2021-07-17 23:32:15', NULL, '2021-07-17 23:32:15', NULL, '删除', 7, 2, 'SysDept:delete', NULL, 3, 1,
        NULL, ''),
       (11, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '编辑', 7, 2, 'SysDept:update', NULL, 4, 1,
        NULL, ''),
       (12, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '角色管理', 1, 1, 'SysRole',
        'ant-design:usergroup-add-outlined', 2, 1, '/sys/SysRole/index', ''),
       (13, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '查询', 12, 2, 'SysRole:retrieve', NULL, 1,
        1, NULL, ''),
       (14, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '新增', 12, 2, 'SysRole:create', NULL, 2,
        1, NULL, ''),
       (15, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '删除', 12, 2, 'SysRole:delete', NULL, 3,
        1, NULL, ''),
       (16, 0, 1, 0, '2021-07-17 23:32:16', NULL, '2021-07-17 23:32:16', NULL, '编辑', 12, 2, 'SysRole:update', NULL, 4,
        1, NULL, ''),
       (17, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '后台用户', 1, 1, 'SysUser',
        'ant-design:user-outlined', 3, 1, '/sys/SysUser/index', ''),
       (18, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '查询', 17, 2, 'SysUser:retrieve', NULL, 1,
        1, NULL, ''),
       (19, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '新增', 17, 2, 'SysUser:create', NULL, 2,
        1, NULL, ''),
       (20, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '删除', 17, 2, 'SysUser:delete', NULL, 3,
        1, NULL, ''),
       (21, 0, 1, 0, '2021-07-17 23:32:17', NULL, '2021-07-17 23:32:17', NULL, '编辑', 17, 2, 'SysUser:update', NULL, 4,
        1, NULL, ''),
       (22, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '菜单管理', 1, 1, 'SysMenu',
        'ant-design:align-left-outlined', 4, 1, '/sys/SysMenu/index', ''),
       (23, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '查询', 22, 2, 'SysMenu:retrieve', NULL, 1,
        1, NULL, ''),
       (24, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '新增', 22, 2, 'SysMenu:create', NULL, 2,
        1, NULL, ''),
       (25, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '删除', 22, 2, 'SysMenu:delete', NULL, 3,
        1, NULL, ''),
       (26, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '编辑', 22, 2, 'SysMenu:update', NULL, 4,
        1, NULL, ''),
       (27, 0, 1, 0, '2021-07-17 23:32:18', NULL, '2021-07-17 23:32:18', NULL, '参数管理', 1, 1, 'SysParam',
        'ant-design:ant-design-outlined', 5, 1, '/sys/SysParam/index', ''),
       (28, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '查询', 27, 2, 'SysParam:retrieve', NULL,
        1, 1, NULL, ''),
       (29, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '新增', 27, 2, 'SysParam:create', NULL, 2,
        1, NULL, ''),
       (30, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '删除', 27, 2, 'SysParam:delete', NULL, 3,
        1, NULL, ''),
       (31, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '编辑', 27, 2, 'SysParam:update', NULL, 4,
        1, NULL, ''),
       (32, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '租户管理', 1, 1, 'SysTenant',
        'ant-design:aliyun-outlined', 6, 1, '/sys/SysTenant/index', ''),
       (33, 0, 1, 0, '2021-07-17 23:32:19', NULL, '2021-07-17 23:32:19', NULL, '查询', 32, 2, 'SysTenant:retrieve', NULL,
        1, 1, NULL, ''),
       (34, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '新增', 32, 2, 'SysTenant:create', NULL, 2,
        1, NULL, ''),
       (35, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '删除', 32, 2, 'SysTenant:delete', NULL, 3,
        1, NULL, ''),
       (36, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '编辑', 32, 2, 'SysTenant:update', NULL, 4,
        1, NULL, ''),
       (37, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '数据字典', 1, 1, 'SysDataDict',
        'ant-design:field-string-outlined', 7, 1, '/sys/SysDataDict/index', ''),
       (38, 0, 1, 0, '2021-07-17 23:32:20', NULL, '2021-07-17 23:32:20', NULL, '查询', 37, 2, 'SysDataDict:retrieve',
        NULL, 1, 1, NULL, ''),
       (39, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '新增', 37, 2, 'SysDataDict:create', NULL,
        2, 1, NULL, ''),
       (40, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '删除', 37, 2, 'SysDataDict:delete', NULL,
        3, 1, NULL, ''),
       (41, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '编辑', 37, 2, 'SysDataDict:update', NULL,
        4, 1, NULL, ''),
       (42, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '系统日志', 1, 1, 'SysLog',
        'ant-design:edit-twotone', 8, 1, '/sys/SysLog/index', ''),
       (43, 0, 1, 0, '2021-07-17 23:32:21', NULL, '2021-07-17 23:32:21', NULL, '查询', 42, 2, 'SysLog:retrieve', NULL, 1,
        1, NULL, ''),
       (44, 0, 1, 0, '2021-07-17 23:37:26', 'admin', '2021-07-17 23:38:28', 'admin', '修改当前用户密码', 1, 1, '',
        'ant-design:compass-outlined', 9, 1, '/sys/SysUser/change-password/index', ''),
       (45, 0, 1, 0, '2021-07-17 23:39:41', 'admin', '2021-07-17 23:39:41', 'admin', '重置某用户密码', 17, 2,
        'SysUser:resetPassword', 'ant-design:redo-outlined', 5, 1, NULL, ''),
       (46, 0, 1, 0, '2021-07-17 23:40:26', 'admin', '2021-07-17 23:40:26', 'admin', '绑定用户与角色关联关系', 17, 2,
        'SysUser:bindRoles', 'ant-design:share-alt-outlined', 6, 1, NULL, ''),
       (47, 0, 1, 0, '2021-07-17 23:40:47', 'admin', '2021-07-17 23:41:15', 'admin', '踢某用户下线', 17, 2, 'SysUser:kickOut',
        'ant-design:disconnect-outlined', 7, 1, 'LAYOUT', ''),
       (48, 0, 1, 0, '2022-06-29 17:35:26', 'admin', '2022-06-29 17:35:26', 'admin', '绑定角色与菜单关联关系', 12, 2, 'SysRole:bindMenus',
        'ant-design:share-alt-outlined', 5, 1, NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param`
(
    `id`          bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`   bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`    bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`    tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at`  datetime                                                      NOT NULL COMMENT '创建时刻',
    `created_by`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at`  datetime                                                      NOT NULL COMMENT '更新时刻',
    `updated_by`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '键名',
    `value`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键值',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`         bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`   bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`   tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at` datetime                                                      NOT NULL COMMENT '创建时刻',
    `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at` datetime                                                      NOT NULL COMMENT '更新时刻',
    `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `title`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '名称',
    `value`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role`
VALUES (1, 0, 1, 0, '2021-04-17 02:34:30', NULL, '2021-06-07 16:22:28', 'admin', '超级管理员(代码中固定拥有所有菜单的权限)', 'SuperAdmin');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_relation`;
CREATE TABLE `sys_role_menu_relation`
(
    `id`         bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`   bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`   tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at` datetime NOT NULL COMMENT '创建时刻',
    `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at` datetime NOT NULL COMMENT '更新时刻',
    `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `role_id`    bigint(20) NOT NULL COMMENT '角色ID',
    `menu_id`    bigint(20) NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台角色-可见菜单关联';

-- ----------------------------
-- Records of sys_role_menu_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`
(
    `id`                   bigint(20) NOT NULL COMMENT '主键ID',
    `revision`             bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`             tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at`           datetime                                                     NOT NULL COMMENT '创建时刻',
    `created_by`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at`           datetime                                                     NOT NULL COMMENT '更新时刻',
    `updated_by`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `remark`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `tenant_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户名',
    `tenant_id`            bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `status`               int(11) NOT NULL DEFAULT 0 COMMENT '状态(0=禁用 1=启用)',
    `tenant_admin_user_id` bigint(20) NULL DEFAULT NULL COMMENT '租户管理员用户ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统租户';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
BEGIN;
INSERT INTO `sys_tenant`
VALUES (1, 1, 0, '2021-05-11 16:06:47', '', '2021-06-10 16:29:32', 'admin', '可无视SQL拦截器', '超级租户', 0, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`            bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`     bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`      bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`      tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at`    datetime                                                      NOT NULL COMMENT '创建时刻',
    `created_by`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at`    datetime                                                      NOT NULL COMMENT '更新时刻',
    `updated_by`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `pin`           varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '账号',
    `pwd`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `salt`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '盐',
    `nickname`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '昵称',
    `status`        int(11) NOT NULL DEFAULT 0 COMMENT '状态(0=禁用 1=启用)',
    `gender`        int(11) NULL DEFAULT 0 COMMENT '性别',
    `email`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱',
    `phone_no`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
    `last_login_at` datetime NULL DEFAULT NULL COMMENT '最后登录时刻',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user`
VALUES (1, 0, 1, 0, '2021-04-06 09:56:02', NULL, '2021-06-28 16:37:07', 'admin', 'admin',
        'b7f6692251833658a56ff2d09e9835b91384d203721bf27a544586d3c9a379ff', '6a8e9339-dfd1-4cfe-80cb-30ca9fc3d81e',
        '超级管理员', 1, 0, 'admin@example.com', '17874585544', '2021-07-18 00:32:08');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept_relation`;
CREATE TABLE `sys_user_dept_relation`
(
    `id`         bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`   bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`   tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at` datetime NOT NULL COMMENT '创建时刻',
    `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at` datetime NOT NULL COMMENT '更新时刻',
    `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `user_id`    bigint(20) NOT NULL COMMENT '用户ID',
    `dept_id`    bigint(20) NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台用户-部门关联';

-- ----------------------------
-- Records of sys_user_dept_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_relation`;
CREATE TABLE `sys_user_role_relation`
(
    `id`         bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`  bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`   bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`   tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at` datetime NOT NULL COMMENT '创建时刻',
    `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at` datetime NOT NULL COMMENT '更新时刻',
    `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `user_id`    bigint(20) NOT NULL COMMENT '用户ID',
    `role_id`    bigint(20) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台用户-角色关联';

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role_relation`
VALUES (1, 0, 1, 0, '2021-01-01 18:22:12', NULL, '2021-01-01 18:22:12', NULL, 1, 1);
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;


-- v1.7.2 - Uncarbon - 默认内置文件上传功能
-- 建表 oss_file_info
DROP TABLE IF EXISTS `oss_file_info`;
CREATE TABLE `oss_file_info`
(
    `id`                bigint(20) NOT NULL COMMENT '主键ID',
    `tenant_id`         bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
    `revision`          bigint(20) NOT NULL DEFAULT 1 COMMENT '乐观锁',
    `del_flag`          tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
    `created_at`        datetime(0) NOT NULL COMMENT '创建时刻',
    `created_by`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
    `updated_at`        datetime(0) NOT NULL COMMENT '更新时刻',
    `updated_by`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
    `storage_platform`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '存储平台',
    `storage_base_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '基础存储路径',
    `storage_path`      varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储路径',
    `storage_filename`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储文件名',
    `original_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始文件名',
    `extend_name`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '扩展名',
    `file_size`         bigint(20) NOT NULL COMMENT '文件大小',
    `md5`               varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT 'MD5',
    `classified`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类别',
    `direct_url`        varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对象存储直链',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上传文件信息' ROW_FORMAT = Dynamic;

-- v1.7.2 - Uncarbon - 新增上传文件信息后台管理菜单
INSERT INTO `sys_menu` (`id`, `tenant_id`, `revision`, `del_flag`, `created_at`, `created_by`, `updated_at`,
                        `updated_by`, `title`, `parent_id`, `type`, `permission`, `icon`, `sort`, `status`, `component`,
                        `external_link`)
VALUES (20220922152710, NULL, 1, 0, '2022-12-25 23:09:30', 'admin', '2022-12-26 22:02:31', 'admin', '文件管理', 0, 0,
        'Oss', 'ant-design:file-outlined', 4, 1, NULL, '');
INSERT INTO `sys_menu` (`id`, `tenant_id`, `revision`, `del_flag`, `created_at`, `created_by`, `updated_at`,
                        `updated_by`, `title`, `parent_id`, `type`, `permission`, `icon`, `sort`, `status`, `component`,
                        `external_link`)
VALUES (20220922152714, NULL, 1, 0, '2022-09-22 15:27:14', 'helio-generator', '2022-12-26 22:03:14', 'admin',
        '上传文件信息管理', 20220922152710, 1, 'OssFileInfo', 'ant-design:save-twotone', 1, 1, '/oss/OssFileInfo/index',
        '');
INSERT INTO `sys_menu` (`id`, `tenant_id`, `revision`, `del_flag`, `created_at`, `created_by`, `updated_at`,
                        `updated_by`, `title`, `parent_id`, `type`, `permission`, `icon`, `sort`, `status`, `component`,
                        `external_link`)
VALUES (20220922152715, NULL, 1, 0, '2022-09-22 15:27:14', 'helio-generator', '2022-12-26 22:01:58', 'admin', '查询',
        20220922152714, 2, 'OssFileInfo:retrieve', NULL, 1, 1, NULL, '');
INSERT INTO `sys_menu` (`id`, `tenant_id`, `revision`, `del_flag`, `created_at`, `created_by`, `updated_at`,
                        `updated_by`, `title`, `parent_id`, `type`, `permission`, `icon`, `sort`, `status`, `component`,
                        `external_link`)
VALUES (20220922152718, NULL, 1, 0, '2022-09-22 15:27:14', 'helio-generator', '2022-12-26 22:02:09', 'admin', '删除',
        20220922152714, 2, 'OssFileInfo:delete', NULL, 2, 1, NULL, '');

-- v1.8.0 - Uncarbon - 新增错误原因堆栈、用户UA、IP属地字段；表注释更新
ALTER TABLE sys_log
    ADD COLUMN error_stacktrace varchar(3000) NOT NULL DEFAULT '' COMMENT '错误原因堆栈' AFTER status,
    ADD COLUMN user_agent varchar(255) NOT NULL DEFAULT '' COMMENT '用户UA' AFTER error_stacktrace,
    ADD COLUMN ip_location_region_name varchar(100) NOT NULL DEFAULT '' COMMENT 'IP地址属地-国家或地区名' AFTER user_agent,
    ADD COLUMN ip_location_province_name varchar(100) NOT NULL DEFAULT '' COMMENT 'IP地址属地-省级行政区名' AFTER ip_location_region_name,
    ADD COLUMN ip_location_city_name varchar(100) NOT NULL DEFAULT '' COMMENT 'IP地址属地-市级行政区名' AFTER ip_location_province_name,
    ADD COLUMN ip_location_district_name varchar(100) NOT NULL DEFAULT '' COMMENT 'IP地址属地-县级行政区名' AFTER ip_location_city_name;
ALTER TABLE sys_log COMMENT = '系统日志';
