package com.setup.initial.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.setup.initial.dto.ApplicationResponseDto;
import com.setup.initial.serviceImpl.CustomUserDetailsService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

import static org.aspectj.weaver.tools.cache.SimpleCacheFactory.path;

@Component
@RequiredArgsConstructor
public class JwtAuthFilter extends OncePerRequestFilter {

    private final JwtService jwtService;
    private final CustomUserDetailsService userDetailsService;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {

        final String authHeader = request.getHeader("Authorization");
        final String jwt;
        final String username;

        // Skip JWT check for public endpoints
        String requestPath = request.getRequestURI();
      if (requestPath.startsWith("/api/login")
        || requestPath.startsWith("/api/users/save")
        || requestPath.startsWith("/api/driver")
        || requestPath.startsWith("/api/students")
        || requestPath.startsWith("/api/bus")
        || requestPath.startsWith("/swagger-ui")
        || requestPath.startsWith("/v3/api-docs")) {

        filterChain.doFilter(request, response);
        return;
      }


      if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            sendUnauthorized(response, "Token missing");
            return;
        }

        jwt = authHeader.substring(7);
        username = jwtService.extractUsername(jwt);

        if (username == null) {
            sendUnauthorized(response, "Invalid token");
            return;
        }

        if (SecurityContextHolder.getContext().getAuthentication() == null) {
            UserDetails userDetails = userDetailsService.loadUserByUsername(username);

            if (!jwtService.isTokenValid(jwt, userDetails)) {
                sendUnauthorized(response, "Token expired or invalid");
                return;
            }

            UsernamePasswordAuthenticationToken authToken =
                    new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authToken);
        }

        filterChain.doFilter(request, response);
    }

    private void sendUnauthorized(HttpServletResponse response, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType("application/json");
        ApplicationResponseDto resp = new ApplicationResponseDto();
        resp.setStatusCode(HttpServletResponse.SC_UNAUTHORIZED);
        resp.setMessage(message);
        resp.setData(null);
        response.getWriter().write(objectMapper.writeValueAsString(resp));
    }
}
