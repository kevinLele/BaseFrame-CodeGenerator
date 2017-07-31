package com.hq.cloud.generator.utils;

import com.hq.cloud.generator.entity.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2015/10/2 0002.
 */
public class DBUtil {
    public static Map<String, String> typeMap = new HashMap<String, String>();

    public static Map<String, String> fullTypeMap = new HashMap<String, String>();

    static {
        typeMap.put("varchar", "String");
        typeMap.put("datetime", "Date");
        typeMap.put("longtext", "String");
        /*typeMap.put("int", "Integer");
        typeMap.put("bigint", "Integer");*/

        fullTypeMap.put("varchar", "java.lang.String");
        fullTypeMap.put("datetime", "java.util.Date");
        fullTypeMap.put("longtext", "java.lang.String");
        /*fullTypeMap.put("int", "java.lang.Integer");
        fullTypeMap.put("bigint", "java.lang.Integer");*/
    }

    public static List<Entity> getEntitiesFromDB(Config config) {
        String driver = "com.mysql.jdbc.Driver";

        // URL指向要访问的数据库名scutcs
        String url = config.getDbCfg().getUrl();

        // MySQL配置时的用户名
        String user = config.getDbCfg().getUser();

        // 连接MySQL配置时的密码
        String password = config.getDbCfg().getPassword();

        List<Entity> entityList = new ArrayList<>();
        Map<String, Entity> entityMap = new HashMap<>();

        try {
            // 加载驱动程序
            Class.forName(driver);

            // 连续数据库
            Connection conn = DriverManager.getConnection(url, user, password);

            if (!conn.isClosed()) {
                System.out.println("Succeeded connecting to the Database!");

                for (Table table : config.getTblConfig().getTables()) {
                    String tableName = table.getName();

                    // statement用来执行SQL语句
                    Statement statement = conn.createStatement();

                    String sql = "SHOW FULL COLUMNS FROM " + tableName;
                    ResultSet rs = statement.executeQuery(sql);

                    Entity entity = new Entity();
                    entity.setTableName(tableName);
                    entity.setTableAlias(table.getAlias());
                    entity.setRelations(table.getRelations());
                    entity.setClassName(StringUtil
                            .toUpperCaseAndRemoveUnderLine(tableName.replaceAll(config.getTblConfig().getTablePrefix(), "")));
                    entity.setRestPathPrefix(config.getRestPathPrefix());

                    List<Property> properties = new ArrayList<>();
                    initJavapackage(config.getPath(), entity);
                    entity.setDistributed(config.isDistributed());

                    while (rs.next()) {
                        String field = rs.getString("Field");
                        String comment = rs.getString("Comment");
                        String type = rs.getString("Type");
                        String length = "";

                        Pattern ptn = Pattern.compile("(.*?)\\((.*?)\\)");
                        Matcher matcher = ptn.matcher(type);

                        if (matcher.find()) {
                            type = matcher.group(1);
                            length = matcher.group(2);
                        }

                        Property property = new Property();
                        property.setFieldName(field);
                        property.setFieldType(type);
                        property.setLength(length);
                        property.setComment(comment);
                        property.init(); //进行必要的初始化

                        //生成实体类时不需要生成父类已经声明的属性，需要进行标识
                        if (config.getTblConfig().getExcludedFields().contains(field.toLowerCase())) {
                            property.setParentProperty(true);
                        }

                        properties.add(property);
                    }

                    entity.setProperties(properties);
                    entityList.add(entity);
                    entityMap.put(tableName, entity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        initRelationTables(entityMap, entityList);

        return entityList;
    }

    private static void initRelationTables(Map<String, Entity> entityMap, List<Entity> entityList) {
        for (Entity entity : entityList) {
            List<TableRelation> relations = entity.getRelations();

            if (null != relations && relations.size() > 0) {
                for (TableRelation relation : relations) {
                    List<RelationFields> fieldsList = relation.getRelationFields();

                    if (null != fieldsList && fieldsList.size() > 0) {
                        RelationFields firstfields = fieldsList.get(0);
                        RelationFields secondfields = null;

                        /*
                        * 只有多对多关系才需要配中间关联表
                        * */
                        if ("many-to-many".equals(relation.getType())) {
                            secondfields = fieldsList.get(1);
                        }

                        String table = firstfields.getTable();
                        Entity relationEntity = entityMap.get(table);

                        if (!firstfields.isRelationTable()) {
                            firstfields.setProperties(relationEntity.getProperties());
                            firstfields.setShortName(relationEntity.getClassName());
                            firstfields.setClassType(relationEntity.getEntityPackage() + "."
                                    + StringUtil.toUpperCaseFirst(relationEntity.getClassName()));

                            //如果是双向的，则另一张表也设置相关关联信息
                            if (relation.isBoth()) {
                                List<TableRelation> relationsList = relationEntity.getRelations();

                                if (null == relationsList) {
                                    relationsList = new ArrayList<>();
                                    relationEntity.setRelations(relationsList);
                                }

                                TableRelation tableRelation = new TableRelation();

                                if ("one-to-one".equals(relation.getType())
                                        || "one-to-many".equals(relation.getType())) {
                                    tableRelation.setType("one-to-one");
                                } else if ("many-to-many".equals(relation.getType())) {
                                    tableRelation.setType("many-to-many");
                                } else {
                                    throw new Error("不支持的关联关系:" + relation.getType());
                                }

                                List<RelationFields> relationFields = new ArrayList<>();
                                RelationFields firstRelationFields = new RelationFields();
                                RelationFields secondRelationFields = new RelationFields();

                                //第一个
                                firstRelationFields.setTable(entity.getTableName());
                                firstRelationFields.setAlias(entity.getTableAlias());
                                firstRelationFields.setJoinType(firstfields.getJoinType());
                                firstRelationFields.setShortName(entity.getClassName());
                                firstRelationFields.setClassType(entity.getEntityPackage() + "."
                                        + StringUtil.toUpperCaseFirst(entity.getClassName()));
                                List<RelationField> firstRelationFieldList = new ArrayList<>();
                                List<RelationField> secondRelationFieldList = new ArrayList<>();

                                if ("many-to-many".equals(relation.getType())) {
                                    RelationField firstField = relation.getRelationFields().get(0).getFieldList().get(0);
                                    RelationField secondField = relation.getRelationFields().get(1).getFieldList().get(0);
                                    RelationField newFirstField = new RelationField();
                                    RelationField newSecondField = new RelationField();

                                    newFirstField.setLeft(secondField.getRight());
                                    newFirstField.setRight(firstField.getRight());

                                    newSecondField.setLeft(secondField.getLeft());
                                    newSecondField.setRight(firstField.getLeft());

                                    firstRelationFieldList.add(newFirstField);
                                    secondRelationFieldList.add(newSecondField);
                                } else {
                                    for (RelationField field : firstfields.getFieldList()) {
                                        RelationField newField = new RelationField();
                                        newField.setLeft(field.getRight());
                                        newField.setRight(field.getLeft());

                                        firstRelationFieldList.add(newField);
                                    }
                                }

                                firstRelationFields.setFieldList(firstRelationFieldList);
                                firstRelationFields.setProperties(entity.getProperties());

                                relationFields.add(firstRelationFields);

                                if ("many-to-many".equals(relation.getType()) && secondfields != null) {
                                    //第二个
                                    secondRelationFields.setTable(secondfields.getTable());
                                    secondRelationFields.setAlias(secondfields.getAlias());
                                    secondRelationFields.setJoinType(secondfields.getJoinType());

                                    secondRelationFields.setFieldList(secondRelationFieldList);
                                    relationFields.add(secondRelationFields);
                                }

                                tableRelation.setRelationFields(relationFields);
                                relationsList.add(tableRelation);
                            }
                        }
                    }
                }
            }
        }
    }

    private static void initJavapackage(Path path, Entity entity) {
        entity.setEntityPackage(StringUtil.getPkg(path.getEntityPath()));
        entity.setMapperPackage(StringUtil.getPkg(path.getMapperInterfacePath()));
        entity.setServicePackage(StringUtil.getPkg(path.getServiceInterfacePath()));
        entity.setServiceImplPackage(StringUtil.getPkg(path.getServiceImplPath()));
        entity.setRestfulPackage(StringUtil.getPkg(path.getRestfulInterfacePath()));
        entity.setRestfulImplPackage(StringUtil.getPkg(path.getRestfulImplPath()));
        entity.setUtilPackage(StringUtil.getPkg(path.getUtilPath()));
        entity.setProviderPackage(StringUtil.getPkg(path.getProviderInterfacePath()));
        entity.setProviderImplPackage(StringUtil.getPkg(path.getProviderImplPath()));
    }

    /**
     * 将数据库中的字段类型转换为JAVA中的类型
     *
     * @param dbType
     * @return
     */
    public static String dbType2JavaType(String dbType) {
        String javaType = typeMap.get(dbType);

        if (null == javaType) {
            javaType = "String";
        }

        return javaType;
    }

    public static String dbType2FullJavaType(String dbType) {
        String fullJavaType = fullTypeMap.get(dbType);

        if (null == fullJavaType) {
            fullJavaType = "java.lang.String";
        }

        return fullJavaType;
    }
}
