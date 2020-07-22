package com.dxd.service;

import java.util.List;
import java.util.Map;

import com.dxd.pojo.User;

public interface UserService {
	
	/**
	 * 查询所有用户信息 ,可模糊查询
	 * @param map
	 * @return
	 */
	public List<User> getAllUser(Map<String,Object> map);
	/**
	 * 删除员工信息
	 * @param uId
	 * @return
	 */
	public int delUser(Integer uId);
	/**
	 * 查询指定员工
	 * @param uId
	 * @return
	 */
	public User getUserById(Integer uId);
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public int updateUser(User user);
	/**
	 * 添加员工信息
	 * @param user
	 * @return
	 */
	public int addUser(User user);
}
