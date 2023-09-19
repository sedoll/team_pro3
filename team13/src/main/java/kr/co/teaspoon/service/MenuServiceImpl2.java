package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.MenuDAO;
import kr.co.teaspoon.dto.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl2 implements MenuService{

    @Autowired
    private MenuDAO menuDAO;
    @Override
    public Menu getMenu(String sc_name) {
        return menuDAO.getMenu(sc_name);
    }
}
