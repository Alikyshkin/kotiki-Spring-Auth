package kotiki.controllers;

import kotiki.model.Role;
import kotiki.model.User;
import kotiki.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class RegistrationController {

    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String registration() {
        return "registration";
    }

    @PostMapping("/register")
    public String addUser(Map<String, Object> model,
                          @RequestParam(required = false) String username,
                          @RequestParam(required = false) String password) {
        Optional<User> userResult = userService.findByUserName(username);
        if (userResult.isPresent()
                || username.isBlank()
                || password.isBlank()
        ) {
            model.put("message", "username already exists");
            return "registration";
        }
        userService.create(username, password, true, Collections.singleton(Role.USER));
        return "redirect:/login";
    }
}