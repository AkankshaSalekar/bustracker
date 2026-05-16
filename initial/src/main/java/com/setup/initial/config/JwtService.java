package com.setup.initial.config;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class JwtService {

    private static final long EXPIRATION_MS = 24 * 60 * 60 * 1000; // 24 hours

    @Value("${jwt.secret}")
    private String secretKey;

    private Algorithm getAlgorithm() {
        return Algorithm.HMAC256(secretKey);
    }

    public String generateToken(String mobile) {
        return JWT.create()
                .withSubject(mobile)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRATION_MS))
                .sign(getAlgorithm());
    }

    public String extractUsername(String token) {
        try {
            DecodedJWT decodedJWT = JWT.require(getAlgorithm()).build().verify(token);
            return decodedJWT.getSubject();
        } catch (JWTVerificationException e) {
            return null;
        }
    }

    public boolean isTokenValid(String token, UserDetails userDetails) {
        String mobile = extractUsername(token);
        return mobile != null && mobile.equals(userDetails.getUsername()) && !isExpired(token);
    }

    private boolean isExpired(String token) {
        DecodedJWT decodedJWT = JWT.require(getAlgorithm()).build().verify(token);
        return decodedJWT.getExpiresAt().before(new Date());
    }
}
