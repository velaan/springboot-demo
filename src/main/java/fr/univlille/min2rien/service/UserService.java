package fr.univlille.min2rien.service;

import fr.univlille.min2rien.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
