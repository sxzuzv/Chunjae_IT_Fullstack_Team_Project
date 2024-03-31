package kr.co.chunjae.classarchive.config;


import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;


//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//  // SecurityFilterChain을 반환하는 메서드
//  @Bean
//  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//    final String[] WHITE_LIST = {
//            "/**"
//    };
//    // 웹 보안 설정
//    http.csrf().disable()
//            .sessionManagement(session -> session
//                    .sessionCreationPolicy(SessionCreationPolicy.STATELESS) // 세션 정책 설정
//            )
//            .authorizeHttpRequests(authorize -> authorize
//                    .requestMatchers(WHITE_LIST).permitAll()
//            )
//            .formLogin(form -> form
//                    .loginPage("/login")
//                    .loginProcessingUrl("/loginProcess")
//                    .permitAll()
//                    .defaultSuccessUrl("/")
//            )
//            .logout(logout -> logout
//                    .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//                    .logoutSuccessUrl("/login")
//                    .permitAll()
//                    // 세션 무효화
//                    .invalidateHttpSession(true)
//                    // 쿠키 삭제
//                    .deleteCookies("JSESSIONID")
//            );
//
//
//    // SecurityFilterChain 객체 생성 및 반환
//    return http.build();
//  }
//
//
//}

