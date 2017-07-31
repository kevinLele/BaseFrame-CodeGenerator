package com.hq.cloud.generator.entity;

import java.util.List;

/**
 * Created by Administrator on 7/2/2017.
 */
public class RelationFields {

    private String table;

    private String shortName;

    private String classType;

    private boolean isRelationTable = false;

    private String alias;

    private String joinType;

    private List<RelationField> fieldList;

    private List<Property> properties;

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getJoinType() {
        return joinType;
    }

    public void setJoinType(String joinType) {
        this.joinType = joinType;
    }

    public List<RelationField> getFieldList() {
        return fieldList;
    }

    public void setFieldList(List<RelationField> fieldList) {
        this.fieldList = fieldList;
    }

    public List<Property> getProperties() {
        return properties;
    }

    public void setProperties(List<Property> properties) {
        this.properties = properties;
    }

    public boolean isRelationTable() {
        return isRelationTable;
    }

    public void setRelationTable(boolean relationTable) {
        isRelationTable = relationTable;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }
}
