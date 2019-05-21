package io.kkw.auction.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@ComponentScan(basePackages = {"io.kkw.auction"})
@SpringBootApplication
@EnableJpaAuditing
public class Application {

    public static void main(String[] args) {
        System.out.println("Start Application");
        SpringApplication.run(Application.class, args);

    }
}
