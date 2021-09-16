package by.teachmeskills.eshop.repository;

import by.teachmeskills.eshop.exceptions.RepositoryException;
import by.teachmeskills.eshop.repository.domain.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

    Optional<Category> findByNameAndRating(String name, int rating) throws RepositoryException;

    Optional<Category> findAllByNameLike(String like) throws RepositoryException;

    @Query("SELECT c FROM Category c WHERE c.id =: id")
    Category findCategoryById(int id) throws RepositoryException;

    @Query(
            value = "SELECT * FROM Category c WHERE c.id =: id",
            nativeQuery = true)
    Category findCategoryNative(int id) throws RepositoryException;
}
