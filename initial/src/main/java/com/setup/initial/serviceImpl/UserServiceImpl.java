package com.setup.initial.serviceImpl;

import com.setup.initial.dto.RoleDTO;
import com.setup.initial.dto.UserDTO;
import com.setup.initial.dto.UserResponseDTO;
import com.setup.initial.exception.ApplicationException;
import com.setup.initial.model.Role;
import com.setup.initial.model.User;
import com.setup.initial.repository.RoleRepository;
import com.setup.initial.service.UserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashSet;
import java.util.Set;


@Service
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {

    private final com.setup.initial.repository.UserRepository userRepository;
    private final ObjectMapper objectMapper;
    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;

    @Transactional
    public UserResponseDTO create(UserDTO dto) throws ApplicationException {

        User user;

        if (dto.getId() == null) {
            // --------------- CREATE ---------------
            log.info("Creating new user with email: {}", dto.getEmail());

            if (userRepository.existsByEmail(dto.getEmail())) {
                throw new ApplicationException("Email already exists!");
            }

            user = objectMapper.convertValue(dto, User.class);
            user.setPassword(passwordEncoder.encode(dto.getPassword()));
            user.setCreatedBy("SYSTEM");

        } else {
            // --------------- UPDATE ---------------
            log.info("Updating user with id: {}", dto.getId());

            user = userRepository.findById(dto.getId())
                    .orElseThrow(() -> new ApplicationException("User not found with ID: " + dto.getId()));

            // Update only non-null fields
            if (dto.getFirstName() != null) user.setFirstName(dto.getFirstName());
            if (dto.getMiddleName() != null) user.setMiddleName(dto.getMiddleName());
            if (dto.getLastName() != null) user.setLastName(dto.getLastName());
            if (dto.getEmail() != null) user.setEmail(dto.getEmail());
            if (dto.getPhoneNumber() != null) user.setPhoneNumber(dto.getPhoneNumber());
            if (dto.getPassword() != null) user.setPassword(passwordEncoder.encode(dto.getPassword()));

            user.setUpdatedBy("SYSTEM");
        }

        // ---------------- Assign Roles ----------------
        if (dto.getRoles() != null && !dto.getRoles().isEmpty()) {
            Set<Role> roles = new HashSet<>();
            for (RoleDTO roleDTO : dto.getRoles()) {
                Role role = roleRepository.findById(roleDTO.getId())
                        .orElseThrow(() -> new ApplicationException("Role not found with ID: " + roleDTO.getId()));
                roles.add(role);
            }
            user.setRoles(roles);
        }

        User saved = userRepository.save(user);

        return objectMapper.convertValue(saved, UserResponseDTO.class);
    }

    @Override
    public UserResponseDTO getById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));

        UserResponseDTO response = objectMapper.convertValue(user,UserResponseDTO.class);
        return response;
    }
}
