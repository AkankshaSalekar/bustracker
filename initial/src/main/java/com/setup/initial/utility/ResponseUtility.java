package com.setup.initial.utility;

import com.setup.initial.dto.ApplicationResponseDto;
import org.springframework.http.HttpStatus;

public class ResponseUtility {

    public static ApplicationResponseDto response(Object data, String message) {
        ApplicationResponseDto applicationResponseDto = new ApplicationResponseDto();
        applicationResponseDto.setData(data);
        applicationResponseDto.setMessage(message);
        applicationResponseDto.setStatusCode(HttpStatus.OK.value());
        return applicationResponseDto;
    }

    public static ApplicationResponseDto response(Object data, String message, int statusCode) {
        ApplicationResponseDto applicationResponseDto = new ApplicationResponseDto();
        applicationResponseDto.setData(data);
        applicationResponseDto.setMessage(message);
        applicationResponseDto.setStatusCode(statusCode);
        return applicationResponseDto;
    }
}
