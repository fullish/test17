package com.testspring.test17;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication/*(exclude = {DataSourceAutoConfiguration.class})*/
public class Test17Application {

    public static void main(String[] args) {
        SpringApplication.run(Test17Application.class, args);
    }

}
