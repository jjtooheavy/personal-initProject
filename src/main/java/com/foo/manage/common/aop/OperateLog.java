package com.foo.manage.common.aop;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 操作日志
 * @author changzhongq
 * @time 2018年6月22日 下午4:37:04
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OperateLog {

	/** 要执行的操作类型 **/
	public String operationType() default "";

	/** 要执行的具体操作 **/
	public String operationName() default "";
}
