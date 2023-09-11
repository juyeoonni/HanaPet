package com.kopo.finalproject.joinsaving.model.dao;


import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface JoinSavingMapper {

    // 적금 참여 insert
    void joinSaving(HashMap<String, String> data);
}
