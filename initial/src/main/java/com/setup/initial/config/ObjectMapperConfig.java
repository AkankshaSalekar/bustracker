package com.setup.initial.config;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.setup.initial.mixin.PrivilegeMixin;
import com.setup.initial.mixin.RoleMixin;
import com.setup.initial.mixin.UserMixin;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ObjectMapperConfig {

    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();

        // Register JavaTimeModule to support LocalDateTime
        objectMapper.registerModule(new JavaTimeModule());

        // Optional: write dates as ISO strings instead of timestamps
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        // 3. Ignore unknown fields globally
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        // Register global Mixins
        objectMapper.addMixIn(com.setup.initial.model.User.class, UserMixin.class);
        objectMapper.addMixIn(com.setup.initial.model.Role.class, RoleMixin.class);
        objectMapper.addMixIn(com.setup.initial.model.Privilege.class, PrivilegeMixin.class);

        return objectMapper;
    }
}
