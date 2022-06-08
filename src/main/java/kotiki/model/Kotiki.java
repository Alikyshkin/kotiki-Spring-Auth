package kotiki.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.*;

@Entity
@Data
@NoArgsConstructor
@Table(name = "kotiki", schema = "public", catalog = "postgres")
public class Kotiki {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @Column(name = "kotik_birthday")
    private Date kotikBirthday;

    @Basic
    @Column(name = "kotik_breed")
    @Enumerated(EnumType.STRING)
    private Breed kotikBreed;

    @Basic
    @Column(name = "kotik_color")
    @Enumerated(EnumType.STRING)
    private Color kotikColor;

    @Basic
    @Column(name = "kotik_name")
    private String kotikName;

    @Basic
    @Column(name = "owner_id")
    private Integer ownerId;

    public Kotiki(String name, Date birthday, Breed breed, Color color, Integer ownerId) {
        this.kotikName = name;
        this.kotikBirthday = birthday;
        this.kotikBreed = breed;
        this.kotikColor = color;
        this.ownerId = ownerId;
    }
}
