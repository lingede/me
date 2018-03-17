package com.me.common.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.code.kaptcha.Constants;
import com.me.common.security.SystemAuthorizingUser;
import com.me.common.util.toolbox.StringUtil;

/**
 * 
 * @description：获取登录用户通用处理工具类
 * @author zlm
 * @version 创建时间：2016年8月19日  上午11:18:39
 */
public class SingletonLoginUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(SingletonLoginUtils.class);
	
	/**
	 * 验证验证码
	 * @param userInputCaptcha
	 * @return
	 */
	public static boolean validate() {
		// 获取Session中验证码
		Object captcha = ServletUtils.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		String registerCode = ServletUtils.getParameter("registerCode");
		if (StringUtil.isBlank(registerCode)) {
			return false;
		}
		boolean result = registerCode.equalsIgnoreCase(captcha.toString());
		return result;
	}
	
	/**
	 * 获取后台登录用户
	 * @return SystemAuthorizingUser
	 */
	public static SystemAuthorizingUser getSystemUser() {
		try {
			Subject subject = SecurityUtils.getSubject();
			SystemAuthorizingUser systemUser = (SystemAuthorizingUser) subject.getPrincipal();
			if (systemUser != null) {
				return systemUser;
			}
		} catch (UnavailableSecurityManagerException e) {
			logger.error("SystemUserServiceImpl.getSystemUser", e);
		} catch (InvalidSessionException e) {
			logger.error("SystemUserServiceImpl.getSystemUser", e);
		}
		return null;
	}
	
	/**
	 * 获取后台登录用户ID
	 * @return
	 */
	public static Long getSystemUserId(){
		return getSystemUser().getUserId();
	}
	
	/**
	 * 获取后台登录用户昵称
	 * @return
	 */
	public static String getSystemUserName(){
		return getSystemUser().getUserName();
	}
}
