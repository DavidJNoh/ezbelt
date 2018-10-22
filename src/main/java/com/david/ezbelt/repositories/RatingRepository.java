package com.david.ezbelt.repositories;

import com.david.ezbelt.models.Rating;
import com.david.ezbelt.models.Show;
import com.david.ezbelt.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
    List<Rating> findAll();

    @Query("SELECT r FROM Rating r WHERE r.user =?1 AND r.show =?2")
    Rating checkTwice(User user, Show show);
}
