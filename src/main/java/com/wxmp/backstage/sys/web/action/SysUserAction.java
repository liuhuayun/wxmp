package com.wxmp.backstage.sys.web.action;

import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wxmp.backstage.sys.ISysUserService;
import com.wxmp.backstage.sys.domain.SysUser;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;


/**
 * 
 * @title : 
 * @description : 不返回json格式数据 | 只用于页面跳转分发 
 * @projectname : wxmp
 * @classname : ViewAction
 * @version 1.0
 * @author : hermit
 * @createtime : 2017年4月2日 下午12:00:39
 */
@Controller
@RequestMapping("sysuser")
public class SysUserAction {
	private static Logger log = LogManager.getLogger(SysUserAction.class);
	
	@Autowired
	private ISysUserService sysUserService;
	
	/**
	 * 个人基本信息
	 * @return
	 */
    @RequestMapping(value = "/mybaseinfo")
	public ModelAndView mybaseinfo(@RequestParam(required=false) String userId) {
    	ModelAndView mv = new ModelAndView("sysuser/mybaseinfo");
    	SysUser sysUser = sysUserService.getSysUserById(userId);
    	mv.addObject("sysUser", sysUser);
		return mv;
	}
    
	/**
	 * 
	 * @return
	 */
    @RequestMapping(value = "/loginpwd")
	public ModelAndView login(@RequestParam(required=false) String userId) {
    	ModelAndView mv = new ModelAndView("sysuser/loginpwd");
    	SysUser sysUser = sysUserService.getSysUserById(userId);
    	mv.addObject("sysUser", sysUser);
		return mv;
	}
    
	/**
	 * 
	 * @return
	 */
    @RequestMapping(value = "/updatepwdTip")
	public ModelAndView updatepwdok(@RequestParam(required=false) String userId) {
    	ModelAndView mv = new ModelAndView("sysuser/updatepwdTip");
		return mv;
	}
}