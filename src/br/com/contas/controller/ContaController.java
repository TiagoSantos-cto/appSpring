package br.com.contas.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.contas.dao.ContaDAO;
import br.com.contas.modelo.Conta;


/**
 *  O CONTROLADOR - depende do --> DAO - que depende do --> DATASOURCE definido no xml.
 */
@Controller
public class ContaController {

	private ContaDAO dao;

	@Autowired
	public ContaController(ContaDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping("/form")
	public String executa() {
		return "conta/formulario";
	}

	@RequestMapping("/adicinaConta")
	public String adiciona(@Valid Conta conta, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println("Erro no formulario");
			return "redirect:form";
		}
		dao.adiciona(conta);
		return "redirect:listaContas";
	}

	@RequestMapping("/removeConta")
	public String remove(Conta conta) {
		dao.remove(conta);
		return "redirect:listaContas";
	}

	@RequestMapping("/listaContas")
	public ModelAndView lista() {
		List<Conta> contas = dao.lista();
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("todasContas", contas);
		return mv;
	}

	@RequestMapping("/mostraConta")
	public ModelAndView mostra(Conta conta) {
		Conta c = dao.buscaPorId(conta.getId());
		ModelAndView mv = new ModelAndView("conta/mostra");
		mv.addObject("conta", c);
		return mv;
	}

	@RequestMapping("/alteraConta")
	public String altera(Conta conta) {
		dao.altera(conta);
		return "redirect:listaContas";
	}

	// AJAX
	@RequestMapping("/pagaConta")
	public void paga(Long id, HttpServletResponse response) {
		dao.paga(id);
		response.setStatus(200);
	}

}
