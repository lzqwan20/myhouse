package com.gzy.web.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gzy.damain.User;
import com.gzy.service.UserService;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取表单内容
		String username = request.getParameter("username");
		String userpassword = request.getParameter("userpassword");
		System.out.println(username);
		System.out.println(userpassword);
		
		//传递到service层
		UserService service=new UserService();
		
		//接收service得到的结果
		User user=null;
		try {
			user=service.login(username,userpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//根据结果做出不同的反应
		if(user!=null){
			System.out.println("hello");
		}else{
			//用户不存在
			request.setAttribute("loginInfo", "用户名或者密码错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
