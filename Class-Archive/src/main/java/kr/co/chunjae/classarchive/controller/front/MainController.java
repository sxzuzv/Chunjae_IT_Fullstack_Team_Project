package kr.co.chunjae.classarchive.controller.front;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.chunjae.classarchive.service.front.MainService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

  private final MainService mainService;
  @RequestMapping("")
  public String main(HttpServletRequest req, @RequestParam Map<String, Object> params, Model model) throws Exception  {
      model.addAttribute("contentType", mainService.getContentType());
      model.addAttribute("recKeywords", mainService.selectRecKeyword());
      model.addAttribute("iconPacks", mainService.selectIconPack());
      model.addAttribute("recConGroups", mainService.selectRecConGroup());
    return "front/main";
  }

  @RequestMapping(value = "/searchContents", method = {RequestMethod.GET})
  public String searchContents(@RequestParam Map<String, Object> params, Model model) throws IOException {
    model.addAttribute("searchCondition", params);
    model.addAttribute("contents",mainService.searchContents(params));
    model.addAttribute("contentType", mainService.getContentType());
    return "front/contents";
  }
  @RequestMapping(value = "/content/{id}", method = {RequestMethod.GET})
  public String getContent(@PathVariable(name = "id") String id, Model model) throws IOException {
    model.addAttribute("content",mainService.getContent(id));
    model.addAttribute("contentType", mainService.getContentType());
    return "front/detail";
  }
}
