package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.SourceMapper;
import mapper.UserMapper;
import pojo.Resource;
import pojo.User;
@Service
public class ResourceServiceImpl implements ResourceService{
	@Autowired
	private SourceMapper mapper;
	@Autowired
	private UserMapper umapper;
	@Override
	public int addResource(Resource resource) {
		// TODO Auto-generated method stub
		return mapper.add(resource);
	}

	@Override
	public int deleteResource(int id) {
		// TODO Auto-generated method stub
		return mapper.delete(id);
	}

	@Override
	public List<Resource> listResource(int start,int length) {
		// TODO Auto-generated method stub
		return mapper.list(start,length);
	}
	
	@Override
	public int updateResource(Resource resource) {
		// TODO Auto-generated method stub
		return mapper.update(resource);
	}

	@Override
	public Resource getResource(int id) {
		// TODO Auto-generated method stub
		return mapper.get(id);
	}

	@Override
	public int addCount(int id) {
		// TODO Auto-generated method stub
		return mapper.addCount(id);
	}

	@Override
	public List<Resource> getResourcesById(int start, int length, int uid,int father) {
		// TODO Auto-generated method stub
		return mapper.getListById(start, length, uid,father);
	}

	@Override
	public int getMyPanCount(int uid,int father) {
		return mapper.getMyPanCount(uid,father);
	}

	@Override
	public int getAllCount() {
		return mapper.getAllCount();
	}

	@Override
	public List<Resource> getResourcesByName(int start, int length,String username) {
		int uid=umapper.getUid(username);
		return mapper.getListByIdOther(start, length, uid);
	}

	@Override
	public int getCountByName(String username) {
		User user=umapper.checkName(username);
		if(user==null) {
			return 0;
		}
		return mapper.getOtherPanCount(user.getUid());
	}

	@Override
	public int CreateFolder(Resource resource) {
		return mapper.addFolder(resource);
	}

	@Override
	//递归删除
	public int deleteFolder(int father) {
		List<Resource> list=mapper.getAllResourcesByid(father);
		int result=0;
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getIs_folder()==1) {
				result=deleteFolder(list.get(i).getId());
			}else {
				result=deleteResource(list.get(i).getId());
			}
		}//删除所有子
		deleteResource(father);//删除父
		return result;
	}
	
}
