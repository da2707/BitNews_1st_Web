package kr.co.bitnews.mapper;

import kr.co.bitnews.domain.User;

public interface UserMapper {
	User selectUserById(String id);
	User selectAcc(String email);
	void insertUser(User user);
	void updateUser(User user);
	int selectMemberCount(String id);
	void withdrawUser(String id);
	void updatePass(User user);
}
