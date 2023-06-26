package com.example.eoi.incideitor.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

/**
 *
 * <p>Para utilizar esta configuración en la aplicación, se debe anotar una clase de inicio con @SpringBootApplication y especificar
 * AppConfig como una de las clases de configuración.</p>
 */
@Configuration
public class AppConfig {

    @Autowired
    Environment environment;

    @Value("${google.maps.api.key}")
    private String googleMapsApiKey;

    @Bean
    public String googleMapsApiKey() {
        return googleMapsApiKey;
    }
    




}


