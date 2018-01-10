package ${packageName}.base;

import java.util.List;

/**
 * Service支持类实现
 * 
 * @author ${author}
 * 
 */
public interface BaseService<T>{

	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id);
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity);
	
	/**
	 * 查询数据列表
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity);
	
	/**
	 * 查询所有数据列表
	 * @param entity
	 * @return
	 */
	public List<T> findAllList(T entity);
	
	
	/**
	 * 插入数据
	 * @param entity
	 * @return
	 */
	public void insert(T entity);
	
	/**
	 * 更新数据
	 * @param entity
	 * @return
	 */
	public void update(T entity);
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param id
	 * @see public int delete(T entity)
	 * @return
	 */
	@Deprecated
	public void delete(String id);
	
	/**
	 * 删除数据（一般为逻辑删除，更新del_flag字段为1）
	 * @param entity
	 * @return
	 */
	public void delete(T entity);
	
}