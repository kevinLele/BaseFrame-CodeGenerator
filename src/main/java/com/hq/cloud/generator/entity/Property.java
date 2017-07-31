package com.hq.cloud.generator.entity;

import com.hq.cloud.generator.utils.DBUtil;
import com.hq.cloud.generator.utils.StringUtil;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2015/9/13 0013.
 */
public class Property {

    /**
     * JAVA中的字段类型
     */
    private String javaType;

    /**
     * 类的全名称
     */
    private String fullJavaType;

    /**
     * 属性名称
     */
    private String propertyName;

    /**
     * 字段名称
     */
    private String fieldName;

    /**
     * 字段类型
     */
    private String fieldType;

    /**
     * 字段长度
     */
    private String length;

    /**
     * 字段的注释信息
     */
    private String comment;

    /**
     * 验证属性: 是否允许非空
     */
    private boolean notNull;

    /**
     * 验证属性: 验证的正则表达式
     */
    private String regex;

    /**
     * 验证属性: 验证不通过返回的提示信息
     */
    private String tip;

    private boolean validationField = false;

    /**
     * 是否是父类的属性
     */
    private boolean parentProperty = false;

    public void init() {
        this.propertyName = StringUtil.toUpperCaseAndRemoveUnderLine(fieldName);
        this.javaType = DBUtil.dbType2JavaType(fieldType.toLowerCase());
        this.fullJavaType = DBUtil.dbType2FullJavaType(fieldType.toLowerCase());

        String regex = "(.*)\\|([^`]*?)(`([^`]*?))?(`([^`]*?))?";
        /*String str = "订单ID|true,aa,bb";*/

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(comment);

        if (matcher.matches()) {
            String comment = matcher.group(1);
            Boolean notNull = Boolean.parseBoolean(matcher.group(2));
            String regexStr = matcher.group(4);
            String tip = matcher.group(6);

            /*System.out.println("comment:" + comment);
            System.out.println("notNull:" + notNull);
            System.out.println("regexStr:" + regexStr);
            System.out.println("tip:" + tip);*/

            this.comment = comment;
            this.notNull = notNull;
            this.regex = regexStr == null ? "" : regexStr;
            this.tip = tip == null ? "" : tip;
            this.validationField = true;
        }
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getFieldType() {
        return fieldType;
    }

    public void setFieldType(String fieldType) {
        this.fieldType = fieldType;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getFullJavaType() {
        return fullJavaType;
    }

    public void setFullJavaType(String fullJavaType) {
        this.fullJavaType = fullJavaType;
    }

    public boolean getParentProperty() {
        return parentProperty;
    }

    public void setParentProperty(boolean parentProperty) {
        this.parentProperty = parentProperty;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isNotNull() {
        return notNull;
    }

    public void setNotNull(boolean notNull) {
        this.notNull = notNull;
    }

    public String getRegex() {
        return regex;
    }

    public void setRegex(String regex) {
        this.regex = regex;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public boolean isParentProperty() {
        return parentProperty;
    }

    public boolean isValidationField() {
        return validationField;
    }

    public void setValidationField(boolean validationField) {
        this.validationField = validationField;
    }
}
