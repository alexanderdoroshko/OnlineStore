package by.teachmeskills.eshop.service;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface ProductService extends BaseService<Product> {

    int getCountOfProductsForCategory(int categoryId) throws ServiceException;

    List<Product> findProductsListByParams(Map<String, String> params, int currentPage, int recordsPerPage) throws ServiceException;

    Page<Product> findProductsByCategoryId(int categoryId, Pageable pageable) throws ServiceException;



}
