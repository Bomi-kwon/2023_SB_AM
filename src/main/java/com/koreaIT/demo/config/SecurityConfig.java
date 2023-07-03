package com.koreaIT.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.koreaIT.demo.service.PrincipalOauth2UserService;

//springSecurity Config
@Configuration
@EnableWebSecurity
public class SecurityConfig{
	/**
	 * 원래 websecurityconfigureadater를 상속받아야 하는데
	 * component 기반의 보안 설정을 권장한다는 이유로
	 * deprecated되었다고 함ㅠㅠ
	 * 그래서 대신 SecurityFilterChain을 사용해야함
	 * 
	 * 기존 방식과 다른 점 : 리턴값이 있고 bean으로 등록한다.
	 */
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;

	// Security 를 이용한 각종 권한 접근 경로 등 설정
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		/**
		 * @Bean 어노테이션은 개발자가 직접 제어가 불가능한 외부 라이브러리를 Bean으로 만들때 사용한다.
		 * 이 어노테이션 옆에 (name="어쩌구") 이런 식으로 원하는 id로 Bean을 등록할 수 있다.
		 * 아무 id도 안 등록하면 "클래스이름(인데 메서드 이름을 camelCase로 바꾼 문자열).class"로 넘겨주면 되고 
		 * 그 후 getBean을 사용하면 된다.
		 * 
		 * @Componenet 어노테이션은 개발자가 직접 작성한 class를 Bean으로 등록할 때 사용한다.
		 * 이 어노테이션은 (value="어쩌구") 이렇게 Bean 이름을 지정한다.
		 * 나중에 @Autowired해줄 때 이 이름을 이용해서 해당 자리에 위치할 bean을 명시해줘야 한다.
		 */
		
		http.csrf().disable()
        .authorizeHttpRequests()
        // "/" 아래로 접근하는 모든 유저에 대해서 허용 => 즉 모든 경로에 대해서 허용
        // 일단 임시로 모든 경로에 대해서 허용해둠
        .antMatchers("/**").permitAll()
    .and()
        // Security 의 기본 login 페이지가 아닌 커스텀 페이지를 사용하기 위한 설정
        // 로그인 페이지 url
        .formLogin().loginPage("/usr/member/login").permitAll()
        .loginProcessingUrl("/login") // 로그인 요청 url
        .defaultSuccessUrl("/") // 로그인 완료 시 요청 url
    .and()
        .logout().logoutUrl("/logout").permitAll() // 로그인 아웃 시 url
        .logoutSuccessUrl("/") // 성공적으로 로그아웃 햇을 때 url
    .and()
        .oauth2Login() // 소셜 로그인 사용 여부
        .loginPage("/usr/member/login") // 소셜 로그인 진행 시 사용할 url
        .userInfoEndpoint()
        // SNS 로그인이 완료된 뒤 후처리가 필요함. 엑세스토큰+사용자프로필 정보
        .userService(principalOauth2UserService);

		return http.build();
	}
	
	
}
