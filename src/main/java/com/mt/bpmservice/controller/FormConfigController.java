package com.mt.bpmservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mt.app.model.service.FormConfigService;
import com.mt.core.model.exception.ServiceException;
import com.mt.core.model.vo.PageRequestVO;
import com.mt.core.web.controller.AbstractServiceController;

@RequestMapping("/service/formConfig")
public class FormConfigController extends AbstractServiceController {

    @Autowired
    private FormConfigService formConfigService;

    @PostMapping("/query")
    public Object query(@RequestBody PageRequestVO requestVO) throws ServiceException {
        return formConfigService.getDataAsDTO(requestVO);
    }
}
