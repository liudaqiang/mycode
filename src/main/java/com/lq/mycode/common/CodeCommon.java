package com.lq.mycode.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

/**
 * 代码生成工具
 * 
 * @author l.q
 *
 */
public class CodeCommon {
	private String packageName;
	private String factPackageName;
	private String className;
	private String author;
	private ServletContext servletContext;
	private Configuration cfg = new Configuration(Configuration.VERSION_2_3_22);
	private Map<String, Object> root = new HashMap<String, Object>();
	private List<String> importList = new ArrayList<>();
	public CodeCommon(String packageName, String className, String author, ServletContext servletContext) {
		this.packageName = packageName;
		this.factPackageName = packageName.replace(".", "/");
		this.className = className;
		this.author = author;
		this.servletContext = servletContext;
		cfg.setServletContextForTemplateLoading(this.servletContext, "/ftl");
		cfg.setDefaultEncoding("UTF-8");
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		root.put("packageName", this.packageName);
		root.put("className", this.className);
		root.put("author", this.author);
	}

	/**
	 * 生成实体类
	 * 
	 * @param headParam
	 *            头方法 packageName className author
	 * @param keyValueMap
	 *            键值方法
	 * @param path
	 *            上下文路径
	 * @throws IOException
	 * @throws TemplateException
	 */
	public void entityGen(List<Attribute> attr_list) throws IOException, TemplateException {
		root.put("attrs", attr_list);
		for (Attribute attribute : attr_list) {
			if (attribute.getType().equals("Date") || attribute.getType().equals("List")) {
				importList.add(ParamChangeCommon.map.get("FINAL_" + attribute.getType().toUpperCase()));
			}
		}
		root.put("importList", importList);
		common("entity.ftl","entity",".java");
	}

	/**
	 * 生成Dao方法
	 * 
	 * @param attr_list
	 * @throws IOException
	 * @throws TemplateException
	 */
	public void daoGen(List<Attribute> attr_list) throws IOException, TemplateException {
		root.put("attrs", attr_list);
		importList.clear();
		root.put("importList", importList);
		common("dao.ftl","dao","Dao.java");
	}
	
	public void baseDaoGen()throws IOException, TemplateException{
		Template temp = cfg.getTemplate("BaseDao.ftl");
		File dir = new File("E:/Work/Freemarker/src/"+factPackageName+"/base/");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		OutputStream fos = new FileOutputStream(new File(dir,LQStringUtils.captureName("BaseDao.java"))); // java文件的生成目录
		Writer out = new OutputStreamWriter(fos);
		temp.process(root, out);
		fos.flush();
		fos.close();
		System.out.println("gen baseDao code success!");
	}
	
	/**
	 * 生成Service方法
	 * 
	 * @param attr_list
	 * @throws IOException
	 * @throws TemplateException
	 */
	public void serviceGen(List<Attribute> attr_list) throws IOException, TemplateException {
		root.put("attrs", attr_list);
		importList.clear();
		root.put("importList", importList);
		common("service.ftl","service","Service.java");
	}
	/**
	 * 生成Service方法
	 * 
	 * @param attr_list
	 * @throws IOException
	 * @throws TemplateException
	 */
	public void serviceImplGen(List<Attribute> attr_list) throws IOException, TemplateException {
		root.put("attrs", attr_list);
		importList.clear();
		root.put("importList", importList);
		common("serviceImpl.ftl","service/impl","ServiceImpl.java");
	}
	public void baseServiceGen()throws IOException, TemplateException{
		
		Template temp = cfg.getTemplate("BaseService.ftl");
		File dir = new File("E:/Work/Freemarker/src/"+factPackageName+"/base/");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		OutputStream fos = new FileOutputStream(new File(dir,LQStringUtils.captureName("BaseService.java"))); // java文件的生成目录
		Writer out = new OutputStreamWriter(fos);
		temp.process(root, out);
		fos.flush();
		fos.close();
		System.out.println("gen baseService code success!");
	}
	
	public void controllerGen(List<Attribute> attr_list)throws IOException,TemplateException{
		root.put("attrs", attr_list);
		importList.clear();
		root.put("importList", importList);
		common("controller.ftl","controller","Controller.java");
	}
	public void mapperGen(List<Attribute> attr_list)throws IOException,TemplateException{
		int index = -1;
		for (int i=0;i<attr_list.size();i++) {
			if(attr_list.get(i).getName().equals("id")){
				index = i;
			}
			attr_list.get(i).setSqlType(attr_list.get(i).getSize()>256?"text":ParamChangeCommon.sqlMap.get(attr_list.get(i).getType()));
			attr_list.get(i).setSqlName(LQStringUtils.strToSqlStr(attr_list.get(i).getName()));
			
		}
		root.put("id", attr_list.get(index));
		if(index != -1){
			attr_list.remove(index);
		}
		root.put("attrs", attr_list);
		common("mapper.ftl","mapping","Mapper.xml");
	}
	public void sqlGen(List<Attribute> attr_list)throws IOException,TemplateException{
		int index = -1;
		for (int i=0;i<attr_list.size();i++) {
			if(attr_list.get(i).getName().equals("id")){
				index = i;
			}
			attr_list.get(i).setSqlType(attr_list.get(i).getSize()>256?"text":ParamChangeCommon.sqlMap.get(attr_list.get(i).getType()));
			attr_list.get(i).setSqlName(LQStringUtils.strToSqlStr(attr_list.get(i).getName()));
		}
		try{
			if(root.get("id") == null){
				root.put("id", attr_list.get(index));
				if(index != -1){
					attr_list.remove(index);
				}
			}
		}catch(Exception e){
			System.out.println("id不存在");
		}
		
		root.put("attrs", attr_list);
		common("sql.ftl","sql",".sql");
	}
	public void common(String flt,String dirType,String fileType)throws IOException,TemplateException{
		Template temp = cfg.getTemplate(flt);
		File dir = new File("E:/Work/Freemarker/src/"+factPackageName+"/"+dirType+"/");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		OutputStream fos = new FileOutputStream(new File(dir,LQStringUtils.captureName(className + fileType))); // java文件的生成目录
		Writer out = new OutputStreamWriter(fos);
		temp.process(root, out);
		fos.flush();
		fos.close();
		System.out.println("gen "+dirType+" code success!");
	}
}
