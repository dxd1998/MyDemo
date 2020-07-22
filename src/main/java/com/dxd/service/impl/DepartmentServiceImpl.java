package com.dxd.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxd.dao.DepartmentMapper;
import com.dxd.pojo.Department;
import com.dxd.service.DepartmentService;

/**
 * 部门 业务层实现类
 * @author 99266
 *
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	private DepartmentMapper mapper;
	
	/**
	 * 所有部门
	 */
	public List<Department> getAllDepartment() {
		return mapper.getAllDepartment();
	}

	/**
	 * 删除员工部门信息
	 */
	public int delUserDepartment(Integer uId) {
		return mapper.delUserDepartment(uId);
	}

	/**
	 * 修改员工部门
	 */
	public int updateUserDepartment(Map<String, Object> map) {
		return mapper.updateUserDepartment(map);
	}

	/**
	 * 添加员工部门信息
	 */
	public int addUserDepartment(Map<String, Object> map) {
		return mapper.addUserDepartment(map);
	}

}
