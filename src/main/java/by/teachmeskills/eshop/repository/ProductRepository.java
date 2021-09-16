package by.teachmeskills.eshop.repository;

import by.teachmeskills.eshop.exceptions.RepositoryException;
import by.teachmeskills.eshop.repository.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    Page<Product> findAllByCategory_Id(int categoryId, Pageable pageable) throws RepositoryException;

    int countProductByCategory_Id(int id) throws RepositoryException;
}
