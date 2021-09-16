package by.teachmeskills.eshop.controllers;


import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.Product;
import by.teachmeskills.eshop.repository.impl.SearchProductsRepositoryImpl;
import by.teachmeskills.eshop.utils.SearchParamGenerator;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/search")
public class SearchProductFilterController {

    private final SearchProductsRepositoryImpl searchProductsRepository;

    public SearchProductFilterController(SearchProductsRepositoryImpl searchProductsRepository) {
        this.searchProductsRepository = searchProductsRepository;
    }


    @GetMapping()
    public ModelAndView getSearchPage() throws ControllerException {
        return new ModelAndView(PagesPathEnum.FILTER_SEARCH_PAGE.getPath());
    }

    @GetMapping("/result")
    public ModelAndView getResultSearchPage(@RequestParam(required = false) String nameProduct,
                                            @RequestParam(required = false) String categoryId,
                                            @RequestParam(required = false) String priceFrom,
                                            @RequestParam(required = false) String priceTo,
                                            HttpSession session) throws ControllerException {


        SearchParamGenerator searchParamGenerator = new SearchParamGenerator();
        Map<String, String> searchParams = searchParamGenerator.generateSearchParams(nameProduct, categoryId, priceFrom, priceTo);
        session.setAttribute("searchParams",searchParams);

        int currentPage = 1;
        int recordsPerPage = 5;

        List<Product> productList = searchProductsRepository.findProductsListByParams(searchParams, currentPage, recordsPerPage);

        ModelMap model = new ModelMap();
        model.addAttribute("products", productList);

        return new ModelAndView(PagesPathEnum.FILTER_SEARCH_PAGE.getPath(), model);
    }

    @GetMapping("/result/page")
    public ModelAndView getResultSearchPageShow(@RequestParam() int currentPage,
                                                HttpSession session) throws ControllerException {
        Map<String, String> searchParams = (Map<String, String>) session.getAttribute("searchParams");
        int recordsPerPage = 5;
        List<Product> productList = searchProductsRepository.findProductsListByParams(searchParams, currentPage, recordsPerPage);
        ModelMap model = new ModelMap();
        model.addAttribute("products", productList);

        return new ModelAndView(PagesPathEnum.FILTER_SEARCH_PAGE.getPath(), model);
    }


}
