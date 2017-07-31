package ${entity.providerPackage};

import com.hq.dbf.BaseDomain.entity.${entity.className?cap_first};
import ${entity.providerPackage}.base.IBaseProvider;

import java.security.ProviderException;

public interface I${entity.className?cap_first}Provider extends IBaseProvider<${entity.className?cap_first}> {

}
