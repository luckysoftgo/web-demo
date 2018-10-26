package com.application.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.application.base.core.datasource.impl.cache.SingleDefaultCacheReadAndWriteDataSessionFactory;
import com.application.base.utils.page.Pagination;
import com.javabase.demo.entity.test.TestTeacher;
import com.javabase.demo.service.test.TestTeacherService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.application.base.core.BaseJunit4Test;
import com.application.base.core.datasource.impl.cache.MutilDefaultCacheReadAndWriteDataSessionFactory;
import com.application.base.cache.redis.api.RedisSession;
import com.application.base.utils.common.BaseStringUtil;
import com.application.base.utils.common.UUIDProvider;

/**
 * 测试数据.
 */
public class DataTest extends BaseJunit4Test {

	@Autowired
	private TestTeacherService teacherService;

	@Autowired
	MutilDefaultCacheReadAndWriteDataSessionFactory factory;
	
	public static void main(String[] args) {
		
	}

	/******************************************************************************************************************** 单表的操作 ********************************************************************************************************************/
	
	@Test
	public void testAdd() {
		RedisSession session = factory.getCacheReadDataSession().getRedisSession();
		String key = "redis-data-add";
		session.setData(key, 10000);
		for (int i = 0; i < 10; i++) {
			session.incrNum(key);
			System.out.println(session.getData(key));
		}
	}
	
	@Test
	public void testDes() {
		RedisSession session = factory.getCacheReadDataSession().getRedisSession();
		String key = "redis-data-add";
		session.setData(key, 10010);
		for (int i = 0; i < 10; i++) {
			session.decrNum(key);
			System.out.println(session.getData(key));
		}
	}
	
	@Test
	public void testRedis() {
		RedisSession session = factory.getCacheReadDataSession().getRedisSession();
		//放入.
		String key1 = "machine01";
		String key2 = "machine02";
		for (int i = 0; i < 10; i++) {
			if (i%2==0) {
				session.push(key1, "AAAAA"+i);
			}else{
				session.push(key2, "BBBBB"+i);
			}
		}
		//取出.
		System.out.println("print out ...");
		String value1,value2 ;
		do {
			value1 = session.pull(key1);
			value2 = session.pull(key2);
			System.out.println("key1:"+value1+",key2:"+value2);
		}
		while (!BaseStringUtil.isEmpty(value1) && !BaseStringUtil.isEmpty(value2));
		System.out.println("finish ...");
	}

	@Test
	public void getObjectCount() {
		int count = teacherService.getObjectCount();
		System.out.println(count);
	}

