package com.kopo.finalproject.transferhistory.model.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface TransferHistoryMapper {

    // 이체 내역 이체 회차 가져오기 (select)
    String getTransferNo(String transfer_id);

    // 이체 내역 넣기 (insert)
    void insertTransferHistory(HashMap<String, String> data);

}
