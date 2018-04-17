package com.hq.cloud.generator.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/9/13 0013.
 */
public class Entity {

    private boolean distributed;

    private String basePackage;

    private String entityPackage;

    private String providerPackage;

    private String providerImplPackage;

    private String mapperPackage;

    private String servicePackage;

    private String serviceImplPackage;

    private String restfulPackage;

    private String restfulImplPackage;

    private String utilPackage;

    private String restPathPrefix;

    private String className;

    private String tableName;

    private String tableLabel;

    private String tableAlias;

    private List<Property> properties = new ArrayList<>();

    private List<TableRelation> relations = new ArrayList<>();

    public List<TableRelation> getRelations() {
        return relations;
    }

    public void setRelations(List<TableRelation> relations) {
        this.relations = relations;
    }

    public String getEntityPackage() {
        return entityPackage;
    }

    public void setEntityPackage(String entityPackage) {
        this.entityPackage = entityPackage;
    }

    public String getProviderPackage() {
        return providerPackage;
    }

    public void setProviderPackage(String providerPackage) {
        this.providerPackage = providerPackage;
    }

    public String getProviderImplPackage() {
        return providerImplPackage;
    }

    public void setProviderImplPackage(String providerImplPackage) {
        this.providerImplPackage = providerImplPackage;
    }

    public String getMapperPackage() {
        return mapperPackage;
    }

    public void setMapperPackage(String mapperPackage) {
        this.mapperPackage = mapperPackage;
    }

    public String getServicePackage() {
        return servicePackage;
    }

    public void setServicePackage(String servicePackage) {
        this.servicePackage = servicePackage;
    }

    public String getServiceImplPackage() {
        return serviceImplPackage;
    }

    public void setServiceImplPackage(String serviceImplPackage) {
        this.serviceImplPackage = serviceImplPackage;
    }

    public String getRestfulPackage() {
        return restfulPackage;
    }

    public void setRestfulPackage(String restfulPackage) {
        this.restfulPackage = restfulPackage;
    }

    public String getRestfulImplPackage() {
        return restfulImplPackage;
    }

    public void setRestfulImplPackage(String restfulImplPackage) {
        this.restfulImplPackage = restfulImplPackage;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<Property> getProperties() {
        return properties;
    }

    public void setProperties(List<Property> properties) {
        this.properties = properties;
    }

    public String getRestPathPrefix() {
        return restPathPrefix;
    }

    public void setRestPathPrefix(String restPathPrefix) {
        this.restPathPrefix = restPathPrefix;
    }

    public String getUtilPackage() {
        return utilPackage;
    }

    public void setUtilPackage(String utilPackage) {
        this.utilPackage = utilPackage;
    }

    public String getTableAlias() {
        return tableAlias;
    }

    public void setTableAlias(String tableAlias) {
        this.tableAlias = tableAlias;
    }

    public boolean isDistributed() {
        return distributed;
    }

    public void setDistributed(boolean distributed) {
        this.distributed = distributed;
    }

    public String getTableLabel() {
        return tableLabel;
    }

    public void setTableLabel(String tableLabel) {
        this.tableLabel = tableLabel;
    }

    public String getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
    }
}
