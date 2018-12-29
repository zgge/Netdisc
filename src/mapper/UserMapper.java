package mapper;

import pojo.User;

public interface UserMapper {
	User checkName(String username);
	User login(User user);
	int addUser(User user);
	int deleteUser(int uid);
	int updateUser(User user);
	int showUsers();
	int getUid(String username);
	int activate(String key);
	int reset(String password,String code);
}
