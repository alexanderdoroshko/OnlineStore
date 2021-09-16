package by.teachmeskills.eshop;

public enum PagesPathEnum {
    HOME_PAGE("home"),
    SIGN_IN_PAGE("signin"),
    CART_PAGE("cart"),
    PRODUCT_PAGE("product"),
    REGISTRATION_PAGE("registration"),
    ACCOUNT_PAGE("personalaccount"),
    CATEGORY_PAGE("category"),
    FILTER_SEARCH_PAGE("filtersearch"),
    CREATE_ORDER("createorder");

    private final String path;

    PagesPathEnum(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }
}
