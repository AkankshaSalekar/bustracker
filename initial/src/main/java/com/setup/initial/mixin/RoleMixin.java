package com.setup.initial.mixin;

import com.setup.initial.model.Privilege;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Set;

public abstract class RoleMixin {

    // Ignore roles' users to avoid recursion
    @JsonIgnore
    public abstract Set<?> getUsers();

    // You can keep privileges serialized if needed
    public abstract Set<Privilege> getPrivileges();
}

