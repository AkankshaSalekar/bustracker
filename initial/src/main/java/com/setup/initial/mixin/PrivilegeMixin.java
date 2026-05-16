package com.setup.initial.mixin;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Set;

public abstract class PrivilegeMixin {

    @JsonIgnore
    public abstract Set<?> getRoles();
}

