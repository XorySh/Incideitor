package com.example.eoi.incideitor.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Collection;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ayuntamiento")
public class Ayuntamiento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;

    @Column(name = "FOTOCABECERA")
    private String fotoCabecera;

    @Column(name = "FOTOLOGIN")
    private String fotoLogin;

    private String foto3;
    private String foto4;

    @OneToMany
    private Collection<Usuario> usuarios;

}
