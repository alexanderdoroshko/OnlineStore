package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.utils.Cart;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/cart")
public class CartController {

    private final ProductService productService;

    public CartController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping()
    public ModelAndView getCartPage(HttpSession session) throws ControllerException {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            List<Product> productList = cart.getProducts();
            int totalPrice = cart.getTotalPrice();
            ModelMap model = new ModelMap();
            model.addAttribute("cartProductsList", productList);
            model.addAttribute("totalPrice", totalPrice);
            return new ModelAndView(PagesPathEnum.CART_PAGE.getPath(), model);
        } else {
            return new ModelAndView((PagesPathEnum.CART_PAGE.getPath()));
        }
    }

    @GetMapping("/add/product")
    public ModelAndView addProductToCart(@RequestParam int productId, HttpSession session) throws ControllerException {
        ModelMap model = new ModelMap();
        Optional<Product> product = productService.read(productId);
        Cart cart = Cart.initialize(session);
        cart.addProduct(product.get());
        model.addAttribute("product", product.get());

        return new ModelAndView(PagesPathEnum.PRODUCT_PAGE.getPath(), model);
    }

    @GetMapping("/delete/product")
    public ModelAndView deleteProductFromCart(@RequestParam(required = false) int productId, HttpSession session) throws
            ControllerException {
        Optional<Product> product = productService.read(productId);
        Cart cart = (Cart) session.getAttribute("cart");
        cart.removeProduct(product.get().getId());
        List<Product> productList = cart.getProducts();
        int totalPrice = cart.getTotalPrice();
        ModelMap model = new ModelMap();
        model.addAttribute("cartProductsList", productList);
        model.addAttribute("totalPrice", totalPrice);
        return new ModelAndView(PagesPathEnum.CART_PAGE.getPath(), model);
    }

}
