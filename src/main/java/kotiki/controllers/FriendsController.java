package kotiki.controllers;

import kotiki.model.Friends;
import kotiki.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/friends")
@PreAuthorize("hasAuthority('ADMIN')")
public class FriendsController {

    private final FriendsService friendsService;

    @Autowired
    public FriendsController(FriendsService friendsService) {
        this.friendsService = friendsService;
    }

    @GetMapping
    public String findAll(Map<String, Object> model) {
        List<Friends> friends = friendsService.getAll();
        model.put("friends", friends);
        return "main/friends";
    }

    @PostMapping(path = "/create")
    public String create(@RequestParam Integer kotik1,
                         @RequestParam Integer kotik2) {

        friendsService.create(kotik1, kotik2);
        return "redirect:/friends";
    }

    @PostMapping(path = "/update")
    public String update(@RequestParam Integer id,
                         @RequestParam(required = false) Integer kotik1,
                         @RequestParam(required = false) Integer kotik2) {

        friendsService.update(id, kotik1, kotik2);
        return "redirect:/friends";
    }

    @PostMapping(path = "/delete")
    public String delete(@RequestParam(required = false) Integer id) {
        friendsService.delete(id);
        return "redirect:/friends";
    }

    @PostMapping(path = "/getById")
    public String getById(Map<String, Object> model,
                          @RequestParam Integer id) {
        List<Friends> friends = Collections.singletonList(friendsService.getById(id));
        model.put("friends", friends);
        return "main/friends";
    }
}