	@Test
	public void getObjectCountByPros() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME + "Like", "wang");
		int count = teacherService.getObjectCount(param);
		System.out.println(count);
	}

	@Test
	public void findObjectListByPros() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME + "Like", "wang");
		List<TestTeacher> teachers = teacherService.findObjectListByPros(param);
		System.out.println(teachers.size());
	}

	@Test
	public void findObjectByPros() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME, "lisi");
		param.put(TestTeacher.FIELD_MOBILE, "13000000000");
		TestTeacher teacher = teacherService.findObjectByPros(param);
		System.out.println(teacher.getMobile());
	}

	@Test
	public void findListByPros() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME, "15999999998");
		param.put(TestTeacher.FIELD_MOBILE, "15999999998");
		List<TestTeacher> teachers = teacherService.findObjectListByPros(param);
		System.out.println(teachers.get(0).getMobile());
	}

	@Test
	public void paginationObjects() {
		Map<String, Object> param = new HashMap<String, Object>();
		int pageSize = 10;
		int pageNo = 1;
		Pagination<TestTeacher> pagination = teacherService.paginationObjects(param, pageNo, pageSize);
		System.out.println(pagination.getData());
		System.out.println(pagination.getData().size());
	}

	@Test
	public void getObjects() {
		Map<String, Object> param = new HashMap<String, Object>();
		List<TestTeacher> list = teacherService.findObjectListByPros(param);
		System.out.println(list.size());
	}

	@Test
	public void deleteObjectByUUID() {
		int count = teacherService.deleteObjectByUUId("AD78205BF8374391831637B5B4D18935");
		System.out.println(count);
	}

	@Test
	public void deleteObjectByID() {
		int count = teacherService.deleteObjectById(17);
		System.out.println(count);
	}

	@Test
	public void updateObjectByWhere() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME, "13333333333");
		param.put(TestTeacher.FIELD_MOBILE, "13333333333");
		int count = teacherService.updateObjectByWhere(param);
		System.out.println(count);
	}

	@Test
	public void updateObjectByUUID() {
		/*
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME, "15999999998");
		param.put(TestTeacher.FIELD_MOBILE, "15999999998");
		int count = teacherService.updateObjectByUUID(param, "349CAA581488483F8406CB0D1FF77BBB");
		*/
		
		TestTeacher teacher = new TestTeacher();
		teacher.setName("18999999988");
		teacher.setMobile("13000000999");
		int count = teacherService.updateObjectByUUId(teacher, "349CAA581488483F8406CB0D1FF77BBB");
		
		System.out.println(count);
	}

	@Test
	public void updateObjectByID() {
		/*
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME, "18999999999");
		param.put(TestTeacher.FIELD_MOBILE, "13000000888");
		int count = teacherService.updateObjectByID(param, 1);
		System.out.println(count);
		*/
		
		TestTeacher teacher = new TestTeacher();
		teacher.setName("18999999988");
		teacher.setMobile("13000000999");
		int count = teacherService.updateObjectById(teacher, 1);
		System.out.println(count);
	}

	@Test
	public void getObjectByUUID() {
		TestTeacher teacher = teacherService.getObjectByUUId("B136DEFB16BE4926A27C7AFB40E5268D");
		System.out.println(teacher.getUuid());
		System.out.println(teacher.getBeanInfos(teacher));
	}

	@Test
	public void getObjectByID() {
		TestTeacher teacher = teacherService.getObjectById(2);
		System.out.println(teacher.getUuid());
		System.out.println(teacher.getBeanInfos(teacher));
		teacherService.getObjectById(3);
	}

	@Test
	public void addObject() {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put(TestTeacher.FIELD_NAME, "赵六1");
		param.put(TestTeacher.FIELD_MOBILE, "13000000880");
		param.put(TestTeacher.FIELD_AGE, 43);
		param.put(TestTeacher.FIELD_MAJOR, "数学1");

		TestTeacher teacher = teacherService.saveObject(param);
		System.out.println(teacher.getUuid());
		System.out.println(teacher.getBeanInfos(teacher));
	}

	@Test
	public void addObjects() {
		List<TestTeacher> objs = new ArrayList<TestTeacher>();
		TestTeacher t1 = new TestTeacher();
		t1.setDisabled(0);
		t1.setUuid(UUIDProvider.uuid());
		t1.setCreateTime(new Date());
		t1.setUpdateTime(new Date());
		t1.setGender(0);
		t1.setName("wangwu7");
		t1.setMobile("18000000007");
		t1.setAge(66);
		t1.setMajor("语文4");

		TestTeacher t2 = new TestTeacher();
		t2.setDisabled(0);
		t2.setUuid(UUIDProvider.uuid());
		t2.setCreateTime(new Date());
		t2.setUpdateTime(new Date());
		t2.setGender(0);
		t2.setName("wangwu8");
		t2.setMobile("18000000008");
		t2.setAge(67);
		t2.setMajor("语文5");

		TestTeacher t3 = new TestTeacher();
		t3.setDisabled(0);
		t3.setUuid(UUIDProvider.uuid());
		t3.setCreateTime(new Date());
		t3.setUpdateTime(new Date());
		t3.setGender(0);
		t3.setName("wangwu9");
		t3.setMobile("18000000009");
		t3.setAge(68);
		t3.setMajor("语文6");

		objs.add(t1);
		objs.add(t2);
		objs.add(t3);

		boolean result = teacherService.saveBatchObject(objs);
		System.out.println(result);
	}

}