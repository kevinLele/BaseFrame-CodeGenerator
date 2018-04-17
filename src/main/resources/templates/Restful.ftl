<#assign names = ""/>
<#list entity.relations as relation>
    <#assign names = names + relation.relationFields[0].shortName?cap_first />
</#list>
<#if names?length gt 20>
    <#assign names = "RelationShip" />
</#if>
package ${entity.restfulPackage};

import ${entity.entityPackage}.${entity.className?cap_first};
<#if names != "">
import ${entity.restfulPackage}.view.ResultBean;
import ${entity.restfulPackage}.view.Page;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Map;
</#if>
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/api/${entity.className}")
<#if entity.tableLabel != "">
@Api(tags = "${entity.tableLabel} API", description = "提供操作${entity.tableLabel}的相关接口")
<#else>
@Api(tags = "${entity.className?cap_first} API", description = "提供操作${entity.className?cap_first}的相关接口")
</#if>
public interface I${entity.className?cap_first}RestService extends IBaseRestService<${entity.className?cap_first}> {

<#if names != "">
    @PostMapping(
            value = "getByWhereWith${names}",
            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    ResultBean<List<${entity.className?cap_first}>> getByWhereWith${names}(Map<String, Object> mapBean);

    @PostMapping(
            value = "getPageWith${names}",
            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    ResultBean<Page<${entity.className?cap_first}>> getPageWith${names}(Page<${entity.className?cap_first}> page);
</#if>
}