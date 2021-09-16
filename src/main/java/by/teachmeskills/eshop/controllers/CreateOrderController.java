package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.Order;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.OrderService;
import by.teachmeskills.eshop.service.UserService;
import by.teachmeskills.eshop.utils.Cart;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;

@RestController
@RequestMapping("/create/order")
public class CreateOrderController {
    private final UserService userService;
    private final OrderService orderService;


    public CreateOrderController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }


   @GetMapping()
    public ModelAndView getOrderPage(HttpSession session) throws ControllerException {
        Cart cart = (Cart) session.getAttribute("cart");
        User user = null;
        Object userId = session.getAttribute("userId");

        if (userId != null) {
            int userIdInt = (int) userId;
            user = userService.read(userIdInt).get();
        }


        if (user == null || cart == null) {
            ModelMap model = new ModelMap();
            model.addAttribute("error", "Чтобы сделать заказ вы должны войти в магазин");
            return new ModelAndView(PagesPathEnum.CREATE_ORDER.getPath(), model);
        } else {
            Date date = new Date();  // Дата

            Order order = Order.newBuilder().
                    withDate(date.toString()).
                    withPrice(cart.getTotalPrice()).
                    withListOfProducts(cart.getProducts()).
                    withUser(user).
                    build();

            orderService.create(order);

            ModelMap model = new ModelMap();
            model.addAttribute("orderComplete", "Заказ успешно оформлен");
            return new ModelAndView(PagesPathEnum.CREATE_ORDER.getPath(), model);
        }
    }
}
