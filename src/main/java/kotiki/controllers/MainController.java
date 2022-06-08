package kotiki.controllers;

import kotiki.model.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class MainController {
    @GetMapping("/")
    public String welcome(Map<String, Object> model,
                          @AuthenticationPrincipal User user) {

        model.put("user", user);
        return "main/main";
    }

}