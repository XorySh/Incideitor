package com.example.eoi.incideitor.controllers;


import com.example.eoi.incideitor.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Objects;

/**

 Controlador para la gestión de la administración.
 */
@Controller
@RequestMapping("${url.admin}")
public class AdminController {

    private final String entityName = "admin";

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    NotificacionController notificacionController;

    /**

     Muestra la vista principal del panel de administración.
     @param model El modelo de datos para la vista.
     @return El nombre de la plantilla de la vista.
     */
    @GetMapping(value={"/",""})
    public String mostrarIndex(Model model)
    {
        if (!Objects.equals(notificacionController.contarNotificaciones(model), "0")){
            String contador = notificacionController.contarNotificaciones(model);
            model.addAttribute("contador",contador);
        }
        model.addAttribute("entityName", entityName);
        model.addAttribute("nombreVista", "principal");
        return "index";
    }
}
