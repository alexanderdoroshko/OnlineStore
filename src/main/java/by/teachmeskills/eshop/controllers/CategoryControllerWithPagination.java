package by.teachmeskills.eshop.controllers;

import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.Category;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.service.CategoryService;
import by.teachmeskills.eshop.service.ProductService;
import by.teachmeskills.eshop.utils.PageByCategory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

import static by.teachmeskills.eshop.PagesPathEnum.CATEGORY_PAGE;


@RestController
@RequestMapping("/category/pagination")
public class CategoryControllerWithPagination {
    private final ProductService productService;
    private final CategoryService categoryService;

    public CategoryControllerWithPagination(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }


    @GetMapping
    public ModelAndView getCategoryProducts(@RequestParam int categoryId,
                                            @RequestParam int pageNumber,
                                            @RequestParam int pageSize,
                                            @RequestParam String sortField,
                                            @RequestParam String sortDirection) throws ControllerException {

        ModelMap model = new ModelMap();
        //Get category
        Optional<Category> category = categoryService.read(categoryId);
        //Get sorted and paged list of products for category

        Sort sortOrder = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortField).ascending() : Sort.by(sortField).descending();

        Pageable pageable = PageRequest.of(pageNumber - 1, pageSize, sortOrder);
        Page<Product> productList = productService.findProductsByCategoryId(categoryId, pageable);

        PageByCategory pageByCategory = new PageByCategory(productService);  // Получение пагинации
        int [] countPageArray = pageByCategory.getArrayPage(categoryId,pageSize);

        model.addAttribute("pages",countPageArray);

        //Add list to category object
        if (category.isPresent()) {
            category.get().setProductList(productList.getContent());
            model.addAttribute("products", category.get().getProductList());
        }

        return new ModelAndView(CATEGORY_PAGE.getPath(), model);
    }
}
