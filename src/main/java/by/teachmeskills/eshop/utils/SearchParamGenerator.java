package by.teachmeskills.eshop.utils;

import java.util.HashMap;
import java.util.Map;

public class SearchParamGenerator {

    public Map<String, String> generateSearchParams(String nameProduct,String categoryId, String priceFrom,String priceTo){
        Map<String ,String> params = new HashMap<>();

        if(validate(nameProduct)){
            params.put("nameProduct", nameProduct);
        }
        if(validate(categoryId)){
            params.put("categoryId", categoryId);
        }
        if(validate(priceTo)){
            params.put("priceTo", priceTo);
        }
        if(validate(priceFrom)){
            params.put("priceFrom", priceFrom);
        }

        return params;
    }

    public static boolean validate(String param){
        return param != null && !param.equals("");
    }

}
