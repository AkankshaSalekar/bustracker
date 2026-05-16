package com.setup.initial.dto;

import lombok.*;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginResponseDTO {
    private String token;
    private String mobile;
    private String firstName;
    private String lastName;
    private Set<String> roles;
    private Set<String> privileges;
}

