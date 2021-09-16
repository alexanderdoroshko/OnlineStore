package by.teachmeskills.eshop.service.impl;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.ProductRepository;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public int getCountOfProductsForCategory(int categoryId) throws ServiceException {
        return productRepository.countProductByCategory_Id(categoryId);
    }

    @Override
    public List<Product> findProductsListByParams(Map<String, String> params, int currentPage, int recordsPerPage) throws ServiceException {
        return null;
    }

    @Override
    public Page<Product> findProductsByCategoryId(int categoryId, Pageable pageable) throws ServiceException{
        return productRepository.findAllByCategory_Id(categoryId, pageable);
    }

    @Override
    public Product create(Product entity) throws ServiceException {
        return productRepository.save(entity);
    }

    @Override
    public Optional<Product> read(int id) throws ServiceException {
        return productRepository.findById(id);
    }

    @Override
    public void update(Product entity) throws ServiceException {
        productRepository.save(entity);
    }

    @Override
    public void delete(Product entity) throws ServiceException {
        productRepository.delete(entity);
    }
}
