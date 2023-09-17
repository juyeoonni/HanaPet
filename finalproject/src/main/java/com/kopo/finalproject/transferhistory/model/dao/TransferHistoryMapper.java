package com.kopo.finalproject.transferhistory.model.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface TransferHistoryMapper {

    // 이체 내역 넣기 (insert)
    void insertHistory(HashMap<String, String> data);

}
