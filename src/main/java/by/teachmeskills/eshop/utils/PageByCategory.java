package by.teachmeskills.eshop.utils;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.service.ProductService;
import org.springframework.stereotype.Component;

@Component
public class PageByCategory {
    private  final ProductService productService;

    public PageByCategory(ProductService productService) {
        this.productService = productService;
    }


    public  int [] getArrayPage(int categoryId,int pageSize) throws ServiceException {
        int countProductsByCategory = productService.getCountOfProductsForCategory(categoryId);   //Расчет количетва страниц и создание массива
        int pageCount = countProductsByCategory / pageSize;
        if (countProductsByCategory % pageSize != 0) {
            pageCount = pageCount + 1;
        }
        int[] countPageArray = new int[pageCount];
        for (int i = 0; i < countPageArray.length; i++) {
            countPageArray[i] = i + 1;
        }
        return countPageArray;
    }
}
