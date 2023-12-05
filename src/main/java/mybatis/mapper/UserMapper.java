package mybatis.mapper;

import dto.BoardDTO;
import dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    //신수진


    //최경락


    //최영주


    //최재혁
    int createUser(UserDTO userDTO);
    int authenticateUser(Map<String, String> map);

    String authenticateFind(Map<String, String> map);

    int authenticateFindPass(Map<String, String> map);

    int idCheck(String userId);


    String authenticateStatus(String userId);

    String authenticateAdmin(String userId);

    int updatePass(UserDTO userDTO);
    int updateUserInfo(UserDTO userDTO);

    UserDTO userSelectView(String userId);

    int userSelfDelete(String userId);

    int userSelectNonPassCount(Map<String, Object> map);

    List <UserDTO> userSelectNonPassPage(Map<String, Object> map);

    int updateUserPass(String userId);

    int updateUserPending(String userId);

    int userSelectReportCount(Map<String, Object> map);

    List<UserDTO> userSelectReportPage(Map<String, Object> map);

    int updateUserDrop(String userId);
}
