package by.teachmeskills.eshop;

public enum RequestParamsEnum {
    LOGIN("username"),
    PASSWORD("password"),
    CATEGORY("categories"),
    COMMAND("command"),
    SHOPPING_CART("cart"),
    SHOPPING_CART_PRODUCTS("cartProductsList"),
    PRODUCT_ID("product_id"),
    PRODUCT("product");

    private final String value;

    RequestParamsEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
