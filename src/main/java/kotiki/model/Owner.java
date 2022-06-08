package kotiki.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = "owner", schema = "public", catalog = "postgres")
public class Owner {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @Column(name = "owner_birthday")
    private Date ownerBirthday;

    @Basic
    @Column(name = "owner_name")
    private String ownerName;

    @Basic
    @Column(name = "userId")
    @CollectionTable(name = "users", joinColumns = @JoinColumn(name = "user_id"))
    private Integer userId;

    public Owner(String name, Date birthday, Integer userId) {
        this.ownerName = name;
        this.ownerBirthday = birthday;
        this.userId = userId;
    }
}
