package com.bodawb.factorycontrol.jijia.shiro;

import java.lang.reflect.InvocationTargetException;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.bodawb.factorycontrol.jijia.dao.UserMapper;
import com.bodawb.factorycontrol.jijia.pojo.User;
import com.bodawb.factorycontrol.jijia.service.RegisterAndLoginI;
import com.bodawb.factorycontrol.jijia.util.PrintUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import org.springframework.beans.factory.annotation.Autowired;

public class SystemAuthorizingRealm extends AuthorizingRealm {
	private RegisterAndLoginI registerAndLoginI;

	public RegisterAndLoginI getRegisterAndLoginI() {
		return registerAndLoginI;
	}
@Autowired
	public void setRegisterAndLoginI(RegisterAndLoginI registerAndLoginI) {
		this.registerAndLoginI = registerAndLoginI;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
	

		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken) throws AuthenticationException {
		//获取基于用户名和密码的令牌
		//实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

//从数据库中查询用户用信息
		User user = registerAndLoginI.getUserByEmail(token.getUsername());
		PrintUtil.printDiy("打印user", JSON.toJSONString(user));
		if (user != null) {
			//此处无需比对,比对的逻辑Shiro会做,我们只需返回一个和令牌相关的正确的验证信息
			return new SimpleAuthenticationInfo(user.getEmail(), user
					.getPassword(), getName());
		} else {
			//没有返回登录用户名对应的SimpleAuthenticationInfo对象时,就会在LoginController中抛出UnknownAccountException异常
			return null;
		}

	}
	
	
	/**
	 * 认证回调函数, 登录时调用
	 * Shiro登录认证(原理：用户提交 用户名和密码  --- shiro 封装令牌 ---- realm 通过用户名将密码查询返回 ---- shiro 自动去比较查询出密码和用户输入密码是否一致---- 进行登陆控制
	 * 该方法的调用时机为LoginController.login()方法中执行Subject.login()时 
	 */
	
	/*protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
			throws AuthenticationException {
		// 获取基于用户名和密码的令牌：实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

		Administrators user = userService.getByLoginName(token.getUsername());

		if (user == null) {
			throw new UnknownAccountException();// 没找到帐号
		}

		if (StatusEnum.FREEZE.getStatus().equals(user.getStatus())) {
			throw new DisabledAccountException();// 校验用户状态
		}

		AuthorizingUser authorizingUser = new AuthorizingUser();
		BeanUtils.copyProperties(user, authorizingUser);

		// 认证缓存信息
		return new SimpleAuthenticationInfo(authorizingUser, user.getLoginPassword(),
				ByteSource.Util.bytes(authorizingUser.getCredentialsSalt()), getName());
	}*/
	
	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 * 经测试:本例中该方法的调用时机为需授权资源被访问时 
	 * 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache 
	 * 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache 
	 */
/*	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		AuthorizingUser authorizingUser = (AuthorizingUser) principalCollection.getPrimaryPrincipal();

		if(authorizingUser != null){
			//权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）  
			SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
			
			//获得用户角色列表
			UserRoleDTO userRoleDTO = userRoleService.getByUserId(authorizingUser.getUserId(),
					StatusEnum.NORMAL.getStatus());
			simpleAuthorizationInfo.addRoles(userRoleDTO.getRoleSigns());
			
			//获得权限列表
			Set<String> roleMenus = roleMenuService.getByRolesId(userRoleDTO.getRoleIds(),
					StatusEnum.NORMAL.getStatus());
			simpleAuthorizationInfo.addStringPermissions(roleMenus);
    		return simpleAuthorizationInfo;  
		}
		return null;
	}*/
}
