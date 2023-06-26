package com.example.eoi.incideitor.dtos;

import com.example.eoi.incideitor.entities.Usuario;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IncidenciaUsuarioDTO {
    private Integer id;
    private String titulo;
    private String descripcion;
    private Date fecha;
    private Usuario usuario;



}
