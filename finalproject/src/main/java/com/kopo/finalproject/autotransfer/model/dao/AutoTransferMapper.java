package com.kopo.finalproject.autotransfer.model.dao;

import com.kopo.finalproject.autotransfer.model.dto.Scheduler;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AutoTransferMapper {
    // 자동이체 테이블 반복문 돌려야할 정보들 가져오기
    List<Scheduler> getSchedulerInfo();
}
