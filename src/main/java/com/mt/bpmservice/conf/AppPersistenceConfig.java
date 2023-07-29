package com.mt.bpmservice.conf;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableJpaRepositories(basePackages = { "com.mt.app.model.dao" })
@EntityScan({ "com.mt.app.model.entity" })
public class AppPersistenceConfig {

    // @ConfigurationProperties("app.datasource")
    // DataSource dataSource() {
    // return DataSourceBuilder.create().type(HikariDataSource.class).build();
    // }

    // @Primary // for injection into FlowableJpaAutoConfiguration
    // @Bean
    // LocalContainerEntityManagerFactoryBean bpmEntityManagerFactory(
    // @Qualifier("bpmDataSource") DataSource dataSource,
    // @Qualifier("bpmHibernateProperties") Properties hibernateProperties) {

    // LocalContainerEntityManagerFactoryBean em = new
    // LocalContainerEntityManagerFactoryBean();
    // em.setDataSource(dataSource);
    // em.setPackagesToScan();

    // JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
    // em.setJpaVendorAdapter(vendorAdapter);
    // em.setJpaProperties(hibernateProperties);

    // return em;
    // }

    // @Bean
    // PlatformTransactionManager
    // bpmTransactionManager(@Qualifier("bpmEntityManagerFactory")
    // EntityManagerFactory emf) {
    // JpaTransactionManager transactionManager = new JpaTransactionManager();
    // transactionManager.setEntityManagerFactory(emf);
    // return transactionManager;
    // }

    // @Bean
    // Properties bpmHibernateProperties(@Value("${bpm.hibernate.dialect}") String
    // dialect,
    // @Value("${bpm.hibernate.show_sql}") String showSQL,
    // @Value("${bpm.hibernate.format_sql}") String formatSQL) {

    // Properties properties = new Properties();
    // properties.setProperty("hibernate.dialect", dialect);
    // properties.setProperty("hibernate.show_sql", showSQL);
    // properties.setProperty("hibernate.format_sql", formatSQL);

    // return properties;
    // }
}
