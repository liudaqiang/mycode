package ${packageName}.dao;

<#list importList as imports>
import ${imports};
</#list>
import ${packageName}.entity.${className?cap_first};
import ${packageName}.base.BaseDao;
/**
 *  @author ${author}
 */
public interface ${className?cap_first}Dao extends BaseDao<${className?cap_first}>{
}