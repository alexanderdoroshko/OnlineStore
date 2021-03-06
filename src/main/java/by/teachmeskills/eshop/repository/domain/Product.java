package by.teachmeskills.eshop.repository.domain;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "products")
public class Product extends BaseEntity {
    private String name;
    private String description;
    private String image_path;
    private int price;
    private Category category;
    private List<Order> orders;

    private Product(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.description = builder.description;
        this.image_path = builder.image_path;
        this.price = builder.price;
        this.category = builder.category;
        this.orders = builder.orders;
    }

    public Product() {
    }

    @ManyToOne(optional = false, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "category_id", nullable = false)
    public Category getCategory() {
        return category;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    @Column(name = "IMAGE_PATH")
    public String getImage_path() {
        return image_path;
    }

    @Column(name = "price")
    public int getPrice() {
        return price;
    }

    @ManyToMany(mappedBy = "productsList", fetch=FetchType.EAGER)
    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static final class Builder {
        private int id;
        private int price;
        private Category category;
        private String name;
        private String description;
        private String image_path;
        private List<Order> orders;

        private Builder() {
        }

        public Builder withId(int id) {
            this.id = id;
            return this;
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withDescription(String description) {
            this.description = description;
            return this;
        }


        public Builder withImage_path(String image_path) {
            this.image_path = image_path;
            return this;
        }

        public Builder withPrice(int price) {
            this.price = price;
            return this;
        }

        public Builder withCategory(Category category) {
            this.category = category;
            return this;
        }

        public Builder withOrders(List<Order> orders){
            this.orders = orders;
            return this;
        }

        public Product build() {
            return new Product(this);
        }
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", image_path='" + image_path + '\'' +
                ", price=" + price +
                ", orders=" + orders +
                '}';
    }
}
