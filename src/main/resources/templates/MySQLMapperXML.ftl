<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${entity.mapperPackage}.${entity.className?cap_first}DAO">

    <resultMap type="${entity.entityPackage}.${entity.className?cap_first}" id="${entity.className}ResultMap">
    <#list entity.properties as property>
        <result column="${property.fieldName}" property="${property.propertyName}" javaType="${property.fullJavaType}"/>
    </#list>

<#list entity.relations as relation>
    <#if relation.type == "one-to-one">
        <!-- association: 一对一映射 -->
        <!-- property: 把关联查询的一对一的信息封装到哪个属性上 -->
        <!-- javaType: property属性的类型 -->
        <association property="${relation.relationFields[0].shortName}" javaType="${relation.relationFields[0].classType}">
            <id column="${relation.relationFields[0].shortName}_id" property="id"/>
        <#list relation.relationFields[0].properties as relationProperty>
            <#if relationProperty.fieldName != "id">
            <result column="${relation.relationFields[0].shortName}_${relationProperty.fieldName}" property="${relationProperty.propertyName}"/>
            </#if>
        </#list>
        </association>

    </#if>
</#list>
<#list entity.relations as relation>
    <#if relation.type == "one-to-many" || relation.type == "many-to-many">
        <!-- collection: 一对多映射 -->
        <!-- property: 把关联查询的一对多的信息封装到哪个属性上 -->
        <!-- ofType: 指定集合内java的类型 -->
        <collection property="${relation.relationFields[0].shortName}List" ofType="${relation.relationFields[0].classType}">
            <id column="${relation.relationFields[0].shortName}_id" property="id"/>
        <#list relation.relationFields[0].properties as relationProperty>
            <#if relationProperty.fieldName != "id">
            <result column="${relation.relationFields[0].shortName}_${relationProperty.fieldName}" property="${relationProperty.propertyName}"/>
            </#if>
        </#list>
        </collection>

    </#if>
</#list>
    </resultMap>

    <!-- table: ${entity.tableName} -->
    <sql id="column">
    <#list entity.properties as property>
        ${entity.tableAlias}.${property.fieldName}<#if property_has_next>,</#if>
    </#list>
    </sql>

<#list entity.relations as relation>
    <!-- table: ${relation.relationFields[0].table} -->
    <sql id="${relation.relationFields[0].shortName}-column">
    <#list relation.relationFields[0].properties as relationProperty>
        ${relation.relationFields[0].alias}.${relationProperty.fieldName} as ${relation.relationFields[0].shortName}_${relationProperty.fieldName}<#if relationProperty_has_next>,</#if>
    </#list>
    </sql>

