package kotiki.service;

import kotiki.model.*;
import kotiki.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class KotikiService {

    private final KotikiRepository kotikiRepo;

    @Autowired
    public KotikiService(KotikiRepository kotikiRepo) {
        this.kotikiRepo = kotikiRepo;
    }

    public List<Kotiki> getAll() {
        return kotikiRepo.findAll();
    }

    public void create(String name, Date birthday, Breed breed, Color color, Integer ownerId) {
        Kotiki kotiki = new Kotiki(name, birthday, breed, color, ownerId);
        kotikiRepo.save(kotiki);
    }

    public void update(Integer id, String name, Date birthday, Breed breed, Color color, Integer ownerId) {
        Kotiki kotik = kotikiRepo.getById(id);
        if (name != null) {
            kotik.setKotikName(name);
        }
        if (birthday != null) {
            kotik.setKotikBirthday(birthday);
        }
        if (color != null) {
            kotik.setKotikColor(color);
        }
        if (breed != null) {
            kotik.setKotikBreed(breed);
        }
        if (ownerId != null) {
            kotik.setOwnerId(ownerId);
        }

        kotikiRepo.save(kotik);
    }

    public Kotiki getById(Integer id) {
        return kotikiRepo.findById(id).get();
    }

    public void delete(Integer id) {
        kotikiRepo.deleteById(id);
    }

    public List<Kotiki> findOwnerKotiki(Integer id, List<Kotiki> kotiki) {
        List<Kotiki> kotikiFound = new ArrayList();

        for (Kotiki kotik : kotiki) {
            if (kotik.getOwnerId() == id) {
                kotikiFound.add(kotik);
            }
        }

        return kotikiFound;
    }

    public List<Kotiki> findByColor(Color color) {
        List<Kotiki> kotiki = kotikiRepo.findAll();
        List<Kotiki> foundKotiki = new ArrayList<>();

        for (Kotiki kotik : kotiki) {
            if (kotik.getKotikColor() == color) {
                foundKotiki.add(kotik);
            }
        }

        return foundKotiki;
    }

    public List<Kotiki> findByBreed(Breed breed) {
        List<Kotiki> kotiki = kotikiRepo.findAll();
        List<Kotiki> foundKotiki = new ArrayList<>();

        for (Kotiki kotik : kotiki) {
            if (kotik.getKotikBreed() == breed) {
                foundKotiki.add(kotik);
            }
        }

        return foundKotiki;
    }
}
