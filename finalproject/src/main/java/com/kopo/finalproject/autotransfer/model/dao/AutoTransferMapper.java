package com.kopo.finalproject.autotransfer.model.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface AutoTransferMapper {

    // 자동 이체 테이블 insert
    void insertAutoTransfer(HashMap<String, String> data);

    // 자동 이체 ID select
    String getTransferId(HashMap<String, String> data);
}
