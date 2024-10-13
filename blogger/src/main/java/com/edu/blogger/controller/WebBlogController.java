package com.edu.blogger.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.blogger.dto.Role;
import com.edu.blogger.dto.UserDTO;
import com.edu.blogger.dto.WebBlogDTO;
import com.edu.blogger.service.WebBlogService;

@Controller
public class WebBlogController {

	@Autowired
	private WebBlogService webBlogService;

	@RequestMapping(value = "/add-blog-page", method = RequestMethod.GET)
	protected String getAddBlogPage(HttpSession httpSession) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			return "add_blog";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/add-blog", method = RequestMethod.POST)
	protected String addBlog(@RequestParam(name = "title") String title, @RequestParam(name = "content") String content,
			@RequestParam(name = "author") String author, ModelMap modelMap, HttpSession httpSession) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		WebBlogDTO addedBlog = webBlogService.addBlog(title, content, author, user);
		if (addedBlog != null) {
			List<WebBlogDTO> blogs = webBlogService.findMyBlogs(user.getId());
			modelMap.addAttribute("blogs", blogs);
			return "my_blogs";
		} else {
			modelMap.addAttribute("message", "Something went wrong..");
			return "add_blog";
		}
	}

	@RequestMapping(value = "/blogs", method = RequestMethod.GET)
	protected String findAllBlogs(ModelMap modelMap, HttpSession httpSession) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			List<WebBlogDTO> blogs = webBlogService.findAllWebBlogs();
			if (blogs != null) {
				modelMap.addAttribute("blogs", blogs);
			} else {
				modelMap.addAttribute("message", "Blogs not found..");
			}
			modelMap.addAttribute("role", user.getRole());
			return "blogs";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/my-blogs", method = RequestMethod.GET)
	protected String findMyBlogs(ModelMap modelMap, HttpSession httpSession) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			List<WebBlogDTO> blogs = webBlogService.findMyBlogs(user.getId());
			if (blogs != null) {
				modelMap.addAttribute("blogs", blogs);
			} else {
				modelMap.addAttribute("message", "Blogs not found..");
			}
			return "my_blogs";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/delete-blog", method = RequestMethod.GET)
	protected String deleteBlog(@RequestParam(name = "blog-id") int blogId, @RequestParam(name = "user-id") int userId,
			ModelMap modelMap, HttpSession httpSession) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			WebBlogDTO deletedBlog = webBlogService.deleteBlog(blogId, userId);
			if (deletedBlog == null) {
				modelMap.addAttribute("message", "Something went wrong..");
			}
			List<WebBlogDTO> blogs = null;
			if (user.getRole().equals(Role.USER)) {
				blogs = webBlogService.findMyBlogs(user.getId());
				if (blogs != null) {
					modelMap.addAttribute("blogs", blogs);
				} else {
					modelMap.addAttribute("message", "Blogs not found..");
				}
				return "my_blogs";
			} else {
				blogs = webBlogService.findAllWebBlogs();
				if (blogs != null) {
					modelMap.addAttribute("blogs", blogs);
				} else {
					modelMap.addAttribute("message", "Blogs not found..");
				}
				modelMap.addAttribute("role", user.getRole());
				return "blogs";
			}
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/edit-blog", method = RequestMethod.GET)
	protected String getEditBlogPage(@RequestParam(name = "blog-id") int id, HttpSession httpSession, ModelMap modelMap) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			modelMap.addAttribute("blog", webBlogService.findBlogById(id));
			return "edit_blog";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/update-blog", method = RequestMethod.POST)
	protected String updateBlog(@RequestParam(name = "id") int id, @RequestParam(name = "title") String title,
			@RequestParam(name = "content") String content, @RequestParam(name = "author") String author,
			ModelMap modelMap, HttpSession httpSession) {
		WebBlogDTO updatedBlog = webBlogService.updateBlog(id, title, content, author);
		if (updatedBlog != null) {
			modelMap.addAttribute("message", "Blog updated..");
		} else {
			modelMap.addAttribute("message", "Something went wrong..");
		}
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		List<WebBlogDTO> blogs = webBlogService.findMyBlogs(user.getId());
		modelMap.addAttribute("blogs", blogs);
		return "my_blogs";
	}

	@RequestMapping(value = "/sort", method = RequestMethod.GET)
	protected String sortBlogs(@RequestParam(name = "index") int index, HttpSession httpSession, ModelMap modelMap) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			List<WebBlogDTO> sortedBlogs = webBlogService.sortBlogs(index);
			modelMap.addAttribute("blogs", sortedBlogs);
			modelMap.addAttribute("role", user.getRole());
			return "blogs";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	protected String searchBlogs(@RequestParam(name = "query") String query, HttpSession httpSession,
			ModelMap modelMap) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			List<WebBlogDTO> blogs = webBlogService.searchBlogs(query);
			if (blogs != null) {
				modelMap.addAttribute("blogs", blogs);
			} else {
				modelMap.addAttribute("message", "Blogs not found..");
			}
			modelMap.addAttribute("role", user.getRole());
			return "blogs";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/filter-blogs", method = RequestMethod.GET)
	protected String filterBlogs(@RequestParam(name = "category") String category, ModelMap modelMap, HttpSession httpSession) {
	    UserDTO user = (UserDTO) httpSession.getAttribute("user");
	    if (user != null) {
	        List<WebBlogDTO> blogs = null;
	        
	        if ("food".equals(category)) {
	            blogs = webBlogService.filterBlogsByCategory("food");
	        } else if ("traveling".equals(category)) {
	            blogs = webBlogService.filterBlogsByCategory("traveling");
	        } else if ("motivation".equals(category)) {
	            blogs = webBlogService.filterBlogsByCategory("motivation");
	        } else if ("gaming".equals(category)) {
	            blogs = webBlogService.filterBlogsByCategory("gaming");
	        } else if ("learning".equals(category)) {
	            blogs = webBlogService.filterBlogsByCategory("learning");
	        } else if ("all".equals(category)) {
	            blogs = webBlogService.findAllWebBlogs();
	        }

	        if (blogs != null && !blogs.isEmpty()) {
	            modelMap.addAttribute("blogs", blogs);
	        } else {
	            modelMap.addAttribute("message", "No results found.");
	        }
	        
	        modelMap.addAttribute("role", user.getRole());
	        return "blogs";
	    } else {
	        return "login";
	    }
	}


}