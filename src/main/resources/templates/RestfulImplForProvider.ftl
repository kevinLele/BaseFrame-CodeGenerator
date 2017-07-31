package ${entity.restfulImplPackage};

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hq.dbf.BaseDomain.entity.${entity.className?cap_first};
import com.hq.dbf.BaseDomain.provider.I${entity.className?cap_first}Provider;
import com.hq.dbf.BaseDomain.provider.base.IBaseProvider;
import com.hq.dbf.BaseWeb.restful.I${entity.className?cap_first}RestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;

import javax.ws.rs.Path;

@Path("${entity.className}")
@Controller
@Slf4j
public class ${entity.className?cap_first}RestServiceImpl extends BaseRestServiceImpl<${entity.className?cap_first}> implements I${entity.className?cap_first}RestService {

    @Reference
    private I${entity.className?cap_first}Provider ${entity.className}Provider;

    @Override
    public IBaseProvider<${entity.className?cap_first}> getProvider() {
        return ${entity.className}Provider;
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
