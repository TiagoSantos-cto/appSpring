package br.com.contas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.contas.dao.UsuarioDAO;
import br.com.contas.modelo.Usuario;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO dao;
	
	@RequestMapping("/userForm")
	public String cadastra() {
		return "usuario/form";
	}
	
	@RequestMapping("/addUser")
	public String add(Usuario usuario, HttpSession session) {
		dao.insere(usuario);
		return "redirect:efetuaLogin";
	}
	
	@RequestMapping("/loginForm")
	public String formulario() {
		return "usuario/login";
	}
	
	 @RequestMapping("/efetuaLogin")
	  public String efetuaLogin(Usuario usuario, HttpSession session) {
	    
		 if(new UsuarioDAO().existeUsuario(usuario)) {
	      session.setAttribute("usuarioLogado", usuario); //guardo usuario na session
	      return "home";
	    }
		return "redirect:loginForm";  
	}
	 
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
	   session.invalidate();
	   return "redirect:loginForm";
	 }

}
