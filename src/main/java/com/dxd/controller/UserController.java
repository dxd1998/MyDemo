package com.dxd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxd.pojo.Department;
import com.dxd.pojo.User;
import com.dxd.service.DepartmentService;
import com.dxd.service.UserService;
import com.dxd.utils.ReturnResult;

/**
 * 员工控制器 asdasda
 * @author 99266
 *
 */
@Controller
@RequestMapping("user/")
public class UserController {
	
	@Autowired
	private UserService us;
	@Autowired
	private DepartmentService ds;
	
	/**
	 * 所有用户信息
	 * @param uName
	 * @param dId
	 * @param model
	 * @return
	 */
	@RequestMapping("list")
	public String getList(@RequestParam(value="uName",required=false)String uName,
			@RequestParam(value="dId",required=false)String dId,Model model) {
		Map<String,Object> map = new HashMap<>();
		//判断
		if(uName != null && !uName.equals("")) {
			map.put("uName", uName);
		}else {
			map.put("uName", "");
		}
		if(dId != null && !dId.equals("0")) {
			map.put("dId", dId);
		}else {
			map.put("dId", "");
		}
		System.out.println(uName+"\t"+dId);
		//查询
		List<User> userList = us.getAllUser(map);
		//查询部门
		List<Department> departmentList = ds.getAllDepartment();
		//存储
		model.addAttribute("userList",userList);
		model.addAttribute("departmentList",departmentList);
		return "index";
	}
	/**
	 * 删除员工信息
	 * @param uId
	 * @return
	 */
	@RequestMapping("del")
	@ResponseBody
	public ReturnResult delUser(String uId) {
		ReturnResult result = new ReturnResult();
		//删除用户
		int count = us.delUser(Integer.parseInt(uId));
		//删除用户部门
		ds.delUserDepartment(Integer.parseInt(uId));
		if(count > 0) {
			result.getSuccess("删除该员工成功!");
		}else {
			result.getFail("系统出现异常!");
		}
		return result;
	}
	/**
	 * 回显修改用户
	 * @param model
	 * @return
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(String uId,Model model) {
		//得到该员工
		User user = us.getUserById(Integer.parseInt(uId));
		//查询部门
		List<Department> departmentList = ds.getAllDepartment();
		//存储
		model.addAttribute("user",user);
		model.addAttribute("departmentList",departmentList);
		return "addorupdate";
	}
	/**
	 * 保存修改后的用户信息
	 * @param user
	 * @param uId
	 * @return
	 */
	@RequestMapping("save")
	@ResponseBody
	public ReturnResult saveUpdate(User user,String dId) {
		ReturnResult result = new ReturnResult();
		//修改员工信息
		int count = us.updateUser(user);
		//修改员工部门
		Map<String,Object> map = new HashMap<>();
		map.put("uId", user.getuId());
		map.put("dId",dId);
		ds.updateUserDepartment(map);
		if(count > 0) {
			result.getSuccess("修改员工信息成功!");
		}else {
			result.getFail("系统出现异常!请联系管理员!");
		}
		return result;
	}
	/**
	 * 添加员工信息
	 * @param model
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(Model model) {
		//查询部门
		List<Department> departmentList = ds.getAllDepartment();
		//存储
		model.addAttribute("departmentList",departmentList);
		
		return "addorupdate";
	}
	/**
	 * 添加员工信息
	 * @param user
	 * @param dId
	 * @return
	 */
	@RequestMapping("saveAdd")
	@ResponseBody
	public ReturnResult saveAdd(User user,String dId) {
		ReturnResult result = new ReturnResult();
		//添加员工
		int count = us.addUser(user);
		Map<String,Object> map = new HashMap<>();
		//添加员工部门
		map.put("uId", user.getuId());
		map.put("dId", dId);
		ds.addUserDepartment(map);
		if(count > 0) {
			result.getSuccess("添加员工信息成功!");
		}else {
			result.getFail("系统出现异常!请联系管理员!");
		}
		return result;
	}
}
