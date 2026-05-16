package com.setup.initial.exception;

import com.setup.initial.dto.ApplicationResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalException {

    @ExceptionHandler(ApplicationException.class)
    public ApplicationResponseDto handleApplicationException(ApplicationException exception) {
        ApplicationResponseDto response = new ApplicationResponseDto();
        response.setStatusCode(HttpStatus.BAD_REQUEST.value());
        response.setMessage(exception.getMessage());
        response.setData(null);
        return response;
    }

    // Handle all other runtime exceptions globally
    @ExceptionHandler(RuntimeException.class)
    public ApplicationResponseDto handleRuntimeException(RuntimeException ex) {
        ApplicationResponseDto response = new ApplicationResponseDto();
        response.setStatusCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
        response.setMessage(ex.getMessage());
        response.setData(null);
        return response;
    }
}
