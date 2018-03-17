package com.me.common.util;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.ConfigGenerator;

public class CustomGenerator {
     public static void main(String[] args) {
            ConfigGenerator cg = new ConfigGenerator();
            // 配置 MySQL 连接
            cg.setDbDriverName("com.mysql.cj.jdbc.Driver");
            cg.setDbUser("root");
            cg.setDbPassword("1");
            cg.setDbUrl("jdbc:mysql://127.0.0.1:3306/me?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT&useSSL=false");
            // 配置包名
            cg.setEntityPackage("com.me.entity.platform");
            cg.setMapperPackage("com.me.dao.platform");
            cg.setXmlPackage("com.me.entity.platform.xml");
            cg.setServicePackage("com.me.service.platform");
            cg.setServiceImplPackage("com.me.service.impl.platform");
            cg.setDbPrefix(true);
            // 配置表主键策略
            cg.setIdType(IdType.AUTO);
            String[] tablename={"teamteacher"};
            cg.setTableNames(tablename);
            cg.setControllerPackage("com.me.controller.platform");
            // 配置保存路径
            cg.setSaveDir("/path/to/src");
            // 其他参数请根据上面的参数说明自行配置，当所有配置完善后，运行AutoGenerator.run()方法生成Code
            // 生成代码
            AutoGenerator.run(cg);
        }
}