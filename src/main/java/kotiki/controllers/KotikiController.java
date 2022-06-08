package kotiki.controllers;

import kotiki.model.*;
import kotiki.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/kotiki")
@PreAuthorize("hasAuthority('ADMIN')")
public class KotikiController {

    private final KotikiService kotikiService;

    private final FriendsService friendsService;

    private final OwnerService ownerService;

    @Autowired
    public KotikiController(KotikiService kotikiService, FriendsService friendsService, OwnerService ownerService) {
        this.kotikiService = kotikiService;
        this.friendsService = friendsService;
        this.ownerService = ownerService;
    }

    @GetMapping
    public String findAll(Map<String, Object> model) {
        List<Kotiki> kotiki = kotikiService.getAll();
        List<Color> colors = List.of(Color.values());
        List<Breed> breeds = List.of(Breed.values());
        model.put("kotiki", kotiki);
        model.put("colors", colors);
        model.put("breeds", breeds);
        return "main/kotiki";
    }

    @PostMapping(path = "/create")
    public String create(@AuthenticationPrincipal User user,
                         @RequestParam String name,
                         @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
                         @RequestParam Breed breed,
                         @RequestParam Color color) {

        Integer ownerId = ownerService.findByUserId(user.getId());
        kotikiService.create(name, birthday, breed, color, ownerId);
        return "redirect:/kotiki";
    }

    @PostMapping(path = "/update")
    public String update(@RequestParam Integer id,
                         @RequestParam(required = false) String name,
                         @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
                         @RequestParam(required = false) Breed breed,
                         @RequestParam(required = false) Color color,
                         @RequestParam(required = false) Integer ownerId) {

        kotikiService.update(id, name, birthday, breed, color, ownerId);
        return "redirect:/kotiki";
    }

    @PostMapping(path = "/delete")
    public String delete(@RequestParam(required = false) Integer id) {
        kotikiService.delete(id);
        return "redirect:/kotiki";
    }

    @PostMapping(path = "/getById")
    public String getById(Map<String, Object> model,
                          @RequestParam Integer id) {
        List<Kotiki> kotiki = Collections.singletonList(kotikiService.getById(id));
        List<Color> colors = List.of(Color.values());
        List<Breed> breeds = List.of(Breed.values());
        model.put("colors", colors);
        model.put("breeds", breeds);
        model.put("kotiki", kotiki);
        return "main/kotiki";
    }

    @PostMapping(path = "/getByColor")
    public String getByColor(Map<String, Object> model,
                             @RequestParam Color color) {
        List<Kotiki> kotiki = kotikiService.findByColor(color);
        List<Color> colors = List.of(Color.values());
        List<Breed> breeds = List.of(Breed.values());
        model.put("colors", colors);
        model.put("breeds", breeds);
        model.put("kotiki", kotiki);
        return "main/kotiki";
    }

    @PostMapping(path = "/getByBreed")
    public String getByBreed(Map<String, Object> model,
                             @RequestParam Breed breed) {
        List<Kotiki> kotiki = kotikiService.findByBreed(breed);
        List<Color> colors = List.of(Color.values());
        List<Breed> breeds = List.of(Breed.values());
        model.put("colors", colors);
        model.put("breeds", breeds);
        model.put("kotiki", kotiki);
        return "main/kotiki";
    }

    @PostMapping(path = "/getByOwnerId")
    public String getByOwnerId(Map<String, Object> model,
                               @RequestParam Integer id) {
        List<Kotiki> allKotiki = kotikiService.getAll();
        List<Kotiki> kotiki = kotikiService.findOwnerKotiki(id, allKotiki);
        List<Color> colors = List.of(Color.values());
        List<Breed> breeds = List.of(Breed.values());
        model.put("colors", colors);
        model.put("breeds", breeds);
        model.put("kotiki", kotiki);
        return "main/kotiki";
    }

    @PostMapping(path = "/getFriends")
    public String getFriends(Map<String, Object> model,
                             @RequestParam Integer id) {
        List<Friends> friends = friendsService.getAll();
        List<Integer> kotikiId = friendsService.findKotikFriends(id, friends);
        List<Kotiki> kotiki = new ArrayList<>();

        for (Integer ids : kotikiId) {
            kotiki.add(kotikiService.getById(ids));
        }

        List<Color> colors = List.of(Color.values());
        List<Breed> breeds = List.of(Breed.values());
        model.put("colors", colors);
        model.put("breeds", breeds);

        model.put("kotiki", kotiki);
        return "main/kotiki";
    }
}
