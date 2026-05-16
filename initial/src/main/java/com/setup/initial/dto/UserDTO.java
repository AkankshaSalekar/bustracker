package com.setup.initial.dto;

import lombok.*;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDTO extends BaseModelDto {
    private String firstName;
    private String middleName;
    private String lastName;

    private String email;
    private String phoneNumber;
    private String password;

    private Set<RoleDTO> roles;
}
