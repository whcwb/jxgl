package com.cwb.platform.sys.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.sys.constant.Dict;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import com.cwb.platform.util.exception.RuntimeCheckException;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.cwb.platform.sys.mapper.*;
import com.cwb.platform.sys.model.*;
import com.cwb.platform.sys.service.JgService;
import com.cwb.platform.sys.service.JsService;
import com.cwb.platform.sys.service.YhService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.bean.SimpleCondition;
import com.cwb.platform.util.commonUtil.Des;
import com.cwb.platform.util.commonUtil.EncryptUtil;
import com.cwb.platform.util.commonUtil.IdcardValidator;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.validator.valuehandling.UnwrapValidatedValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class YhServiceImpl extends BaseServiceImpl<SysYh, String> implements YhService {
	Logger log = LogManager.getLogger(this);
	@Value("${resePwd:123456}")
	private String resePwd;
	@Autowired
	private SysClkPtyhMapper baseMapper;

//	@Autowired
//	private SysPtfwMapper bizMapper;
	@Autowired
	private JsService roleService;
	@Autowired
	private JgService jgService;

	@Override
	protected Class<SysYh> getEntityCls(){
		return SysYh.class;
	}
	
	@Override
	protected Mapper<SysYh> getBaseMapper() {
		return baseMapper;
	}

	/**
	 * 新增用户
	 *
	 * @param user 用户
	 * @return 执行结果
	 */
	@Override
	public ApiResponse<String> addUser(SysYh user) {
		RuntimeCheck.ifBlank(user.getZh(),"账号不能为空");
		RuntimeCheck.ifBlank(user.getXm(),"姓名不能为空");
		RuntimeCheck.ifBlank(user.getJgdm(),"请选择机构");
		RuntimeCheck.ifBlank(user.getSjh(),"手机号不能为空");
		RuntimeCheck.ifFalse(StringUtils.isAlphanumeric(user.getZh()),"登陆名只能是数字和字母组成！");
		boolean exists = ifExists(SysYh.InnerColumn.zh.name(),user.getZh());
		RuntimeCheck.ifTrue(exists,"登陆名已存在，请更换别的登陆名！");
		SysJg org = jgService.findByOrgCode(user.getJgdm());
		RuntimeCheck.ifNull(org,"机构不存在");

		SysYh currentUser = getCurrentUser();
		user.setYhid(String.valueOf(idGenerator.nextId()));
		user.setMm(EncryptUtil.encryptUserPwd(user.getMm()));
		user.setCjr(currentUser.getYhid());
		user.setCjsj(DateUtils.getNowTime());
		user.setZt(Dict.UserStatus.VALID.getCode());
		baseMapper.insertSelective(user);
		return ApiResponse.success();
	}

	@Override
	public ApiResponse<String> saveEntity(SysYh user) {
		RuntimeCheck.ifBlank(user.getZh(),"请先输入登陆名！");
		RuntimeCheck.ifBlank(user.getMm(),"请先输入登陆密码！");
		RuntimeCheck.ifFalse(StringUtils.isAlphanumeric(user.getZh()),"登陆名只能是数字和字母组成！");
		RuntimeCheck.ifBlank(user.getLx(),"请先选择用户类型！");
		
		if ("20".equals(user.getLx())){
			//工作人员验证
			RuntimeCheck.ifBlank(user.getSjh(),"请先输入手机号码！");
			RuntimeCheck.ifBlank(user.getZjhm(),"请先输入证件号码！");
		}else if ("30".equals(user.getLx())){
			//教练员验证
			RuntimeCheck.ifBlank(user.getSjh(),"请先输入手机号码！");
			RuntimeCheck.ifBlank(user.getZjhm(),"请先输入证件号码！");
			RuntimeCheck.ifBlank(user.getZjhmexp(),"请先选择身份证有效期！");
			RuntimeCheck.ifBlank(user.getJszclrq(),"请先选择驾证初领日期！");
			RuntimeCheck.ifBlank(user.getJszjzrq(),"请先选择驾证截止日期！");
			RuntimeCheck.ifBlank(user.getZjcx(),"请先选择准驾车型！");
		}
		
		if (StringUtils.isNotBlank(user.getZjhm()) && !new IdcardValidator().isValidatedAllIdcard(user.getZjhm())){
			throw new RuntimeCheckException("请先输入正确的证件号码！");
		}
		
		if (StringUtils.isNotBlank(user.getJszclrq()) && StringUtils.isEmpty(user.getZjcx())){
			throw new RuntimeCheckException("请选择准驾车型！");
		}

		SimpleCondition condition = new SimpleCondition(SysYh.class);
		condition.eq(SysYh.InnerColumn.zh.name(), user.getZh());
		Integer count = this.countByCondition(condition);
		RuntimeCheck.ifTrue(count > 0,"登陆名已存在，请更换别的登陆名！");

		user.setYhid(genId());
		user.setMm(EncryptUtil.encryptUserPwd(user.getMm()));
		user.setZt(Dict.UserStatus.VALID.getCode());
		user.setSjh(user.getSjh().trim());
		user.setCjsj(DateUtils.getNowTime());
		if (StringUtils.isEmpty(user.getJgdm())){
			SysYh exist = getCurrentUser();
			user.setJgdm(exist.getJgdm());
		}
		this.save(user);
		return ApiResponse.saveSuccess();
	}

	/**
	 * 修改登录密码
	 *
	 * @param userId 用户id
	 * @param oldPwd 旧密码
	 * @param newPwd 新密码
	 * @return 操作结果
	 */
	@Override
	public ApiResponse<String> mdfPwd(String userId, String oldPwd, String newPwd) {
		SysYh user = baseMapper.selectByPrimaryKey(userId);
		String newEncrypt;
		if (user == null) return ApiResponse.fail("用户不存在");
		try {
			String encrypt = Des.encrypt(oldPwd);
			if (!encrypt.equals(user.getMm())){
				return ApiResponse.fail("密码错误");
			}
			newEncrypt = Des.encrypt(newPwd);
		} catch (Exception e) {
			log.error("加密失败 oldPwd={},newPwd={}",oldPwd,newPwd);
			return ApiResponse.fail("加密失败");
		}
		user.setMm(newEncrypt);
		baseMapper.updateByPrimaryKeySelective(user);
		return ApiResponse.success();
	}


	@Override
	public ApiResponse<List<SysFw>> getUserPermissions(SysYh user) {
		ApiResponse<List<SysFw>> result = new ApiResponse<>();
		// 获取角色
		List<String> roleIds = roleService.getUserRoleIds(user.getYhid());

//		Example roleBizExample = new Example(SysRsRoleBiz.class);
//		roleBizExample.and().andIn(SysRsRoleBiz.InnerColumn.roleId.name(),roleIds);
//		List<SysRsRoleBiz> roleBizs = roleBizMapper.selectByExample(roleBizExample);
//		if (roleBizs.size() == 0) return result;

		// 获取bizs
//		Set<Long> bizIds = roleBizs.stream().map(SysRsRoleBiz::getBizId).collect(Collectors.toSet());
//		Example bizExample = new Example(SysFw.class);
//		bizExample.and().andIn(SysFw.InnerColumn.fwId.name(),bizIds);
//		List<SysFw> bizs = bizMapper.selectByExample(bizExample);
//		result.setResult(bizs);
//		Map<String,SysFw> bizMap = bizs.stream().collect(Collectors.toMap(SysFw::getFwId, p->p));

		// 获取resources
//		Example roleResourceExample = new Example(SysRsRoleResource.class);
//		roleResourceExample.and().andIn(SysRsRoleResource.InnerColumn.roleId.name(),roleIds);
//		List<SysRsRoleResource> roleResources = roleResourceMapper.selectByExample(roleResourceExample);
//		if (roleResources.size() != 0){
//			Set<Long> resourceIds = roleResources.stream().map(SysRsRoleResource::getResId).collect(Collectors.toSet());
//			Example resourceExample = new Example(SysResource.class);
//			resourceExample.and().andIn(SysResource.InnerColumn.resId.name(),resourceIds);
//			List<SysResource> resources = resourceMapper.selectByExample(resourceExample);
//			for (SysResource resource : resources) {
//				SysFw biz = bizMap.get(resource.getResPid());
//				if (biz == null) continue;
//				if (biz.getResourceList() == null){
//					List<SysResource> resourcesList = new ArrayList<>();
//					resourcesList.add(resource);
//					biz.setResourceList(resourcesList);
//				}else{
//					biz.getResourceList().add(resource);
//				}
//			}
//		}
		return result;
	}

	@Override
	public ApiResponse<String> updateEntity(SysYh user) {
		SysYh exist = this.findById(user.getYhid().toString());
		if (exist == null){
			throw new RuntimeCheckException("用户信息不存在！");
		}
		
		RuntimeCheck.ifBlank(user.getZh(),"账号不能为空");
		RuntimeCheck.ifBlank(user.getXm(),"姓名不能为空");
		RuntimeCheck.ifBlank(user.getSjh(),"手机号不能为空");
		RuntimeCheck.ifFalse(StringUtils.isAlphanumeric(user.getZh()),"登陆名只能是数字和字母组成！");
		RuntimeCheck.ifBlank(user.getLx(),"请先选择用户类型！");
		
		if ("20".equals(user.getLx())){
			//工作人员验证
			RuntimeCheck.ifBlank(user.getSjh(),"请先输入手机号码！");
			RuntimeCheck.ifBlank(user.getZjhm(),"请先输入证件号码！");
		}else if ("30".equals(user.getLx())){
			//教练员验证
			RuntimeCheck.ifBlank(user.getSjh(),"请先输入手机号码！");
			RuntimeCheck.ifBlank(user.getZjhm(),"请先输入证件号码！");
			RuntimeCheck.ifBlank(user.getZjhmexp(),"请先选择身份证有效期！");
			RuntimeCheck.ifBlank(user.getJszclrq(),"请先选择驾证初领日期！");
			RuntimeCheck.ifBlank(user.getJszjzrq(),"请先选择驾证截止日期！");
			RuntimeCheck.ifBlank(user.getZjcx(),"请先选择准驾车型！");
		}
		
		if (StringUtils.isNotBlank(user.getZjhm()) && !new IdcardValidator().isValidatedAllIdcard(user.getZjhm())){
			throw new RuntimeCheckException("请先输入正确的证件号码！");
		}
		
		if (StringUtils.isNotBlank(user.getJszclrq()) && StringUtils.isEmpty(user.getZjcx())){
			throw new RuntimeCheckException("请选择准驾车型！");
		}

		baseMapper.updateByPrimaryKeySelective(user);
		return updateSession(user);
	}

	@Override
	public ApiResponse<String> updateSession(SysYh user) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		request.setAttribute("userInfo",user);
		request.setAttribute("orgCode",user.getJgdm());
		return ApiResponse.success();
	}

	/**
	 * 重置密码
	 * @param userId
	 * @return
	 */
	@Override
	public ApiResponse<String> resetPassword(String userId){
		SysYh sysUser = getCurrentUser(true);
		RuntimeCheck.ifTrue(StringUtils.equals(sysUser.getYhid(),userId),"您不能为本人重置密码，请联系管理员进行重置密码。");
		SysYh user = baseMapper.selectByPrimaryKey(userId);
		if (user == null) return ApiResponse.fail("用户不存在");
		RuntimeCheck.ifFalse(user.getJgdm().indexOf(sysUser.getJgdm())==0,"您不能为非本机构的人员重置密码");
		String newEncrypt=null;
		try {
			newEncrypt = Des.encrypt(resePwd);
		} catch (Exception e) {
			log.error("加密失败 newEncrypt={}",resePwd);
			return ApiResponse.fail("加密失败");
		}

		user.setMm(newEncrypt);
		baseMapper.updateByPrimaryKeySelective(user);
		return ApiResponse.success();
	}
	
	@Override
	public ApiResponse<List<SysYh>> pager(Page<SysYh> pager) {
		ApiResponse<List<SysYh>> result = new ApiResponse<>();
        LimitedCondition condition = getQueryCondition();
        if (!fillPagerCondition(condition)){
            return new ApiResponse<List<SysYh>>().emptyPage();
        }

        PageInfo<SysYh> resultPage = findPage(pager, condition);
        afterPager(resultPage);
        result.setPage(resultPage);
        return result;
	}
}