package com.david.ezbelt.services;

import com.david.ezbelt.models.Rating;
import com.david.ezbelt.models.Show;
import com.david.ezbelt.models.User;
import com.david.ezbelt.repositories.RatingRepository;
import com.david.ezbelt.repositories.ShowRepository;
import com.david.ezbelt.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class MainService {
    private final UserRepository userRepository;
    private final ShowRepository showRepository;
    private final RatingRepository ratingRepository;


    public MainService(UserRepository x, ShowRepository y, RatingRepository z){
        this.userRepository = x;
        this.showRepository = y;
        this.ratingRepository = z;
    }
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }

    public List<Show> getAllShows(){
        return showRepository.findAll();
    }

    // find user by email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // find user by id
    public User findUserById(Long id) {
        Optional<User> u = userRepository.findById(id);

        if(u.isPresent()) {
            return u.get();
        } else {
            return null;
        }
    }

    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepository.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

    public Show newShow(Show show){
        return showRepository.save(show);
    }

    public boolean checkShow(String title){
        if(showRepository.findByTitle(title) == null){
            return true;
        }
        return false;
    }

    public boolean firstRating(User user, Show show){
        if(ratingRepository.checkTwice(user, show) == null){
            return true;
        }
        return false;
    }

    public Show getShowById(Long id){
        Optional<Show> u = showRepository.findById(id);

        if(u.isPresent()) {
            return u.get();
        } else {
            return null;
        }
    }

    public Rating saveRating(Rating rating){
        return ratingRepository.save(rating);
    }

    @Transactional
    public void deleteShowById(Long id){
        showRepository.deleteById(id);
    }

}
