package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.UserMapper;
import pojo.User;
import sun.security.provider.MD5;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Override
	public User login(User user) {
		return mapper.login(user);
	}

	@Override
	public int register(User user) {
		return mapper.addUser(user);
	}

	@Override
	public User checkName(String username) {
		int result;
		User user=mapper.checkName(username);
		return user;
	}

	@Override
	public int activate(String code) {
		return mapper.activate(code);
	}

	@Override
	public User getUserByName(String username) {
		User user=mapper.checkName(username);
		return user;
	}

	@Override
	public int reset(User user) {
		return mapper.reset(user.getPassword(), user.getCode());
	}

	@Override
	public int updateUser(User user) {
		
		return mapper.updateUser(user);
	}

}
