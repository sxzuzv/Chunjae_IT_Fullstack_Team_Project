package kr.co.chunjae.classarchive.dto.member;

import lombok.*;


import java.sql.Timestamp;
import java.util.Collection;
import java.util.Collections;

/**
 * 회원 관리 DTO
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
//public class MemberDTO implements UserDetails
public class MemberDTO{
    private Long id;                    // 고유번호
    private String memberId;            // ID
    private String name;                // 이름
    private String password;            // 비밀번호
    private String email;               // 이메일
    private Timestamp joinDate;         // 등록일
    private String phoneNumber;         // 전화번호
    private boolean deleteFlag;         // 삭제 여부
    private String auth;

//    // 사용자의 권한을 반환하는 메서드
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        // 임시로 모든 사용자에게 USER 권한을 부여
//        return Collections.singleton(new SimpleGrantedAuthority("USER"));
//    }
//
//    // 사용자의 아이디를 반환하는 메서드
//    @Override
//    public String getUsername() {
//        return memberId;
//    }
//
//    // 사용자의 계정이 만료되지 않았는지 확인하는 메서드
//    @Override
//    public boolean isAccountNonExpired() {
//        // 임시로 모든 사용자의 계정을 만료되지 않았다고 가정
//        return true;
//    }
//
//    // 사용자의 계정이 잠겨있지 않은지 확인하는 메서드
//    @Override
//    public boolean isAccountNonLocked() {
//        // 임시로 모든 사용자의 계정을 잠겨있지 않았다고 가정
//        return true;
//    }
//
//    // 사용자의 비밀번호가 만료되지 않았는지 확인하는 메서드
//    @Override
//    public boolean isCredentialsNonExpired() {
//        // 임시로 모든 사용자의 비밀번호를 만료되지 않았다고 가정
//        return true;
//    }
//
//    // 사용자의 계정이 활성화되어 있는지 확인하는 메서드
//    @Override
//    public boolean isEnabled() {
//        // 임시로 모든 사용자의 계정을 활성화되어 있다고 가정
//        return true;
//    }
}
