package com.kopo.finalproject.autotransfer.service;

import com.kopo.finalproject.autotransfer.model.dto.EndTransferInfo;
import com.kopo.finalproject.autotransfer.model.dto.Scheduler;

import java.util.List;

public interface AutoTransferService {

    List<Scheduler> getSchedulerInfo();

    List<EndTransferInfo> getEndTransferInfo(String account_number);

    void autoTransfer(Scheduler schedule);

    void endTransfer(EndTransferInfo endTransferInfo);
}
