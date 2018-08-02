package kr.co.bitnews.mapper;

import java.util.List;

import kr.co.bitnews.domain.MyComment;
import kr.co.bitnews.domain.MyScrap;

public interface MyScrapMapper {
	List<MyScrap> selectScrapById(String userId);
	List<MyComment>selectCommentById(String userId);
}
