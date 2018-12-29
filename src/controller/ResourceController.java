package controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import pojo.DownloadTask;
import pojo.PageBean;
import pojo.Resource;
import pojo.UploadResourceFile;
import pojo.User;
import service.DownloadTaskService;
import service.ResourceService;
import utils.Download;
import utils.DownloadUtils;
import utils.Edit;

@Controller
@Scope("prototype")
@RequestMapping("")
public class ResourceController {
	@Autowired
    protected HttpServletRequest request;
	@Autowired
	private ResourceService service;
	@Autowired
	private DownloadTaskService dservice;
	@RequestMapping("listResource")
	public ModelAndView listResource(PageBean pageBean) {
		ModelAndView mav=new ModelAndView();
		int totalNum=service.getAllCount();
		if(totalNum==0) {
			mav.addObject("msg", "暂时无文件，快去上传！");
			mav.setViewName("upload");
			return mav;
		}
		int firstPage=1;
		int totalPage=(totalNum+10-1)/10;
		if(pageBean.getCurrentPage()<firstPage) {
			pageBean.setCurrentPage(1);
		}else if(pageBean.getCurrentPage()>totalPage){
			pageBean.setCurrentPage(totalPage);
		}
		pageBean.setFirstPage(firstPage);
		pageBean.setTotalNum(totalNum);
		pageBean.setTotalPage(totalPage);
		List<Resource> list=service.listResource((pageBean.getCurrentPage()-1)*10,10);

		mav.setViewName("download");
		mav.addObject("resources",list);
		mav.addObject("pageBean",pageBean);
		return mav;
	}
	@RequestMapping("listResourceByName")
	public ModelAndView listResourceByName(PageBean pageBean,String username) {
		ModelAndView mav=new ModelAndView();
		int totalNum=service.getCountByName(username);
		System.out.println("发的飞洒地方"+totalNum);
		if(totalNum==0) {
			mav.addObject("msg", "该用户不存在或该用户未分享资源！");
			mav.setViewName("right");
			return mav;
		}
		int firstPage=1;
		int totalPage=(totalNum+10-1)/10;
		if(pageBean.getCurrentPage()<firstPage) {
			pageBean.setCurrentPage(1);
		}else if(pageBean.getCurrentPage()>totalPage){
			pageBean.setCurrentPage(totalPage);
		}
		pageBean.setFirstPage(firstPage);
		pageBean.setTotalNum(totalNum);
		pageBean.setTotalPage(totalPage);
		List<Resource> list=service.getResourcesByName((pageBean.getCurrentPage()-1)*10,10,username);
		mav.setViewName("searchList");
		mav.addObject("resources",list);
		mav.addObject("pageBean",pageBean);
		mav.addObject("username",username);
		return mav;
	}
	@RequestMapping("uploadResource")
	public ModelAndView addResource(HttpServletRequest request,Resource resource,UploadResourceFile resourceFile,PageBean pageBean) throws IllegalStateException, IOException {
		User user=(User) request.getSession().getAttribute("user");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String memo=multipartRequest.getParameter("memo");
		String is_share=multipartRequest.getParameter("is_share");
		String catalog=multipartRequest.getParameter("catagory");
		Date date=new Date();
		SimpleDateFormat sdft=new SimpleDateFormat("yyyy-MM-dd");
		String currentTime=sdft.format(date);
		String originalName=resourceFile.getResourceFile().getOriginalFilename();
		String name = UUID.randomUUID().toString();
		String newName=name+Edit.getType(originalName);
		resourceFile.getResourceFile().transferTo(new File("D:/upload", newName));//上传
		resource.setFilename(originalName);
		resource.setCount(0);
		 DecimalFormat df = new DecimalFormat("#.00");
		double b =(double)(resourceFile.getResourceFile().getSize())/1024;
		resource.setFilesize(Double.valueOf(( df.format(b))));
		resource.setFiletype( resourceFile.getResourceFile().getContentType());
		//resource.setSavepath(request.getServletContext().getRealPath("/WEB-INF/upload")+"/"+newName);
		resource.setSavepath("D:/upload/"+newName);
		resource.setUid(user.getUid());
		resource.setUploaddate(currentTime);
		resource.setCatalog(catalog);
		resource.setIs_share(is_share);
		resource.setMemo(memo);
		service.addResource(resource);
		pageBean.setCurrentPage(1);
		return showMyPan(pageBean);
	}
	@RequestMapping("downloadResource")
	public ResponseEntity<byte[]> uploadResource(HttpServletRequest request,HttpServletResponse response,Resource resource) throws IOException{
		  	resource=service.getResource(resource.getId());
			String downloadFilePath=resource.getSavepath();//从我们的上传文件中去取
	        
	        File file = new File(downloadFilePath);//新建一个文件
	        
	        HttpHeaders headers = new HttpHeaders();//http头信息
	        String agent=request.getHeader("user-agent");
	        String downloadFileName = DownloadUtils.getDownloadFileName(agent, resource.getFilename());
	        headers.setContentDispositionFormData("attachment",downloadFileName );
	       
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        service.addCount(resource.getId());
	        
	        //MediaType:互联网媒介类型  contentType：具体请求中的媒体类型信息
	        
	        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
	}
	@RequestMapping("updateResource")
	public ModelAndView updateResource(Resource resource) {
		service.updateResource(resource);
		return  showMyPan(new PageBean());
	}
	@RequestMapping("deleteResource")
	public ModelAndView deleteResource(int id,PageBean pageBean) {
		if(pageBean.getIs_folder()==1) {
			service.deleteFolder(id);
		}else {
			service.deleteFolder(id);
		}
		//删除时带上当前页
		return showMyPan(pageBean);
	}
	@ResponseBody
	@RequestMapping("getResource")
	public String getResource(int id) {
		Resource res=service.getResource(id);
		return JSONObject.toJSON(res).toString();
	}
	@RequestMapping("inEdit")
	public ModelAndView inEdit(int id) {
		Resource res=service.getResource(id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("resource", res);
		mav.setViewName("editResource");
		return mav;
	}
	@RequestMapping("edit")
	public ModelAndView edit(Resource resource,PageBean pageBean) {
		service.updateResource(resource);
		pageBean.setCurrentPage(1);
		return showMyPan(pageBean);
	}
	@RequestMapping("showMyPan")
	public ModelAndView showMyPan(PageBean pageBean) {
		ModelAndView mav=new ModelAndView();
		User user=(User) request.getSession().getAttribute("user");
		int totalNum=service.getMyPanCount(user.getUid(),pageBean.getFather());
		if(totalNum==0) {
			List<Resource> list=new ArrayList<Resource>();
			Resource resource=new Resource();
			resource.setFather(pageBean.getFather());
			resource.setIs_folder(2);
			list.add(resource);
			mav.addObject("resources", list);
			mav.setViewName("mypan");
			return mav;
		}
		int firstPage=1;
		int totalPage=(totalNum+10-1)/10;
		if(pageBean.getCurrentPage()<firstPage) {
			pageBean.setCurrentPage(1);
		}else if(pageBean.getCurrentPage()>totalPage){
			pageBean.setCurrentPage(totalPage);
		}
		pageBean.setFirstPage(firstPage);
		pageBean.setTotalNum(totalNum);
		pageBean.setTotalPage(totalPage);
		List<Resource> list=service.getResourcesById((pageBean.getCurrentPage()-1)*10,10, user.getUid(),pageBean.getFather());
		mav.setViewName("mypan");
		mav.addObject("resources",list);
		return mav;
	}
	@ResponseBody
	@RequestMapping("outLineDownload")
	public String outLineDownload(String path) throws MalformedURLException, IOException {
		Download d=new Download();
		String result;
		User user=(User) request.getSession().getAttribute("user");
		if(user==null) {
			return "添加失败";
		}
		DownloadTask task=d.download(path);
		if(task!=null) {
			Date date=new Date();
			SimpleDateFormat sdft=new SimpleDateFormat("yyyy-MM-dd");
			String currentTime=sdft.format(date);
			task.setUploaddate(currentTime);
			user=(User) request.getSession().getAttribute("user");
			System.out.println(user.getUsername());
			task.setUserid(user.getUid());
			task.setLoading(0);
			System.out.println(task.toString());
			dservice.addTask(task);
			result="添加成功";
		}else {
			result="添加失败";
		}
		return result;
	}
	@RequestMapping("getOutLineList")
	public ModelAndView getOutLineList(PageBean pageBean) {
		ModelAndView mav=new ModelAndView();
		User user=(User) request.getSession().getAttribute("user");
		List<DownloadTask> list=dservice.getList(user.getUid());
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("taskList");
		}else {
			pageBean.setCurrentPage(1);
			mav=showMyPan(pageBean);
			mav.addObject("msg", "离线下载列表为空");
		}
		return mav;
	}
	@RequestMapping("createFolder")
	public ModelAndView createFolder(Resource resource,PageBean pageBean) {
		ModelAndView mav=new ModelAndView();
		if(resource.getFilename().length()<1) {
			mav.addObject("msg", "创建失败");
		}else if(service.CreateFolder(resource)==0) {
			mav.addObject("msg", "创建失败");
		}else {
			mav.addObject("msg", "创建成功");
		}
		pageBean.setCurrentPage(1);
		return showMyPan(pageBean);
	}
	@RequestMapping("uploadPage")
	public String upload() {
		return "upload";
	}
	@RequestMapping("home")
	public String home() {
		return "home";
	}
	@RequestMapping("right")
	public String right() {
		return "right";
	}
	@RequestMapping("top")
	public String top() {
		return "top";
	}
	@RequestMapping("left")
	public String left() {
		return "left";
	}
}
