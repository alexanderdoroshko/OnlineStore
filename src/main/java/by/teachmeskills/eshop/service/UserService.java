package by.teachmeskills.eshop.service;

import by.teachmeskills.eshop.exceptions.ServiceException;
import by.teachmeskills.eshop.repository.domain.User;

import java.util.List;

public interface UserService extends BaseService<User> {

    User getUserByEmail(String email) throws ServiceException, ReflectiveOperationException;

    List<User> findAllUsers() throws ServiceException;

    User getUserByEmailAndPassword(String email, String password) throws ServiceException;

}
