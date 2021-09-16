package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.Order;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.OrderService;
import by.teachmeskills.eshop.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/personal/account")
public class PersonalAccountController {
    private final UserService userService;
    private final OrderService orderService;

    public PersonalAccountController(UserService userService, OrderService orderService) {
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping
    public ModelAndView getPersonalAccountPage(HttpSession session) throws ControllerException {

        Object userId = session.getAttribute("userId");

        if (userId != null) {
            int userIdInt = (int) userId;
            Optional<User> user = userService.read(userIdInt);

            String name = user.get().getName();
            String surname = user.get().getSurname();
            String email = user.get().getEmail();
            String dateOfBirthDay = user.get().getDateOfBirthday();
            int balance = user.get().getBalance();
            List<Order> userOrder = orderService.getAllOrderByUserId(userIdInt);

            ModelMap model = new ModelMap();
            model.addAttribute("name", name);
            model.addAttribute("surname", surname);
            model.addAttribute("email", email);
            model.addAttribute("dateOfBirthDay", dateOfBirthDay);
            model.addAttribute("balance", balance);
            model.addAttribute("userOrder", userOrder);

            return new ModelAndView(PagesPathEnum.ACCOUNT_PAGE.getPath(), model);

        } else {
            return new ModelAndView(PagesPathEnum.ACCOUNT_PAGE.getPath());
        }
    }
}



