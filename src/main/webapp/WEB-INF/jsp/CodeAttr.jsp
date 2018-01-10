<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctxStatic}/js/jQuery-2.0.0.js"></script>
<style>
	.top-10px{
		margin-top:10px;
	}
	.hand:hover{
		cursor:pointer;
	}
</style>
<title>代码属性设置</title>
</head>
<body>
	<div style="position:relative;">
		<div style="position:absolute;width:1000px;left:50%;margin-left:-500px;margin-top:50px;text-align:center;">代码属性设置</div>
		<div style="position:absolute;width:1000px;left:50%;margin-left:-500px;margin-top:100px;">
		<!-- action="${userCTX}/autoCode/getJAVACode" -->
				<div class="top-10px">请输入类名：<input id="className"  value="" /></div>
				<div class="top-10px">请输入创建人：<input id="author"  value="" /></div>
				<div class="top-10px">请输入包名：<input  id="packageName" value="" /></div>
				<br/>
				<a id="addAttr" class="hand">添加属性</a>
				<div class="top-10px" id="attrDiv" style="display:none"></div>
				<button onclick="genCode()">生成代码</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$.fn.stringifyArray = function(array) {
	        return JSON.stringify(array);
	    }

	    $.fn.parseArray = function(array) {
	        return JSON.parse(array);
	    }

		$("#addAttr").on({
			"click":function(){
				var size = $("#attrDiv").find("select").length;
				$("#attrDiv").show();
				var html = '';
				html += '<div>';
				html += '请输入字段名：<input id="input_'+size+'" name="" type="text" value="" >';
				html += '请选择字段类型：<select name=""   id="select_'+size+'" >';
				html += '<option value="String">String</option>';
				html += '<option value="Integer">Integer</option>';
				html += '<option value="Long">Long</option>';
				html += '<option value="Boolean">Boolean</option>';
				html += '<option value="Double">Double</option>';
				html += '<option value="Float">Float</option>';
				html += '<option value="Date">Date</option>';
				html += '<option value="List">List</option>';
				html += '</select>';
				html += '请输入字段长度：<input id="length_'+size+'" type="text" value=""/>';
				html += '请选择是否必须：<select name=""   id="flag_'+size+'" >';
				html += '<option value="true">是</option>';
				html += '<option value="false">否</option>';
				html += '</select>';
				html += '请输入备注信息(可空)：<input id="comment_'+size+'" type="text" value=""/>';
				html += '</div>';
				html += '<br/>';
				$("#attrDiv").append(html);
			}
		});
	
	})
		function genCode(){
			var size = $("#attrDiv").find("select").length;
			var data = [];
			for(var i=0;i<size;i+2){
				var paramName = $("#input_"+i).val();
				var paramValue = $("#select_"+i).val();
				var paramSize = $("#length_"+i).val();
				var paramFlag = $("#flag_"+i).val();
				var paramComment = $("#comment_"+i).val();
				var obj = {};
				obj.name = paramName;
				obj.type = paramValue;
				obj.size = paramSize;
				obj.flag = paramFlag;
				obj.comment = paramComment;
				data.push(obj);
			}
			var url="/autoCode/getJAVACode";
			console.log(url);
			console.log($.fn.stringifyArray(data));
			$.ajax({
				type:"POST",
				url:url,
				data:{
					"className":$("#className").val(),
					"author":$("#author").val(),
					"packageName":$("#packageName").val(),
					"data": $.fn.stringifyArray(data)
				},
				dataType:"json",
				success:function(data){
					
				},
				erroe:function(e){
					
				}
			});
		}
</script>
</html>