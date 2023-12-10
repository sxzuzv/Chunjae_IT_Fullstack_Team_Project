package mybatis.mapper;


import dto.BoardDTO;
import dto.ReportDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReportMapper {
    //신수진


    //최경락


    //최영주
    int reportInsertWrite(ReportDTO dto);

    int reportSelectCount(Map<String, Object> map);

    List<ReportDTO> reportSelectListPage(Map<String, Object> map);

    ReportDTO reportSelectView(String reportId);

    int reportDelete(String reportId);



    //최재혁

    int adreportSelectCount(Map<String, Object> map);
    List<ReportDTO> adreportListPageWithPaging(Map<String, Object> map);



}
