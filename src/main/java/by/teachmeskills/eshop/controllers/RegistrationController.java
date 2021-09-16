package by.teachmeskills.eshop.controllers;


import by.teachmeskills.eshop.PagesPathEnum;
import by.teachmeskills.eshop.exceptions.ControllerException;
import by.teachmeskills.eshop.repository.domain.User;
import by.teachmeskills.eshop.service.UserService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@RestController
@RequestMapping("/registration")
public class RegistrationController {
    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping()
    public ModelAndView getRegistrationPage() throws ControllerException {
        return new ModelAndView(PagesPathEnum.REGISTRATION_PAGE.getPath());
    }


    @PostMapping("/new/user")
    public ModelAndView createNewUser(@ModelAttribute("user") @Valid User user, BindingResult bindingResult, ModelAndView modelAndView) throws ControllerException {

        if (bindingResult.hasErrors()) {
            populateError("email", modelAndView, bindingResult);
            populateError("password", modelAndView, bindingResult);

            modelAndView.setViewName(PagesPathEnum.REGISTRATION_PAGE.getPath());
            return modelAndView;
        }
        userService.create(user);
        return new ModelAndView(PagesPathEnum.SIGN_IN_PAGE.getPath());
    }

    private void populateError(String field, ModelAndView model, BindingResult bindingResult) {
        if (bindingResult.hasFieldErrors(field)) {
            model.addObject(field + "Error", bindingResult.getFieldError(field)
                    .getDefaultMessage());
        }
    }

}
