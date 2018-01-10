<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${packageName}.dao.${className?cap_first}Dao" >
  <resultMap id="BaseResultMap" type="${packageName}.entity.${className?cap_first}" >
    <id column="${id.name}" property="${id.name}" jdbcType="INTEGER" />
  	<#list attrs as attr>
	<result column="${attr.sqlName}" property="${attr.name}" jdbcType="${attr.sqlType}" />
	</#list>
  </resultMap>
  
  
  <sql id="Base_Column_List" >
  	id,
  	<#list attrs as attr>
  	${attr.sqlName}<#if attr_has_next>,</#if>
  	</#list>
  </sql>
  
  <select id="get" resultMap="BaseResultMap">
  	SELECT 
  	 <include refid="Base_Column_List" />
  	FROM
  	${className}
  	<where>
  		<if test="id != null and id != 0">
  		id=${"#"}{id}
  		</if>
  		<#list attrs as attr>
  		<if test="${attr.name} != null and ${attr.name} != 0">
		 and ${attr.sqlName} = ${"#"}{${attr.name}}
		 </if>
		</#list>
  	</where>
  </select>
  
  <select id="findList" resultMap="BaseResultMap">
  	SELECT 
  	 <include refid="Base_Column_List" />
	${className}
  	<where>
  		1=1
  		<#list attrs as attr>
  		<if test="${attr.name} != null and ${attr.name} != 0">
  		and
		${attr.sqlName} = ${"#"}{${attr.name}} 
		 </if>
		</#list>
		<if test="id != null and id != 0">
  		and
  		id = ${"#"}{id}
  		</if>
  	</where>  	 
  </select>
  
   <select id="findAllList" resultMap="BaseResultMap">
  	SELECT 
  	 <include refid="Base_Column_List" />
	${className}
  	<where>
  		<if test="id != null and id != 0">
  		id = ${"#"}{id}
  		</if>
  		<#list attrs as attr>
  		<if test="${attr.name} != null and ${attr.name} != ''">
		 and ${attr.sqlName} = ${"#"}{${attr.name}}
		 </if>
		</#list>
  	</where>  	 
  </select>
  
  <insert id="insert" parameterType="${packageName}.entity.${className?cap_first}">
  	insert into ${className} 
  	(
	<#list attrs as attr>
	${attr.sqlName}<#if attr_has_next>,</#if>
	</#list>
  	)
  	values
  	(
  	<#list attrs as attr>
	${"#"}{${attr.name}}
	<#if attr_has_next>,</#if>
	</#list>
  	)
  </insert>
  
  <update id="update" parameterType="${packageName}.entity.${className?cap_first}">
  	update ${className} 
  	<set> 
  	<#list attrs as attr>
  		<#if attr.type=='Integer'>
  		<if test="${attr.name} != null and ${attr.name} != 0">
  		</#if>
  		<#if attr.type != 'Integer'>
  		<if test="${attr.name} != null and ${attr.name} != ''">
  		</#if>
		 ${attr.sqlName} = ${"#"}{${attr.name}}
		 <#if attr_has_next>,</#if>
	 	</if>
	</#list>
	</set>
	where 
	id = ${"#"}{id}
  </update>
  
  <update id="delete">
  	update  ${className} 
  	<set>
  		del_flag = 1
  	</set>
  	where 
	id = ${"#"}{id}
  </update>
</mapper>