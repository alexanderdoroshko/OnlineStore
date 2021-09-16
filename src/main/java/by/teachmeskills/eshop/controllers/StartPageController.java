package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.service.CategoryService;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
@RequestMapping("/home")
public class StartPageController {
    private final CategoryService categoryService;

    public StartPageController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping()
    public ModelAndView getHomePage() throws ControllerException {
        ModelMap model = new ModelMap();
        List<Category> categoriesList = categoryService.getAllCategories();
        model.addAttribute("categories", categoriesList);

        return new ModelAndView(PagesPathEnum.HOME_PAGE.getPath(), model);
    }


}

