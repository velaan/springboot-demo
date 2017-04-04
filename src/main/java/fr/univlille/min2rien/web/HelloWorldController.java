/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.univlille.min2rien.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author david
 */
@Controller
public class HelloWorldController {
    
    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String helloWorld(ModelMap model) {
        model.addAttribute("variableHello", "Hello World !!");
        return "helloworld";
    }
}
