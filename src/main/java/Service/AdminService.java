/*package Service;

import dao.BoardDAO;
import dao.CommentDAO;
import dao.UserDAO;
import dto.BoardDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

*//*public class AdminService {
    BoardDAO brdDao;
    CommentDAO comDao;
    UserDAO userDao;*//*

public class AdminService {
    private final BoardDAO boardDAO;

    public AdminService(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    public List<Post> getPostsByCategories(int category1, int category2) {
        return boardDAO.getPostsByCategories(category1, category2);
    }


}*/
