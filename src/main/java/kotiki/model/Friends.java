package kotiki.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Data
@NoArgsConstructor
@Table(name = "friends", schema = "public", catalog = "postgres")
public class Friends {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @Column(name = "kotik_1")
    private Integer kotik1;

    @Basic
    @Column(name = "kotik_2")
    private Integer kotik2;

    public Friends(int first, int second) {
        this.kotik1 = first;
        this.kotik2 = second;
    }
}
