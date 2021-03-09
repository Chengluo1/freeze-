package cn.edu.zjut.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface check {
    /**
     * �Ƿ�ǿ�
     */
    public boolean notNull() default false;

    /**
     * �Ƿ�Ϊ��ֵ
     */
    public boolean numeric() default false;

    /**
     * ��󳤶�
     */
    public int maxLen() default -1;

    /**
     * ��С����
     */
    public int minLen() default -1;

    /**
     * ��С��ֵ
     */
    public long minNum() default -999999;
}
