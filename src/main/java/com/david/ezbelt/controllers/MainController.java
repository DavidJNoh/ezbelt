package com.david.ezbelt.controllers;

import com.david.ezbelt.models.User;
import com.david.ezbelt.services.MainService;
import com.david.ezbelt.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class MainController {

    private final UserValidator userValidator;
    private final MainService userService;


    public MainController(UserValidator userValidator, MainService userService){
        this.userValidator = userValidator;
        this.userService = userService;
    }

    @RequestMapping("/")
    public String home(@ModelAttribute("user") User user){
        System.out.println("Dank");
        return "index.jsp";
    }

    @RequestMapping(value="/register", method= RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "index.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/";
    }
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @ModelAttribute("user") User user, @RequestParam("password") String password, Model model, HttpSession session) {
        boolean isAuthenticated = userService.authenticateUser(email, password);
        if(isAuthenticated) {
            User u = userService.findByEmail(email);
            session.setAttribute("userId", u.getId());
            return "redirect:/";
        } else {
            model.addAttribute("error", "Failed to Log In");
            return "index.jsp";
        }
    }
}
