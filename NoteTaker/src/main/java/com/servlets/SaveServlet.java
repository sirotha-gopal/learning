package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Note;
import com.utility.FactoryProvider;

@SuppressWarnings("deprecation")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int i = 0;
	public SaveServlet() {
		super();
		System.out.println("No of times servlet is being called."+ ++i);
		System.out.println("servelt constructor First");
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("init First");
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(req, resp);
		String reqName = req.getMethod();
		
		System.out.println(reqName);
		System.out.println("Service method is being called");
		
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action = request.getParameter("action");
		switch (action) {
		case "allnotes":
			showAllNotes(request, response);
			break;
		case "delete":
			deleteNote(request, response);
			break;
		case "edit":
			editNote(request, response);
			break;


		default:
			break;
		}
	}
	
	private void editNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		int noteId = Integer.parseInt(request.getParameter("id").trim());
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Note n = s.get(Note.class,noteId);
		n.setContent(content);
		n.setTitle(title);
		s.update(n);
			
		tx.commit();
		s.close();
		System.out.println("here");
		showAllNotes(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		switch (action) {
		case "addnotes":
			addNotest(request, response);
			break;
		case "edit":
			editNote(request, response);
			break;
		
		default:
			break;
		}

		
	}

	private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Here");
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		int noteId = Integer.parseInt(request.getParameter("id").trim());
		Note n = s.get(Note.class,noteId);
		s.delete(n);
			
		tx.commit();
		s.close();
		System.out.println("here");
		showAllNotes(request, response);
		
	}

	private void addNotest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Note note = new Note();
		note.setContent(content);
		note.setTitle(title);
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		System.out.println(note.getContent());
		System.out.println(note.getTitle());
		s.save(note);

		tx.commit();
		s.close();

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.getRequestDispatcher("AddNote.jsp").forward(request, response);
		;
	}

	private void showAllNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session s = FactoryProvider.getFactory().openSession();
		Query q= s.createQuery("from Note");
		List<Note> list = q.list();
//		for(Note note : list) {
//			System.out.println(note.getId());
//			System.out.println(note.getContent());
//			System.out.println(note.getTitle());
//		}
		request.setAttribute("list",list);
		request.getRequestDispatcher("ShowNotes.jsp").forward(request, response);
	}

}
