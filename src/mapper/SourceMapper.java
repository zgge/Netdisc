package mapper;

import java.util.List;

import pojo.Resource;

public interface SourceMapper {
	int add(Resource resource);
	Resource get(int id);
	int delete(int id);
	int update(Resource resource);
	int addCount(int id);
	List<Resource> list(int start,int length);
	List<Resource> getListById(int start,int length,int uid,int father);
	List<Resource> getListByIdOther(int start,int length,int uid);
	int getMyPanCount(int uid,int father);
	int getOtherPanCount(int uid);
	int getAllCount();
	int addFolder(Resource resource);//传入uid,father
	List<Resource> getAllResourcesByid(int father);
}
