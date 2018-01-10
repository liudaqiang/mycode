package ${packageName}.controller;

import java.util.List;
import ${packageName}.service.${className?cap_first}Service;
import ${packageName}.entity.${className?cap_first};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.apache.commons.lang3.StringUtils;
<#list importList as imports>
import ${imports};
</#list>
/**
 * Controller
 * 
 * @author ${author}
 * 
 */
@Controller
@RequestMapping("/${className}")
public class ${className?cap_first}Controller{

	@Autowired
	private ${className?cap_first}Service ${className}Service;
	
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	@RequestMapping("getById")
	public String getById(String id){
		${className}Service.get(id);
		return "";
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	@RequestMapping("get")
	public String get(${className?cap_first} ${className}){
		${className}Service.get(${className});
		return "";
	}
	
	/**
	 * 查询数据列表
	 * @param entity
	 * @return
	 */
	@RequestMapping("getList")
	public String findList(${className?cap_first} ${className},Model model){
		List<${className?cap_first}> ${className}List = ${className}Service.findList(${className});
		model.addAttribute("list",${className}List);
		return "";
	}
	
	
	
	/**
	 * 插入数据
	 * @param entity
	 * @return
	 */
	@RequestMapping("save")
	public String insert(${className?cap_first} ${className}){
		if(StringUtils.isBlank(String.valueOf(${className}.getId()))){
			${className}Service.insert(${className});
		}else{
			${className}Service.update(${className});
		}
		return "";
	}
	
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param entity
	 * @return
	 */
	@RequestMapping("delete")
	public String delete(${className?cap_first} ${className}){
		${className}Service.delete(${className});
		return "";
	}
}