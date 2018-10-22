package com.david.ezbelt.controllers;

import com.david.ezbelt.models.Rating;
import com.david.ezbelt.models.Show;
import com.david.ezbelt.models.User;
import com.david.ezbelt.services.MainService;
import com.david.ezbelt.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.persistence.PreUpdate;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

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
        return "index.jsp";
    }

    @RequestMapping("/shows/new")
    public String newShow(@ModelAttribute("show") Show show){
        return "new.jsp";
    }

    @RequestMapping(value="/shows/new", method = RequestMethod.POST)
    public String newEvent(@Valid @ModelAttribute("show") Show show, BindingResult result, Model model) {
        if (userService.checkShow(show.getTitle())==false){
            System.out.println("dank");
            model.addAttribute("error", "Title already exists");
            return "new.jsp";
        }

        if (result.hasErrors()) {
            return "new.jsp";
        }

        userService.newShow(show);
        return "redirect:/shows";
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
            return "redirect:/shows";
        } else {
            model.addAttribute("error", "Failed to Log In");
            return "index.jsp";
        }
    }

    @RequestMapping("/shows")
    public String dashboard(HttpSession session, Model model) {
        if ((session.getAttribute("userId") == null)) {
            return "redirect:/";
        }
        else {
            String StringFirst = String.valueOf(session.getAttribute("userId"));
            Long userId = Long.parseLong(StringFirst);
            User u = userService.findUserById(userId);
            model.addAttribute("user", u);
            List<Show> shows = userService.getAllShows();
            model.addAttribute("shows", shows);
            return "dashboard.jsp";
        }
    }

    @RequestMapping("/shows/{id}")
    public String oneShow(@PathVariable Long id, Model model,HttpSession session){
        Show s = userService.getShowById(id);
        model.addAttribute("show", s);

        String StringFirst = String.valueOf(session.getAttribute("userId"));
        Long userId = Long.parseLong(StringFirst);
        User u = userService.findUserById(userId);

        if(userService.firstRating(u, s)){
            System.out.println("Did not rate");
        }

        if(userService.firstRating(u, s)==false){
            System.out.println("Already rate");
        }
//        for (int i=0; s.getRatings().size()>i; i++){
//            System.out.println("Number of Ratings");
//        }
        double avg;
        double total=0;
        for (Rating r : s.getRatings()){
            total += r.getScore();
        }

        System.out.print(total);


        return "show.jsp";
    }

    @RequestMapping(value="/shows/{id}", method = RequestMethod.POST)
    public String rate(@RequestParam("score") int score, Model model, @PathVariable Long id, HttpSession session){
        String StringFirst = String.valueOf(session.getAttribute("userId"));
        Long userId = Long.parseLong(StringFirst);
        User u = userService.findUserById(userId);

        Rating rating = new Rating(score);

        rating.setUser(u);
        Show s = userService.getShowById(id);
        rating.setShow(s);

        if(!userService.firstRating(u, s)){
            model.addAttribute("show", s);
            return "show.jsp";
        }
        u.addRating(rating);
        s.addRating(rating);
        userService.newShow(s);
        userService.registerUser(u);
        userService.saveRating(rating);

        double avg;
        double total=0;
        for (Rating r : s.getRatings()){
            total += r.getScore();
        }

        avg = total/(s.getRatings().size());

        s.setAverage(avg);

        userService.newShow(s);


        return "redirect:/shows/"+id;
    }

    @RequestMapping("/shows/{id}/edit")
    public String editShow(@ModelAttribute("show") Show show, @PathVariable Long id, Model model,HttpSession session){
        Show s = userService.getShowById(id);
        model.addAttribute("show", s);
        session.setAttribute("title", s.getTitle());
        String StringFirst = String.valueOf(session.getAttribute("title"));
        System.out.println(StringFirst);
        return "edit.jsp";
    }

    @RequestMapping(value="/shows/{id}/edit", method=RequestMethod.POST)
    public String update(HttpSession session, Model model, @PathVariable Long id,@Valid @ModelAttribute("show") Show show, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        }
        String StringFirst = String.valueOf(session.getAttribute("title"));
        System.out.println(StringFirst);
        System.out.println(show.getTitle());

        if (show.getTitle().equalsIgnoreCase(StringFirst)){
                System.out.println("No Bueno");
                Show s = userService.getShowById(id);
                s.setTitle(show.getTitle());
                s.setNetwork(show.getNetwork());
                userService.newShow(s);
                return "redirect:/shows";
        }
        else{
            if (userService.checkShow(show.getTitle())==false){
                System.out.println("dank");
                model.addAttribute("error", "Title already exists");
                Show s = userService.getShowById(id);
                model.addAttribute("show", s);
                return "edit.jsp";
            }
             else {
                Show s = userService.getShowById(id);
                s.setTitle(show.getTitle());
                s.setNetwork(show.getNetwork());
                userService.newShow(s);
                return "redirect:/shows";
            }
        }
    }

    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public String deleteEvent(@PathVariable Long id, HttpSession session){
        userService.deleteShowById(id);
        return "redirect:/shows";
    }
    }
