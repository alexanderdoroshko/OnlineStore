package by.teachmeskills.eshop.repository.domain;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "categories")
public class Category extends BaseEntity {
    private String name;
    private int rating;
    private String image_path;
    private List<Product> productList;

    private Category(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.rating = builder.rating;
        this.image_path = builder.image_path;
        this.productList = builder.productList;
    }

    public Category() {
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    @Column(name = "rating")
    public int getRating() {
        return rating;
    }

    @Column(name = "IMAGE_PATH")
    public String getImage_path() {
        return image_path;
    }

    @OneToMany(mappedBy = "category", cascade = CascadeType.REMOVE, fetch=FetchType.EAGER)
    public List<Product> getProductList() {
        return productList;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static final class Builder {
        private int id;
        private String name;
        private int rating;
        private String image_path;
        private List<Product> productList;

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

        public Builder withRating(int rating) {
            this.rating = rating;
            return this;
        }

        public Builder withImage_path(String image_path) {
            this.image_path = image_path;
            return this;
        }

        public Builder withProductList(List<Product> productList) {
            this.productList = productList;
            return this;
        }

        public Category build() {
            return new Category(this);
        }
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", rating=" + rating +
                ", image_path='" + image_path + '\'' +
                ", productList=" + productList +
                '}';
    }
}
