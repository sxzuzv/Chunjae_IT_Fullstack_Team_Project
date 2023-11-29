package mybatis.mapper;

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
    boolean createUser(UserDTO userDTO);
    int authenticateUser(Map<String, String> map);

    String authenticateStatus(String userId);
}
