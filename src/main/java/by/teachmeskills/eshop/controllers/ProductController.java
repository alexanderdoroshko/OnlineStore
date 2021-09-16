package by.teachmeskills.eshop.controllers;


import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public ModelAndView getProduct(@RequestParam int id) throws ControllerException {
        ModelMap model = new ModelMap();

        Optional<Product> product = productService.read(id);
        model.addAttribute("product", product.get());

        return new ModelAndView(PagesPathEnum.PRODUCT_PAGE.getPath(), model);
    }
}
