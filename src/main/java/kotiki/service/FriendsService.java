package kotiki.service;

import kotiki.model.Friends;
import kotiki.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class FriendsService {

    private final FriendsRepository friendsRepo;

    @Autowired
    public FriendsService(FriendsRepository friendsRepo) {
        this.friendsRepo = friendsRepo;
    }

    public List<Friends> getAll() {
        return friendsRepo.findAll();
    }

    public void create(Integer kotik1, Integer kotik2) {
        Friends friend = new Friends(kotik1, kotik2);
        friendsRepo.save(friend);
    }

    public void update(Integer id, Integer kotik1, Integer kotik2) {
        Friends friend = friendsRepo.getById(id);
        if (kotik1 != null) {
            friend.setKotik1(kotik1);
        }
        if (kotik2 != null) {
            friend.setKotik2(kotik2);
        }

        friendsRepo.save(friend);
    }

    public Friends getById(Integer id) {
        return friendsRepo.findById(id).get();
    }

    public void delete(Integer id) {
        friendsRepo.deleteById(id);
    }

    public List<Integer> findKotikFriends(Integer id, List<Friends> friends) {
        List<Integer> friendsFound = new ArrayList();

        for (Friends friend : friends) {
            if (id == friend.getKotik1()) {
                friendsFound.add(friend.getKotik2());
            }
            if (id == friend.getKotik2()) {
                friendsFound.add(friend.getKotik1());
            }
        }

        Set<Integer> set = new HashSet<>(friendsFound);
        friendsFound.clear();
        friendsFound.addAll(set);

        return friendsFound;
    }
}