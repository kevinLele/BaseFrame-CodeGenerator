package com.hq.cloud.generator;

import com.hq.cloud.generator.entity.Config;
import com.hq.cloud.generator.entity.Entity;
import com.hq.cloud.generator.utils.ConfigReader;
import com.hq.cloud.generator.utils.DBUtil;
import com.hq.cloud.generator.utils.FreemarkerHelper;
import com.hq.cloud.generator.utils.StringUtil;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/10/5 0005.
 */
public class CodeGenerator {

    public static void main(String[] args) {
        //generateCodes("config_RMC_DBF.xml");
        generateCodes("config_RMC.xml");
    }

    public static void generateCodes(String configFileName) {
        Config config = getConfig(configFileName);
        FreemarkerHelper fmHelper = null;

        try {
            fmHelper = FreemarkerHelper
                    .getInstance(new File(CodeGenerator.class.getResource("/templates").toURI()));
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        List<Entity> entityList = DBUtil.getEntitiesFromDB(config);

        for (Entity entity : entityList) {
            Map<String, Object> root = createDataModel(entity);

            /*
             * Domain
             */
            fmHelper.createFile(root, "Entity.ftl", config.getPath().getProjectPath() + config.getPath().getEntityPath() + "\\" + StringUtil.toUpperCaseFirst(entity.getClassName()) + ".java");

            if (config.isDistributed()) {
                fmHelper.createFile(root, "Provider.ftl", config.getPath().getProjectPath() + config.getPath().getProviderInterfacePath() + "\\I" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "Provider.java");
            }

            /*
             * Server
             */
            fmHelper.createFile(root, "DAO.ftl", config.getPath().getProjectPath() + config.getPath().getMapperInterfacePath() + "\\" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "DAO.java");
            fmHelper.createFile(root, "MySQLMapperXML.ftl", config.getPath().getProjectPath() + config.getPath().getMapperXmlPath() + "\\" + entity.getTableName().replaceAll("_", "-").toLowerCase() + "-mapper.xml");
            fmHelper.createFile(root, "Service.ftl", config.getPath().getProjectPath() + config.getPath().getServiceInterfacePath() + "\\I" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "Service.java");
            fmHelper.createFile(root, "ServiceImpl.ftl", config.getPath().getProjectPath() + config.getPath().getServiceImplPath() + "\\" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "ServiceImpl.java");

            if (config.isDistributed()) {
                fmHelper.createFile(root, "ProviderImpl.ftl", config.getPath().getProjectPath() + config.getPath().getProviderImplPath() + "\\" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "ProviderImpl.java");
            }

            /*
             * Web
             */
            fmHelper.createFile(root, "Restful.ftl", config.getPath().getProjectPath() + config.getPath().getRestfulInterfacePath() + "\\I" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "RestService.java");

            if (config.isDistributed()) {
                fmHelper.createFile(root, "RestfulImplForProvider.ftl", config.getPath().getProjectPath() + config.getPath().getRestfulImplPath() + "\\" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "RestServiceImpl.java");
            } else {
                fmHelper.createFile(root, "RestfulImpl.ftl", config.getPath().getProjectPath() + config.getPath().getRestfulImplPath() + "\\" + StringUtil.toUpperCaseFirst(entity.getClassName()) + "RestServiceImpl.java");
            }
        }
    }

    public static Config getConfig(String configFileName) {
        SAXBuilder saxBuilder = new SAXBuilder();
        Document doc;

        try {
            doc = saxBuilder.build(CodeGenerator.class.getResourceAsStream("/" + configFileName));
            Element root = doc.getRootElement();

            Config config = ConfigReader.readConfig(root);

            return config;
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 创建数据模型
     *
     * @return
     */
    private static Map<String, Object> createDataModel(Entity entity) {
        Map<String, Object> root = new HashMap<>();
        root.put("entity", entity);

        return root;
    }
}
