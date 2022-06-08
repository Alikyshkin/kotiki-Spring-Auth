package kotiki.service;

import kotiki.model.Owner;
import kotiki.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OwnerService {

    private final OwnerRepository ownerRepo;

    @Autowired
    public OwnerService(OwnerRepository ownerRepo) {
        this.ownerRepo = ownerRepo;
    }

    public List<Owner> getAll() {
        return ownerRepo.findAll();
    }

    public void create(String name, Date birthday, Integer userId) {
        Owner owner = new Owner(name, birthday, userId);
        ownerRepo.save(owner);
    }

    public void update(Integer id, String name, Date birthday, Integer userId) {
        Owner owner = ownerRepo.getById(id);
        if (name != null) {
            owner.setOwnerName(name);
        }
        if (birthday != null) {
            owner.setOwnerBirthday(birthday);
        }
        if (userId != null) {
            owner.setUserId(userId);
        }

        ownerRepo.save(owner);
    }

    public List<Owner> getById(Integer id) {
        return Collections.singletonList(ownerRepo.findById(id).get());
    }

    public Integer findByUserId(Integer id) {
        List<Owner> owners = ownerRepo.findAll();

        for (Owner owner : owners) {
            if (owner.getUserId() == id) {
                return owner.getId();
            }
        }

        return null;
    }

    public void delete(Integer id) {
        ownerRepo.deleteById(id);
    }
}
