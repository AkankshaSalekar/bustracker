package com.setup.initial.mixin;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.setup.initial.model.Role;

import java.util.Set;

public abstract class UserMixin {

    @JsonIgnore
    private String password;

    public abstract Set<Role> getRoles();
}

