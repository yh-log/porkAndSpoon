package kr.co.porkandspoon.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResevationDAO {

	String info(String loginId);

}
