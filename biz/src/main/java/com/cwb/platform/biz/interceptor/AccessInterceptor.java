package com.cwb.platform.biz.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.cwb.platform.sys.constant.Dict;
import com.cwb.platform.sys.model.SysGn;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.sys.service.GnService;
import com.cwb.platform.sys.service.YhService;
import com.cwb.platform.util.commonUtil.JwtUtil;
import com.cwb.platform.util.spring.SpringContextUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * 访问接口控制
 *
 * @author 李彬彬
 *
 */
@Slf4j
public class AccessInterceptor extends HandlerInterceptorAdapter {

	private GnService gnService;

	private YhService yhService;

	private StringRedisTemplate redisDao;

	// 只要登录的用户都能访问
	private List<String> whiteList = Arrays.asList("/api/gn/getMenuTree","/api/jg/pager","/api/jg/getTree","/api/gn/getMenuTree","/api/jg/pager","/api/jg/getOrgTree","/api/jg/getOrgTree","/api/clsbyxsjjl/history","/api/clsbyxsjjl/history","/api/files/");

	public AccessInterceptor() {
	}

	public AccessInterceptor(StringRedisTemplate redisTemp) {
		this.gnService = SpringContextUtil.getBean(GnService.class);
		this.yhService = SpringContextUtil.getBean(YhService.class);
		this.redisDao = redisTemp;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 查看请求类型
		String method = request.getMethod();
		if (method.equals("OPTIONS")) {
			// 如果收到的是跨域预请求消息，直接响应，返回true，以便后续跨域请求成功
			return true;
		}

		// todo 测试代码
//		if (true)return true;
		// 访问权限值
		// String userid = "1";
		// String token =
		// "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ3Y3BtcyIsImF1ZCI6IndjcG1zIiwibG9naW5OYW1lIjoiYWRtaW5pIiwiaXNzIjoid2NwbXMiLCJ1c2VySWQiOiIxIn0.vok82zo-zveVlXrjKxgJiRRdXqKGpv1PFBngxhyR-Cg";
		String userid = request.getHeader("userid");
		String token = request.getHeader("token");
		String url = request.getHeader("url");

		if (token == null)
			token = request.getParameter("token");
		if (userid == null)
			userid = request.getParameter("userid");
		if (StringUtils.isEmpty(userid) || StringUtils.isEmpty(token)) {
			return false;
		}
		log.debug("访问地址[{}], 请求openid[{}],请求token[{},header请求地址[{}]]", request.getRequestURI(), userid, token, url);

		// 验证用户状态
		SysYh user = yhService.findById(userid);
		if (!Dict.UserStatus.VALID.getCode().equals(user.getZt())) {
			return false;
		}
		try {
			// 验证访问者是否合法
			String userId = JwtUtil.getClaimAsString(token, "userId");
			if (!userid.equals(userId)) {
				return false;
			}
			String value = redisDao.boundValueOps(userid).get();
			if (StringUtils.isEmpty(value) || !value.equals(token)) {
				return false;
			}
			request.setAttribute("userInfo", user);
			request.setAttribute("orgCode", user.getJgdm());
			String userInfoJson = redisDao.boundValueOps(userid + "-userInfo").get();
			ObjectMapper mapper = new ObjectMapper();
			SysYh userInfo = mapper.readValue(userInfoJson, SysYh.class);
			if (!whiteList.contains(request.getRequestURI()) && !"su".equals(userInfo.getLx())) { // su 用户可访问所有权限
				if (!checkPermission(userInfo, request)) {
					request.getRequestDispatcher("/403").forward(request, response);
					return false;
				}
			}
		} catch (Exception e) {
			return false;
		}

		return super.preHandle(request, response, handler);
	}

	private boolean checkPermission(SysYh user, HttpServletRequest request) throws IOException {
		List<SysGn> functions = gnService.getUserFunctions(user);
		if (functions == null || functions.size() == 0)
			return false;

		String uri = request.getRequestURI();
		String apiPrefix = uri.substring(0, uri.indexOf("/", 5) + 1);
		for (SysGn function : functions) {
			if (StringUtils.isEmpty(function.getApiQz()))
				continue;
			if (function.getApiQz().contains(apiPrefix))
				return true;
		}
		return false;
	}
}
