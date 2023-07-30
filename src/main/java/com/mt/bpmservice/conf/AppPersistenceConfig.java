package com.mt.bpmservice.conf;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.mt.core.model.dao.impl.BaseJpaRepositoryImpl;

@Configuration
@EnableJpaRepositories(basePackages = { "com.mt.app.model.dao" }, repositoryBaseClass = BaseJpaRepositoryImpl.class)
@EntityScan({ "com.mt.app.model.entity" })
public class AppPersistenceConfig {

}
