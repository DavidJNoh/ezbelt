package com.david.ezbelt.repositories;

import com.david.ezbelt.models.Show;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShowRepository extends CrudRepository<Show, Long> {
    List<Show> findAll();

    Show findByTitle(String title);

}
