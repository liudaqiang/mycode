package ${packageName}.service.impl;

import java.util.List;
import ${packageName}.service.${className?cap_first}Service;
import ${packageName}.entity.${className?cap_first};
import ${packageName}.dao.${className?cap_first}Dao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
<#list importList as imports>
import ${imports};
</#list>
/**
 * ServiceImpl
 * 
 * @author ${author}
 * 
 */
 @Service
public class ${className?cap_first}ServiceImpl implements ${className?cap_first}Service{

	@Autowired
	private ${className?cap_first}Dao ${className}Dao;
	
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	@Override
	public ${className?cap_first} get(String id){
		return ${className}Dao.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	@Override
	public ${className?cap_first} get(${className?cap_first} ${className}){
		return ${className}Dao.get(${className});
	}
	
	/**
	 * 查询数据列表
	 * @param entity
	 * @return
	 */
	@Override
	public List<${className?cap_first}> findList(${className?cap_first} ${className}){
		return ${className}Dao.findList(${className});
	}
	
	/**
	 * 查询所有数据列表
	 * @param entity
	 * @return
	 */
	@Override
	public List<${className?cap_first}> findAllList(${className?cap_first} ${className}){
		return ${className}Dao.findAllList(${className});
	}
	
	
	/**
	 * 插入数据
	 * @param entity
	 * @return
	 */
	@Override
	public void insert(${className?cap_first} ${className}){
		${className}Dao.insert(${className});
	}
	
	/**
	 * 更新数据
	 * @param entity
	 * @return
	 */
	@Override
	public void update(${className?cap_first} ${className}){
		${className}Dao.update(${className});
	}
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param id
	 * @see public int delete(T entity)
	 * @return
	 */
	@Deprecated
	public void delete(String id){
		${className}Dao.delete(id);
	}
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param entity
	 * @return
	 */
	@Override
	public void delete(${className?cap_first} ${className}){
		${className}Dao.delete(${className});
	}
}