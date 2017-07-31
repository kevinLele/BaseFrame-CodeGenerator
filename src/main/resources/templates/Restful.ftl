<#assign names = ""/>
<#list entity.relations as relation>
    <#assign names = names + relation.relationFields[0].shortName?cap_first />
</#list>
<#if names?length gt 20>
    <#assign names = "RelationShip" />
</#if>
package ${entity.restfulPackage};

<#if names != "">
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

</#if>
public interface I${entity.className?cap_first}RestService extends IBaseRestService {

<#if names != "">
    @POST
    @Path("getByWhereWith${names}")
    @Consumes(MediaType.APPLICATION_JSON + ";charset=utf-8")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    String getByWhereWith${names}(String jsonStr);

    @POST
    @Path("getPageWith${names}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    String getPageWith${names}(String jsonStr);
</#if>
}