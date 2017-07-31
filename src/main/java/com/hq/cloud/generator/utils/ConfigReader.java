package com.hq.cloud.generator.utils;

import com.hq.cloud.generator.entity.*;
import org.apache.commons.lang.StringUtils;
import org.jdom2.Element;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/10/5 0005.
 */
public class ConfigReader {

    public static Config readConfig(Element root) {
        //读取是否是分布式项目的配置项
        Element distributedEle = root.getChild("distributed");
        boolean distributed = false;

        if (null != distributedEle && "true".equals(distributedEle.getValue())) {
            distributed = true;
        }

        //读取项目各目录的配置信息
        Path path = getPath(root.getChild("paths"));

        //读取数据库表相关的配置信息
        TableConfig tblCfg = getTableConfig(root.getChild("tableCfg"));

        //读取数据库连接的配置信息
        DatabaseCfg dbCfg = getDBCfg(root.getChild("DatabaseCfg"));

        Config config = new Config();
        config.setPath(path);
        config.setTblConfig(tblCfg);
        config.setDbCfg(dbCfg);
        config.setRestPathPrefix(root.getChildText("restPathPrefix").trim());
        config.setDistributed(distributed);

        return config;
    }

    public static Path getPath(Element pathEle) {
        Path path = new Path();

        path.setProjectPath(pathEle.getChildText("projectPath").trim());
        path.setEntityPath(pathEle.getChildText("entityPath").trim());
        path.setProviderInterfacePath(pathEle.getChildText("providerInterfacePath").trim());
        path.setProviderImplPath(pathEle.getChildText("providerImplPath").trim());
        path.setRestfulInterfacePath(pathEle.getChildText("restfulInterfacePath").trim());
        path.setRestfulImplPath(pathEle.getChildText("restfulImplPath").trim());
        path.setMapperInterfacePath(pathEle.getChildText("mapperInterfacePath").trim());
        path.setMapperXmlPath(pathEle.getChildText("mapperXmlPath").trim());
        path.setServiceInterfacePath(pathEle.getChildText("serviceInterfacePath").trim());
        path.setServiceImplPath(pathEle.getChildText("serviceImplPath").trim());
        path.setTesterClassFilePath(pathEle.getChildText("testerClassFilePath").trim());
        path.setUtilPath(pathEle.getChildText("utilPath").trim());

        return path;
    }

    public static TableConfig getTableConfig(Element tableCfg) {
        TableConfig config = new TableConfig();
        List<Table> tables = new ArrayList<>();

        Element tablesEle = tableCfg.getChild("tables");
        Element excludedFieldsEle = tableCfg.getChild("excludedFields");

        config.setTablePrefix(tablesEle.getAttributeValue("tablePrefix").trim());
        List<Element> tblEles = tablesEle.getChildren("table");

        for (Element tblEle : tblEles) {
            tables.add(getTableCfg(tblEle));
        }

        config.setTables(tables);

        List<Element> fieldEles = excludedFieldsEle.getChildren("field");
        List<String> excludeFields = new ArrayList<>();

        for (Element fieldEle : fieldEles) {
            excludeFields.add(fieldEle.getText());
        }

        config.setExcludedFields(excludeFields);

        return config;
    }

    public static Table getTableCfg(Element tableEle) {
        Table table = new Table();

        String tableName = tableEle.getAttributeValue("name").trim();
        Element relation = tableEle.getChild("relation");
        table.setName(tableName);
        table.setAlias(getTableAlias(tableName));

        if (null != relation) {
            List<TableRelation> relations = new ArrayList<>();
            List<Element> typeList = relation.getChildren();

            for (Element relationType : typeList) {
                String type = relationType.getName().trim();
                String both = relationType.getAttributeValue("both").trim();

                List<Element> relationFieldsEleList = relationType.getChildren("relation-fields");
                TableRelation tableRelation = new TableRelation();
                List<RelationFields> relationFieldsList = new ArrayList<>();

                for (Element relationFieldsEle : relationFieldsEleList) {
                    RelationFields fields = new RelationFields();
                    String relationTableName = relationFieldsEle.getAttributeValue("table").trim();
                    String joinType = relationFieldsEle.getAttributeValue("joinType").trim();
                    String isRelationTable = relationFieldsEle.getAttributeValue("isRelationTable");

                    if (StringUtils.isNotBlank(isRelationTable)) {
                        fields.setRelationTable(Boolean.parseBoolean(isRelationTable.trim()));
                    }

                    List<Element> relationFieldList = relationFieldsEle.getChildren("relation-field");
                    List<RelationField> fieldList = new ArrayList<>();

                    for (Element relationField : relationFieldList) {
                        String left = relationField.getAttributeValue("left");
                        String right = relationField.getAttributeValue("right");

                        RelationField field = new RelationField();
                        field.setLeft(left);
                        field.setRight(right);

                        fieldList.add(field);
                    }

                    fields.setTable(relationTableName);
                    fields.setAlias(getTableAlias(relationTableName));
                    fields.setJoinType(joinType);
                    fields.setFieldList(fieldList);

                    relationFieldsList.add(fields);
                }

                tableRelation.setType(type);

                if (StringUtils.isNotBlank(both)) {
                    tableRelation.setBoth(Boolean.parseBoolean(both));
                }

                tableRelation.setRelationFields(relationFieldsList);

                relations.add(tableRelation);
            }

            table.setRelations(relations);
        } else {
            //System.out.println("表(" + tableName + ")未配置关联关系!");
        }

        return table;
    }

    public static DatabaseCfg getDBCfg(Element cfgEle) {
        DatabaseCfg cfg = new DatabaseCfg();

        cfg.setUrl(cfgEle.getChildText("url").trim());
        cfg.setUser(cfgEle.getChildText("user").trim());
        cfg.setPassword(cfgEle.getChildText("password").trim());

        return cfg;
    }

    private static int aliasIndex = 1;

    private static String aliasPrefix = "t";

    private static Map<String, String> aliasMap = new HashMap<>();

    private static String getTableAlias(String tableName) {
        if (aliasMap.containsKey(tableName)) {
            return aliasMap.get(tableName);
        } else {
            String tableAlias = aliasPrefix + aliasIndex++;
            aliasMap.put(tableName, tableAlias);

            return tableAlias;
        }
    }
}
