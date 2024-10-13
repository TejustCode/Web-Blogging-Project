package com.edu.blogger.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.edu.blogger.dto.UserDTO;
import com.edu.blogger.dto.WebBlogDTO;

@Component
public class WebBlogDAO {

	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private EntityTransaction entityTransaction;

	public WebBlogDTO addBlog(WebBlogDTO webBlog) {
		openConnection();
		entityTransaction.begin();
		entityManager.persist(webBlog);
		entityTransaction.commit();
		closeConnection();
		return webBlog;
	}

	@SuppressWarnings("unchecked")
	public List<WebBlogDTO> findAllWebBlogs() {
		openConnection();
		Query query = entityManager.createQuery("SELECT blogs FROM WebBlogDTO blogs");
		List<WebBlogDTO> blogs = query.getResultList();
		closeConnection();
		return blogs;
	}

	private void openConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		entityManagerFactory = Persistence.createEntityManagerFactory("springmvc");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}

	private void closeConnection() {
		if (entityManagerFactory != null) {
			entityManagerFactory.close();
		}
		if (entityManager != null) {
			entityManager.close();
		}
		if (entityTransaction != null) {
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
			}

		}
	}

	public WebBlogDTO deleteBlog(int blogId, int userId) {
		openConnection();
		WebBlogDTO blog = entityManager.find(WebBlogDTO.class, blogId);
		UserDTO user = entityManager.find(UserDTO.class, userId);
		List<WebBlogDTO> blogs = user.getWebBlogs();
		WebBlogDTO blogToBeDeleted = null;
		for (WebBlogDTO b : blogs) {
			if (b.getId() == blogId) {
				blogToBeDeleted = b;
				break;
			}
		}
		blogs.remove(blogToBeDeleted);
		user.setWebBlogs(blogs);
		entityTransaction.begin();
		entityManager.persist(user);
		entityManager.remove(blog);
		entityTransaction.commit();
		closeConnection();
		return blog;

	}

	public List<WebBlogDTO> findMyBlogs(int userId) {
		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, userId);
		List<WebBlogDTO> blogs = user.getWebBlogs();
		closeConnection();
		return blogs;
	}

	public WebBlogDTO findBlogById(int id) {
		openConnection();
		WebBlogDTO blog = entityManager.find(WebBlogDTO.class, id);
		closeConnection();
		return blog;
	}

	public WebBlogDTO updateBlog(int id, String title, String content, String author) {
		openConnection();
		WebBlogDTO blog = entityManager.find(WebBlogDTO.class, id);
		blog.setTitle(title);
		blog.setContent(content);
		blog.setAuthor(author);
		entityTransaction.begin();
		entityManager.persist(blog);
		entityTransaction.commit();
		closeConnection();
		return blog;
	}

	@SuppressWarnings("unchecked")
	public List<WebBlogDTO> searchBlogs(String query) {
		openConnection();
		Query query2 = entityManager.createQuery("SELECT blogs FROM WebBlogDTO blogs WHERE blogs.title LIKE '%" + query
				+ "%' OR blogs.content LIKE '%" + query + "%' OR blogs.author LIKE '%" + query + "%'");
		List<WebBlogDTO> blogs = query2.getResultList();
		closeConnection();
		return blogs;
	}

}