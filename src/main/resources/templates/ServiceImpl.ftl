package ${entity.serviceImplPackage};

import ${entity.entityPackage}.${entity.className?cap_first};
import ${entity.mapperPackage}.BaseMapper;
import ${entity.mapperPackage}.${entity.className?cap_first}Mapper;
import ${entity.servicePackage}.I${entity.className?cap_first}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("${entity.className}Service")
public class ${entity.className?cap_first}ServiceImpl extends BaseServiceImpl<${entity.className?cap_first}> implements I${entity.className?cap_first}Service {

    @Autowired
    @Qualifier("${entity.className}Mapper")
    private ${entity.className?cap_first}Mapper ${entity.className}Mapper;

    @Override
    public BaseMapper<${entity.className?cap_first}> getBaseMapper() {
        return ${entity.className}Mapper;
    }


}
