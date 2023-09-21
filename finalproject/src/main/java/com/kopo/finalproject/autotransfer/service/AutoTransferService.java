package com.kopo.finalproject.autotransfer.service;

import com.kopo.finalproject.autotransfer.model.dto.Scheduler;

import java.util.List;

public interface AutoTransferService {

    List<Scheduler> getSchedulerInfo();

    void autoTransfer(Scheduler schedule);
}
