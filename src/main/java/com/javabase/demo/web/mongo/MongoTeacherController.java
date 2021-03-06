package com.javabase.demo.web.mongo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.application.base.core.constant.CoreConstants;
import com.application.base.utils.json.JsonConvertUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javabase.demo.entity.mongo.MongoTeacher;
import com.javabase.demo.service.mongo.MongoTeacherService;
import com.application.base.core.common.BaseController;
import com.application.base.core.utils.CommonBeanUtils;
import com.application.base.utils.page.PageView;

/**
 * Controller
 * @author bruce
 */
@Controller
@RequestMapping("/background/mongoTeacher/")
public class  MongoTeacherController extends BaseController {

	private final static Logger logger= LoggerFactory.getLogger(MongoTeacherController.class.getName());
	
	// Servrice start
	@Autowired
	private MongoTeacherService  mongoTeacherService; 
    
	@RequestMapping("findObjPage")
	public String findObjPage(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> params =  nullAbleValidation(request, "");
	    PageView pageView = findByPage(params.get(CoreConstants.SqlConstants.PAGE_NO).toString(),params.get(CoreConstants.SqlConstants.PAGE_SIZE).toString());
        pageView = mongoTeacherService.findObjsByPage(pageView, params);
		return "/background/mongoTeacher/list";
	}
	
	@RequestMapping("findObjById")
    public void findObjById(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> params =  nullAbleValidation(request, "id");
		MongoTeacher mongoTeacher =mongoTeacherService.findObjById(params.get("id"));
		//返回.
		printJsonWriter(response, JsonConvertUtils.toJson(mongoTeacher));
    }
	
	@RequestMapping("findObjByProps")
	public void findObjByProps(HttpServletRequest request,HttpServletResponse response) {
		String data = null;
		try {
    		Map<String, Object> params =  nullAbleValidation(request, "");
            MongoTeacher object = mongoTeacherService.findObjByProps(params);
            if (object != null) {
				data = "({msg:'Y',content:'按需求填写!'})";
			}else {
				data = "({msg:'N',content:'按需求填写!'})";
			}
			//返回.
			printJsonWriter(response, data);
		} catch (Exception e) {
			logger.info("查找出错!"+e.getLocalizedMessage());
		}
	}
	
    @RequestMapping("addObjUI")
    public String addObjUI() {
        return "/background/mongoTeacher/add";
    }
	
	@RequestMapping("addObjOne")
	public String addObjOne(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> params = nullAbleValidation(request, "");
		MongoTeacher mongoTeacher = CommonBeanUtils.transMap2Bean(params, MongoTeacher.class);
		mongoTeacherService.addObjOne(mongoTeacher);
		return "redirect:find.html";
	}
	
	@RequestMapping("deleteObjById")
	public void deleteObjById(HttpServletRequest request,HttpServletResponse response) {
		String data = null;
        try {
        	Map<String, Object> params = nullAbleValidation(request, "id");
            boolean result = mongoTeacherService.deleteByObjId(params.get("id"));
            if (result ) {
                data = "({msg:'Y',content:'删除成功!'})";
            }else {
                data = "({msg:'N',content:'删除失败!'})";
            }
            //返回.
			printJsonWriter(response, data);
        } catch (Exception e) {
            logger.info("查找出错!"+e.getLocalizedMessage());
        }
	}
	
	@RequestMapping("updateObjById")
	public String updateObjById(HttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> params = nullAbleValidation(request, "id");
        mongoTeacherService.updateObjOne(params, params.get("id"));
		return "redirect:find.html";
	}
	
}
