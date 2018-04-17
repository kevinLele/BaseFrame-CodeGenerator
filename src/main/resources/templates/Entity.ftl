package ${entity.entityPackage};

import ${entity.basePackage}.sys.aspect.validation.annotation.ValidationBean;
import ${entity.basePackage}.sys.aspect.validation.annotation.ValidationField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@ValidationBean
<#if entity.tableLabel != "">
@ApiModel(description = "${entity.tableLabel}")
<#else>
@ApiModel(description = "${entity.className?cap_first}")
</#if>
public class ${entity.className?cap_first} extends BaseEntity implements Serializable {

    <#list entity.properties as property>
        <#if !property.parentProperty>
    /**
     * ${property.comment}
     * 字段类型: ${property.fieldType}<#if property.length != "">
     * 长度: ${property.length}</#if>
     */
    <#if property.validationField>
    @ValidationField(notNull = ${property.notNull?c}<#if property.regex != "">, regex = "${property.regex}"</#if><#if property.tip != "">, tip = "${property.tip}"</#if>)
    </#if>
    @ApiModelProperty(value = "${property.comment} 字段类型: ${property.fieldType} 长度: ${property.length}")
    private ${property.javaType} ${property.propertyName};

        </#if>
    </#list>
    <#list entity.relations as relation>
        <#if relation.type == "one-to-one">
    private ${relation.relationFields[0].shortName?cap_first} ${relation.relationFields[0].shortName};
        <#elseif relation.type == "one-to-many" || relation.type == "many-to-many">
    private List<${relation.relationFields[0].shortName?cap_first}> ${relation.relationFields[0].shortName}List;
        </#if>

    </#list>
    <#list entity.properties as property>
        <#if !property.parentProperty>
    public ${property.javaType} get${property.propertyName?cap_first}() {
        return ${property.propertyName};
    }

    public void set${property.propertyName?cap_first}(${property.javaType} ${property.propertyName}) {
        this.${property.propertyName} = ${property.propertyName};
    }

        </#if>
    </#list>
    <#list entity.relations as relation>
        <#if relation.type == "one-to-one">
    public ${relation.relationFields[0].shortName?cap_first} get${relation.relationFields[0].shortName?cap_first}() {
        return ${relation.relationFields[0].shortName};
    }

    public void set${relation.relationFields[0].shortName?cap_first}(${relation.relationFields[0].shortName?cap_first} ${relation.relationFields[0].shortName}) {
        this.${relation.relationFields[0].shortName} = ${relation.relationFields[0].shortName};
    }
        <#elseif relation.type == "one-to-many" || relation.type == "many-to-many">
    public List<${relation.relationFields[0].shortName?cap_first}> get${relation.relationFields[0].shortName?cap_first}List() {
        return ${relation.relationFields[0].shortName}List;
    }

    public void set${relation.relationFields[0].shortName?cap_first}List(List<${relation.relationFields[0].shortName?cap_first}> ${relation.relationFields[0].shortName}List) {
        this.${relation.relationFields[0].shortName}List = ${relation.relationFields[0].shortName}List;
    }
        </#if>

    </#list>
}