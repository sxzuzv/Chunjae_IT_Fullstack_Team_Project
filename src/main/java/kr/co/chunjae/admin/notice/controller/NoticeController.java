package kr.co.chunjae.admin.notice.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

public interface NoticeController {
    public String writeForm(HttpServletRequest request);
    public String noticePageList(@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, Model model);
}
