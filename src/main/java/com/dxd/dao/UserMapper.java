package com.dxd.dao;

import java.util.List;
import java.util.Map;

import com.dxd.pojo.User;

/**
 * 用户接口
 * @author 99266
 *
 */
public interface UserMapper {
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
