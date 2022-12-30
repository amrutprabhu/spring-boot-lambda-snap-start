package com.amrut.prabhu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.GenericMessage;

import java.util.function.Function;

@SpringBootApplication
public class RequestHandlerApplication {

    public static void main(String[] args) {
        SpringApplication.run(RequestHandlerApplication.class, args);
    }

    @Bean
    public Function<String, String> toUpperCase() {
        return value -> value.toUpperCase();
    }

    @Bean
    public Function<String, String> toLowerCase() {
        return value -> value.toLowerCase();
    }
}
