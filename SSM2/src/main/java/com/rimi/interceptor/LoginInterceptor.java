package com.rimi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.rimi.bean.UserBean;

public class LoginInterceptor implements HandlerInterceptor {

	// 这个是在 controller 之前调用、执行的，通过返回值确定是否要被拦截
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UserBean ub = (UserBean) request.getSession().getAttribute("ub");
		UserBean loginUb =(UserBean) request.getSession().getAttribute("loginUb");
		System.out.println("进入拦截器方法");
		if (ub != null || loginUb !=null) {
			System.out.println("拦截器放行");
			return true;
		}else {
			System.out.println("拦截器拦截");
			response.sendRedirect("newlogin.do");
		}
		return false;
	}
	
	// 这个是在 controller 响应之后调用的，这个还没有到页面，在这里面你也可以对对应的 modelandview 进行操作
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}
	
	// 这是在整个请求完成以后调用
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
