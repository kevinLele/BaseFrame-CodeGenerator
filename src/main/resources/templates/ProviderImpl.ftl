package ${entity.providerImplPackage};

import com.alibaba.dubbo.config.annotation.Service;
import com.hq.dbf.BaseDomain.entity.${entity.className?cap_first};
import com.hq.dbf.BaseDomain.provider.I${entity.className?cap_first}Provider;
import com.hq.dbf.BaseServer.service.IBaseService;
import com.hq.dbf.BaseServer.service.I${entity.className?cap_first}Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.ProviderException;

@Service
public class ${entity.className?cap_first}ProviderImpl extends BaseProviderImpl<${entity.className?cap_first}> implements I${entity.className?cap_first}Provider {

    @Autowired
    private I${entity.className?cap_first}Service ${entity.className}Service;

    @Override
    public IBaseService<${entity.className?cap_first}> getBaseService() {
        return ${entity.className}Service;
    }

}
