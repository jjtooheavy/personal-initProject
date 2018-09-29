package com.foo.manage.common.utils;

/**
 * 常量设置
 * @author changzhongq
 * @time 2018年6月22日 下午6:29:18
 */
public class Constants {

	public static final String OPERATE_TYPE_GET = "1";// 查询
	public static final String OPERATE_TYPE_INSERT = "2";// 新增
	public static final String OPERATE_TYPE_UPDATE = "3";// 更新
	public static final String OPERATE_TYPE_DELETE = "4";// 删除
	public static final String OPERATE_TYPE_SAVE = "5";// 保存（新增或更新）
	public static final String OPERATE_TYPE_IMPORT = "6";// 导入
	
	public static final String SUBJECT_ALGORITHM_NAME_MD5 = "MD5";// 加密算法
	public static final int SUBJECT_HASHTERATIONS = 1024;// 加密次数
	
	public static final String SHIRO_REDIS_NAME = "shiro_redis";
	
	public static final String CURRENT_USER_SIGN = "currentUser";// 当前登录人标识
	
	public static final String DEFAULT_USER_LOGIN_PASSWORD = "111111";// 默认的用户登录密码
}
