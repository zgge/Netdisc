package service;

import java.util.List;

import org.springframework.stereotype.Service;

import pojo.Resource;
@Service
public interface ResourceService {
	int addResource(Resource resource);
	int deleteResource(int id);
	List<Resource> listResource(int start,int length);
	List<Resource> getResourcesById(int start,int length,int uid,int father);
	List<Resource> getResourcesByName(int start,int length,String username);
	int updateResource(Resource resource);
	Resource getResource(int id);
	int addCount(int id);
	int getMyPanCount(int uid,int father);
	int getAllCount();
	int getCountByName(String username);
	int CreateFolder(Resource resource);
	int deleteFolder(int father);
}
