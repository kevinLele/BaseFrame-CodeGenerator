package ${entity.restfulImplPackage};

import ${entity.entityPackage}.${entity.className?cap_first};
import ${entity.restfulPackage}.I${entity.className?cap_first}RestService;
import ${entity.servicePackage}.IBaseService;
import ${entity.servicePackage}.I${entity.className?cap_first}Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import javax.ws.rs.Path;

@Path("${entity.className}")
@Controller
@Slf4j
public class ${entity.className?cap_first}RestServiceImpl extends BaseRestServiceImpl<${entity.className?cap_first}> implements I${entity.className?cap_first}RestService {

    @Autowired
    @Qualifier("${entity.className}Service")
    private I${entity.className?cap_first}Service ${entity.className}Service;

    @Override
    public IBaseService getService() {
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
    public String getByWhereWith${names}(String jsonStr) {
        return getByWhere(jsonStr, "findByMapWith${names}");
    }

    @Override
    public String getPageWith${names}(String jsonStr) {
        return getPage(jsonStr, "getCountWith${names}", "findByPageWith${names}");
    }
</#if>
}
