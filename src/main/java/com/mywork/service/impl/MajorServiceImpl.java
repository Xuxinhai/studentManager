package com.mywork.service.impl;

import com.mywork.mapper.MajorMapper;
import com.mywork.pojo.Major;
import com.mywork.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;

    @Override
    public List<Major> selAllMajor() {
        return majorMapper.selAllMajor();
    }

    // //通过专业号查找专业
    @Override
    public Major selMajorByMajorno(String majorno) {
        return majorMapper.selMajorByMajorno(majorno);
    }

    //插入专业信息
    @Override
    public int insMajor(Major major) {
        return majorMapper.insMajor(major);
    }

    //通过id删除专业
    @Override
    public int delMajorById(int id) {
        return majorMapper.delMajorById(id);
    }
}
