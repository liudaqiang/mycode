CREATE TABLE IF NOT EXISTS `${className}`(  
`${id.name}`  ${id.sqlType}(${id.size}) <#if id.flag == true>NOT NULL</#if><#if id.flag == false>NULL</#if>
<#if id.comment??>
 COMMENT '${id.comment}'
</#if>,
<#list attrs as attr>
`${attr.sqlName}` ${attr.sqlType}(${attr.size}) <#if attr.flag == true>NOT NULL</#if><#if attr.flag == false>NULL</#if>
<#if attr.comment??>
COMMENT '${attr.comment}'
</#if> 
<#if attr_has_next>,</#if>
 </#list>
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
