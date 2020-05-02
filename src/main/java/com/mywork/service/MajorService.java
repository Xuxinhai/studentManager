package com.mywork.service;

import com.mywork.pojo.Major;

import java.util.List;

public interface MajorService {

    List<Major> selAllMajor();

    Major selMajorByMajorno(String majorno);

    int insMajor(Major major);

    int delMajorById(int id);
}
