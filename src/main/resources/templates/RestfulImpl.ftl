package ${entity.restfulImplPackage};

import ${entity.entityPackage}.${entity.className?cap_first};
import ${entity.restfulPackage}.I${entity.className?cap_first}RestService;
import ${entity.restfulPackage}.view.Page;
import ${entity.restfulPackage}.view.ResultBean;
import ${entity.servicePackage}.IBaseService;
import ${entity.servicePackage}.I${entity.className?cap_first}Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class ${entity.className?cap_first}RestServiceImpl extends BaseRestServiceImpl<${entity.className?cap_first}> implements I${entity.className?cap_first}RestService {

    @Autowired
    @Qualifier("${entity.className}Service")
    private I${entity.className?cap_first}Service ${entity.className}Service;

    @Override
    public IBaseService<${entity.className?cap_first}> getService() {
        return ${entity.className}Service;
    }
<#assign names = ""/>
<#list entity.relations as relation>
    <#assign names = names + relation.relationFields[0].shortName?cap_first />
</#list>
<#if names?length gt 20>
    <#assign names = "RelationShip" />
</#if>
<#if names != "">

    @Override
    public ResultBean<List<${entity.className?cap_first}>> getByWhereWith${names}(@RequestBody Map<String, Object> mapBean) {
        return getByWhere(mapBean, "findByMapWith${names}");
    }

    @Override
    public ResultBean<Page<${entity.className?cap_first}>> getPageWith${names}(@RequestBody Page<${entity.className?cap_first}> page) {
        return getPage(page, "getCountWith${names}", "findByPageWith${names}");
    }
</#if>
}
