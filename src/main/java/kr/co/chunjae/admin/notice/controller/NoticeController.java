package kr.co.chunjae.admin.notice.controller;

import kr.co.chunjae.admin.notice.vo.NoticeVO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

public interface NoticeController {
    public String writeForm(HttpServletRequest request);
    public String noticePageList(@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, Model model);
    public String noticeDetail(@RequestParam("brd_id") Long brdId, @RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, Model model);
    public String noticeUpdateForm(@RequestParam("brd_id") Long brdId, HttpServletRequest request, Model model);
    public String noticeUpdate(@ModelAttribute NoticeVO noticeVO, HttpServletRequest request, Model model);
    public String deleteNotice(@RequestParam("brd_id") Long brdId);
}
