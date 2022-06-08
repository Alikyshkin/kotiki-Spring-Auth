package kotiki.controllers;

import kotiki.model.Kotiki;
import kotiki.model.Owner;
import kotiki.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/owners")
@PreAuthorize("hasAuthority('ADMIN')")
public class OwnerController {

    private final OwnerService ownerService;

    private final KotikiService kotikiService;

    @Autowired
    public OwnerController(OwnerService ownerService, KotikiService kotikiService) {
        this.ownerService = ownerService;
        this.kotikiService = kotikiService;
    }


    @GetMapping
    public String findAll(Map<String, Object> model) {
        List<Owner> owners = ownerService.getAll();
        model.put("owners", owners);
        return "main/owners";
    }

    @PostMapping(path = "/create")
    public String create(@RequestParam String name,
                         @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
                         @RequestParam Integer userId) {

        ownerService.create(name, birthday, userId);
        return "redirect:/owners";
    }

    @PostMapping(path = "/update")
    public String update(@RequestParam Integer id,
                         @RequestParam(required = false) String name,
                         @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
                         @RequestParam Integer userId) {

        ownerService.update(id, name, birthday, userId);
        return "redirect:/owners";
    }

    @PostMapping(path = "/delete")
    public String delete(@RequestParam(required = false) Integer id) {
        ownerService.delete(id);
        return "redirect:/owners";
    }

    @PostMapping(path = "/getById")
    public String getById(Map<String, Object> model,
                          @RequestParam Integer id) {
        List<Owner> owners = ownerService.getById(id);
        model.put("owners", owners);
        return "main/owners";
    }

    @PostMapping(path = "/getKotiki")
    public String getKotiki(Map<String, Object> model,
                            @RequestParam Integer id) {
        List<Kotiki> allkotiki = kotikiService.getAll();
        List<Kotiki> kotiki = kotikiService.findOwnerKotiki(id, allkotiki);

        model.put("kotiki", kotiki);
        return "main/kotiki";
    }
}
