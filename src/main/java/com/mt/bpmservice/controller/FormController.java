package com.mt.bpmservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mt.app.model.service.FormService;
import com.mt.core.model.exception.ServiceException;
import com.mt.core.model.vo.PageRequestVO;
import com.mt.core.web.controller.AbstractServiceController;

@RequestMapping("/service/form")
@RestController
public class FormController extends AbstractServiceController {

    @Autowired
    private FormService formService;

    @PostMapping("")
    public Object query(@RequestBody PageRequestVO requestVO) throws ServiceException {
        return formService.getData(requestVO);
    }

}