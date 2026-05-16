package com.setup.initial.service;


import com.setup.initial.dto.UserDTO;
import com.setup.initial.dto.UserResponseDTO;
import com.setup.initial.exception.ApplicationException;

public interface UserService {

    UserResponseDTO create(UserDTO dto) throws ApplicationException;

    UserResponseDTO getById(Long id);
}

