package by.teachmeskills.eshop.repository;

import by.teachmeskills.eshop.exceptions.RepositoryException;
import by.teachmeskills.eshop.repository.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findAllByUserId(int id) throws RepositoryException;
}
