package kr.co.chunjae.notice.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

public interface userNoticeController {
    public String pagingNoticeList(@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, Model model);
    public String noticeDetail(@RequestParam("brd_id") Long brdId, @RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, Model model);
}
