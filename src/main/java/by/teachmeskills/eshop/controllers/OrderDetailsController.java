package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.Order;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.service.OrderService;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/order/details")
public class OrderDetailsController {
    private final OrderService orderService;

    public OrderDetailsController(OrderService orderService) {
        this.orderService = orderService;
    }


    @GetMapping()
    public ModelAndView getOrderDetailsPage(@RequestParam int id) throws ServiceException {

        Order order = orderService.read(id).get();
        List<Product> productListByOrder = order.getProductsList();
        ModelMap model = new ModelMap();
        model.addAttribute("productListByOrder",productListByOrder);
        return new ModelAndView("orderdetails",model);
    }
}
