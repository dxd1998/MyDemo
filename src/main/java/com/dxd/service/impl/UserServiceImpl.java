package com.dxd.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxd.dao.UserMapper;
import com.dxd.pojo.User;
import com.dxd.service.UserService;

/**
 * 员工业务层实现类
 * @author 99266
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper mapper;
	
	/**
	 * 所有员工信息 可模糊查询
	 */
	public List<User> getAllUser(Map<String, Object> map) {
		return mapper.getAllUser(map);
	}

	/**
	 * 删除员工
	 */
	public int delUser(Integer uId) {
		return mapper.delUser(uId);
	}

	/**
	 * 查询指定员工
	 */
	public User getUserById(Integer uId) {
		return mapper.getUserById(uId);
	}

	/**
	 * 修改指定用户
	 */
	public int updateUser(User user) {
		return mapper.updateUser(user);
	}

	/**
	 * 添加员工信息
	 */
	public int addUser(User user) {
		return mapper.addUser(user);
	}

}
