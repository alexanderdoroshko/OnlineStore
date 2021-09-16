package by.teachmeskills.eshop.utils;



import by.teachmeskills.eshop.repository.domain.Product;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static by.teachmeskills.eshop.RequestParamsEnum.SHOPPING_CART;

public class Cart {
    private Map<Integer, Product> products;
    private int totalPrice = 0;

    public Cart() {
        this.products = new HashMap<>();
    }

    public void addProduct(Product product) {
        products.put(product.getId(), product);
        totalPrice += product.getPrice();
    }

    public void removeProduct(int productId) {
        Product product = products.get(productId);
        products.remove(productId);
        totalPrice -= product.getPrice();
    }

    public List<Product> getProducts() {
        return new ArrayList<>(products.values());
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void clear() {
        products.clear();
    }

    @Override
    public String toString() {
        return "Cart{" +
                "products=" + products +
                ", totalPrice=" + totalPrice +
                '}';
    }
    public  static Cart initialize(HttpSession session){
        Cart cart;
        Object objCart = session.getAttribute("cart");

        if (objCart != null) {
            cart = (Cart) objCart;
        } else {
            cart = new Cart();
            session.setAttribute(SHOPPING_CART.getValue(), cart); //"cart"
        }
        return cart;
    }




}
