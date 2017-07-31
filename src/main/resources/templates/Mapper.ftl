<#assign names = ""/>
<#list entity.relations as relation>
    <#assign names = names + relation.relationFields[0].shortName?cap_first />
</#list>
<#if names?length gt 20>
    <#assign names = "RelationShip" />
</#if>
package ${entity.mapperPackage};

import ${entity.entityPackage}.${entity.className?cap_first};
import org.springframework.stereotype.Repository;

<#if names != "">
import java.util.List;
import java.util.Map;

</#if>
@Repository("${entity.className}Mapper")
public interface ${entity.className?cap_first}Mapper extends BaseMapper<${entity.className?cap_first}> {

<#if names != "">
    List<${entity.className?cap_first}> findByMapWith${names}(Map<String, Object> map);

    Integer getCountWith${names}(Map<String, Object> map);

    List<${entity.className?cap_first}> findByPageWith${names}(Map<String, Object> map);
</#if>
}
