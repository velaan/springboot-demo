package fr.univlille.min2rien.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {  

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model, String error, String logout) {
        if (error != null) {
            model.addAttribute("resultError", "Identifiant ou mot de passe invalide");
        }

        if (logout != null) {
            model.addAttribute("resultMessage", "Vous êtes déconnecté");
        }

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
}
