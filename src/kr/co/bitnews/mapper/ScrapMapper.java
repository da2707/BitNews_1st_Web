package kr.co.bitnews.mapper;

import java.util.List;

import kr.co.bitnews.domain.Scrap;

public interface ScrapMapper {
	public void insertScrap(Scrap scrap);
	public List<Scrap> selectScrapById(String userId);
	void deleteScrap(Scrap scrap);
}
