package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.CategoryService;
import by.teachmeskills.eshop.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final CategoryService categoryService;

    public UserController(UserService userService, CategoryService categoryService) {
        this.userService = userService;
        this.categoryService = categoryService;
    }

    @GetMapping("/sign/in")
    public ModelAndView getSignInPage() throws ControllerException {
        return new ModelAndView(PagesPathEnum.SIGN_IN_PAGE.getPath());
    }

    @PostMapping("/enter/in/system")
    public ModelAndView SignIn(@RequestParam String username,
                               @RequestParam String password,
                               HttpSession session) throws ControllerException {

        User user = null;
        user = userService.getUserByEmailAndPassword(username, password);

        if (user!=null){
            session.setAttribute("userId",user.getId());
        }

        if (user != null) {
            ModelMap model = new ModelMap();
            List<Category> categoriesList = categoryService.getAllCategories();
            model.addAttribute("categories", categoriesList);
            return new ModelAndView(PagesPathEnum.HOME_PAGE.getPath(),model);
        } else {
            return new ModelAndView(PagesPathEnum.SIGN_IN_PAGE.getPath());
        }
    }
}
