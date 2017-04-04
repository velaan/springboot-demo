package fr.univlille.min2rien.repository;

import fr.univlille.min2rien.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Long> {
    
    // par nom : de méthode. Cf doc ==> http://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation
    User findByUsername(String username);
    
    // par query jpa
    @Query(value = "select u from User u where u.firstname = ?1")
    List<User> findUsersJPA(String firstname);    
    
    // par requête native SQL
    @Query(value = "select * from user where first_name = ?1", nativeQuery = true)
    List<User> findUsersSQL(String firstname);  
    
}