</#list>
    <insert id="save" parameterType="${entity.entityPackage}.${entity.className?cap_first}">
        insert into ${entity.tableName}(<#list entity.properties as property>${property.fieldName}<#if property_has_next>,</#if></#list>)
        values(<#list entity.properties as property>${r"#"}{${property.propertyName}}<#if property_has_next>,</#if></#list>)
    </insert>

    <update id="update" parameterType="${entity.entityPackage}.${entity.className?cap_first}">
        update ${entity.tableName} ${entity.tableAlias}
        <include refid="sql_update"/>
        where ${entity.tableAlias}.id=${r"#"}{id}
    </update>

    <update id="batchUpdate" parameterType="java.util.Map">
        update ${entity.tableName} ${entity.tableAlias}
        <include refid="sql_update"/>
        where ${entity.tableAlias}.id in
        <foreach item="item" index="index"
                 collection="idList" open="(" separator="," close=")">
            ${r"#"}{item}
        </foreach>
    </update>

    <delete id="deleteByWhere" parameterType="java.util.Map">
        delete ${entity.tableAlias} from ${entity.tableName} as ${entity.tableAlias}
        <include refid="sql_where"/>
    </delete>

    <update id="logicDeleteByWhere" parameterType="java.util.Map">
        update ${entity.tableName} ${entity.tableAlias} SET ${entity.tableAlias}.is_delete=1
        <include refid="sql_where"/>
    </update>

    <delete id="deleteById" parameterType="java.lang.String">
        delete from ${entity.tableName} where id = ${r"#"}{id}
    </delete>

    <update id="logicDeleteById" parameterType="java.lang.String">
        update ${entity.tableName} ${entity.tableAlias} SET ${entity.tableAlias}.is_delete=1 where ${entity.tableAlias}.id=${r"#"}{id}
    </update>

    <delete id="batchDelete" parameterType="java.util.List">
        delete from ${entity.tableName} where id in
        <foreach item="item" index="index"
                 collection="idList" open="(" separator="," close=")">
            ${r"#"}{item}
        </foreach>
    </delete>

    <update id="logicBatchDelete" parameterType="java.util.List">
        update ${entity.tableName} ${entity.tableAlias} SET ${entity.tableAlias}.is_delete=1 where id in
        <foreach item="item" index="index"
                 collection="idList" open="(" separator="," close=")">
            ${r"#"}{item}
        </foreach>
    </update>

    <select id="findById" resultMap="${entity.className}ResultMap">
        select
        <include refid="column"/>
        from ${entity.tableName} as ${entity.tableAlias}
        where ${entity.tableAlias}.id = ${r"#"}{id}
        LIMIT 0, 1
    </select>

    <select id="findByName" resultMap="${entity.className}ResultMap">
        select
        <include refid="column"/>
        from ${entity.tableName} as ${entity.tableAlias}
        where ${entity.tableAlias}.name like CONCAT(${r"#"}{name}, '%' )
        LIMIT 0, 1
    </select>

    <select id="findAll" resultMap="${entity.className}ResultMap">
        select
        <include refid="column"/>
        from ${entity.tableName} as ${entity.tableAlias}
    </select>

    <select id="findByMap" parameterType="java.util.Map" resultMap="${entity.className}ResultMap">
        select
        <include refid="column"/>
        from ${entity.tableName} as ${entity.tableAlias}
        <include refid="sql_where"/>
    </select>

<#assign names = ""/>
<#list entity.relations as relation>
    <#assign names = names + relation.relationFields[0].shortName?cap_first />
</#list>
<#if names?length gt 20>
    <#assign names = "RelationShip" />
</#if>
<#if names != "">
    <select id="findByMapWith${names}" parameterType="java.util.Map" resultMap="${entity.className}ResultMap">
        select
          <include refid="column"/><#list entity.relations as relation>,<include refid="${relation.relationFields[0].shortName}-column"/></#list>
        from ${entity.tableName} as ${entity.tableAlias}
<#list entity.relations as relation>
    <#if relation.type == "one-to-one" || relation.type == "one-to-many">
        ${relation.relationFields[0].joinType} ${relation.relationFields[0].table} as ${relation.relationFields[0].alias} on <#list relation.relationFields[0].fieldList as field>${entity.tableAlias}.${field.left} = ${relation.relationFields[0].alias}.${field.right}<#if field_has_next> and </#if></#list>
    <#elseif relation.type == "many-to-many">
        ${relation.relationFields[1].joinType} ${relation.relationFields[1].table} as ${relation.relationFields[1].alias} on <#list relation.relationFields[1].fieldList as field>${entity.tableAlias}.${field.left} = ${relation.relationFields[1].alias}.${field.right}<#if field_has_next> and </#if></#list>
        ${relation.relationFields[0].joinType} ${relation.relationFields[0].table} as ${relation.relationFields[0].alias} on <#list relation.relationFields[0].fieldList as field>${relation.relationFields[1].alias}.${field.left} = ${relation.relationFields[0].alias}.${field.right}<#if field_has_next> and </#if></#list>
    </#if>
</#list>
        <include refid="sql_where"/>
    </select>

</#if>
    <select id="getCount" parameterType="java.util.Map" resultType="int">
        select
        count(1)
        from ${entity.tableName} as ${entity.tableAlias}
        <include refid="sql_where"/>
    </select>

    <select id="findByPage" parameterType="java.util.Map" resultMap="${entity.className}ResultMap">
        select
        <include refid="column"/>
        from ${entity.tableName} as ${entity.tableAlias}
        <include refid="sql_where"/>
        <!--
            中文字段正确排序方式如下：
            CONVERT(t.username USING gbk) COLLATE gbk_chinese_ci
        -->
        <choose>
            <when test="orderFields != null and orderFields.size() > 0">
                order by
                <foreach collection="orderFields" index="idx" item="item" open="" separator="," close="" >
                <#list entity.properties as property>
                    <if test="item.field == '${property.propertyName}'">${entity.tableAlias}.${property.fieldName} ${r"$"}{item.sortType}</if>
                </#list>
                </foreach>
            </when>
            <otherwise>
                order by ${entity.tableAlias}.create_date desc
            </otherwise>
        </choose>
        limit ${r"#"}{startRowNum}, ${r"#"}{pageSize}
    </select>

<#if names != "">
    <select id="getCountWith${names}" parameterType="java.util.Map" resultType="int">
        select
        count(distinct ${entity.tableAlias}.id)
        from ${entity.tableName} as ${entity.tableAlias}
<#list entity.relations as relation>
    <#if relation.type == "one-to-one" || relation.type == "one-to-many">
        left join ${relation.relationFields[0].table} as ${relation.relationFields[0].alias} on <#list relation.relationFields[0].fieldList as field>${entity.tableAlias}.${field.left} = ${relation.relationFields[0].alias}.${field.right}<#if field_has_next> and </#if></#list>
    <#elseif relation.type == "many-to-many">
        left join ${relation.relationFields[1].table} as ${relation.relationFields[1].alias} on <#list relation.relationFields[1].fieldList as field>${entity.tableAlias}.${field.left} = ${relation.relationFields[1].alias}.${field.right}<#if field_has_next> and </#if></#list>
        left join ${relation.relationFields[0].table} as ${relation.relationFields[0].alias} on <#list relation.relationFields[0].fieldList as field>${relation.relationFields[1].alias}.${field.left} = ${relation.relationFields[0].alias}.${field.right}<#if field_has_next> and </#if></#list>
    </#if>
</#list>
        <include refid="sql_where"/>
    </select>

    <select id="findByPageWith${names}" parameterType="java.util.Map" resultMap="${entity.className}ResultMap">
        select
        distinct <include refid="column"/>
        from ${entity.tableName} as ${entity.tableAlias}
<#list entity.relations as relation>
    <#if relation.type == "one-to-one" || relation.type == "one-to-many">
        left join ${relation.relationFields[0].table} as ${relation.relationFields[0].alias} on <#list relation.relationFields[0].fieldList as field>${entity.tableAlias}.${field.left} = ${relation.relationFields[0].alias}.${field.right}<#if field_has_next> and </#if></#list>
    <#elseif relation.type == "many-to-many">
        left join ${relation.relationFields[1].table} as ${relation.relationFields[1].alias} on <#list relation.relationFields[1].fieldList as field>${entity.tableAlias}.${field.left} = ${relation.relationFields[1].alias}.${field.right}<#if field_has_next> and </#if></#list>
        left join ${relation.relationFields[0].table} as ${relation.relationFields[0].alias} on <#list relation.relationFields[0].fieldList as field>${relation.relationFields[1].alias}.${field.left} = ${relation.relationFields[0].alias}.${field.right}<#if field_has_next> and </#if></#list>
    </#if>
</#list>
        <include refid="sql_where"/>
        <!--
            中文字段正确排序方式如下：
            CONVERT(t.username USING gbk) COLLATE gbk_chinese_ci
        -->
        <choose>
            <when test="orderFields != null and orderFields.size() > 0">
                order by
                <foreach collection="orderFields" index="idx" item="item" open="" separator="," close="" >
                <#list entity.properties as property>
                    <if test="item.field == '${property.propertyName}'">${entity.tableAlias}.${property.fieldName} ${r"$"}{item.sortType}</if>
                </#list>
                </foreach>
            </when>
            <otherwise>
                order by ${entity.tableAlias}.create_date desc
            </otherwise>
        </choose>
        limit ${r"#"}{startRowNum}, ${r"#"}{pageSize}
    </select>

</#if>
    <sql id="sql_where">
        <where>
        <#list entity.properties as property>
            <if test="${property.propertyName} != null and ${property.propertyName} != ''">
                <![CDATA[
                    and ${entity.tableAlias}.${property.fieldName} = ${r"#"}{${property.propertyName}}
                ]]>
            </if>
        </#list>

    <#list entity.relations as relation>
        <#if relation.type == "one-to-one">
            <!-- ${relation.relationFields[0].table} -->
            <if test="${relation.relationFields[0].shortName} != null">
            <#list relation.relationFields[0].properties as relationProperty>
                <if test="${relation.relationFields[0].shortName}.${relationProperty.propertyName} != null and ${relation.relationFields[0].shortName}.${relationProperty.propertyName} != ''">
                    <![CDATA[
                        and ${relation.relationFields[0].alias}.${relationProperty.fieldName} = ${r"#"}{${relation.relationFields[0].shortName}.${relationProperty.propertyName}}
                    ]]>
                </if>
            </#list>
            </if>
        </#if>
    </#list>
        </where>
    </sql>

    <sql id="sql_update">
        <set>
            <#list entity.properties as property>
            <if test="${property.propertyName} != null and ${property.propertyName} != ''">
                <![CDATA[
                    ${entity.tableAlias}.${property.fieldName} = ${r"#"}{${property.propertyName}},
                ]]>
            </if>
            </#list>
        </set>
    </sql>
</mapper>