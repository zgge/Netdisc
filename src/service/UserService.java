package service;

import pojo.User;

public interface UserService {
	User login(User user);
	int register(User user);
	User checkName(String username);
	int activate(String key);
	User getUserByName(String username);
	int reset(User user);
	int updateUser(User user);
}
