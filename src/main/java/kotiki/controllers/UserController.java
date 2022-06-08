package kotiki.controllers;

import kotiki.model.*;
import kotiki.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String findAll(Map<String, Object> model) {
        List<User> users = userService.getAll();
        List<Role> roles = userService.getRoles();
        model.put("roles", roles);
        model.put("users", users);
        return "main/users";
    }

    @PostMapping(path = "/create")
    public String create(@RequestParam String username,
                         @RequestParam String password,
                         @RequestParam String role) {

        Role roles = Role.valueOf(role);
        userService.create(username, password, true, Collections.singleton(roles));
        return "redirect:/users";
    }

    @PostMapping(path = "/delete")
    public String delete(@RequestParam(required = false) Integer id) {
        userService.delete(id);
        return "redirect:/users";
    }

    @PostMapping(path = "/getById")
    public String getById(Map<String, Object> model,
                          @RequestParam Integer id) {
        List<User> users = userService.getById(id);
        List<Role> roles = userService.getRoles();
        model.put("users", users);
        model.put("roles", roles);
        return "main/users";
    }
}
