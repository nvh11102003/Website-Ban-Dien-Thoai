package com.example.demo.Repository;

import com.example.demo.Dto.SanPhamHTDTO;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SanPhamViewRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<SanPhamHTDTO> fetchSanPhamHTDTO(Long maNSX,BigDecimal minPrice, BigDecimal maxPrice,int offset,int limit) {

        List<Object[]> results = entityManager.createNativeQuery(
//                "SELECT c.tenSanPham, Max(c.hinhAnhURL) , MAX(c.giaBan), MAX(c.giaSauKhiGiam) AS giaSauKhiGiam " +
//                        " FROM (SELECT ctsp.maSanPham AS maSanPham,SP.TenSanPham AS tenSanPham,ctsp.hinhAnhURL AS hinhAnhURL,ctsp.giaBan AS giaBan,NULL AS giaSauKhiGiam\n" +
//                        "         FROM ChiTietSanPham ctsp JOIN SanPham SP ON SP.MaSanPham = ctsp.MaSanPham JOIN NSX N ON N.MaNSX = ctsp.MaNSX AND ctsp.MaSanPham NOT IN (\n" +
//                        "                 SELECT g.MaSanPham FROM GiamGiaChiTietSanPham g WHERE g.trangThai = 1)\n" +
//                        "         WHERE ctsp.trangThai = 1 AND (N.MaNSX = :maNSX OR :maNSX IS NULL)\n" +
//                        "         UNION\n" +
//                        "         SELECT p.maSanPham AS maSanPham,S.TenSanPham AS tenSanPham,P.HinhAnhUrl AS hinhAnhURL,P.giaBan AS giaBan,g.giaSauKhiGiam AS giaSauKhiGiam\n" +
//                        "         FROM GiamGiaChiTietSanPham g JOIN ChiTietSanPham P ON g.MaChiTietSanPham = P.MaChiTietSanPham JOIN SanPham S ON P.MaSanPham = S.MaSanPham JOIN NSX N ON N.MaNSX = P.MaNSX\n" +
//                        "         WHERE P.trangThai = 1 AND g.trangThai = 1 AND (N.MaNSX = :maNSX OR :maNSX IS NULL)) c\n" +
//                        " WHERE(:minPrice IS NULL OR (CASE WHEN c.giaSauKhiGiam IS NOT NULL THEN c.giaSauKhiGiam ELSE c.giaBan END) >= :minPrice)\n" +
//                        "  AND (:maxPrice IS NULL OR (CASE WHEN c.giaSauKhiGiam IS NOT NULL THEN c.giaSauKhiGiam ELSE c.giaBan END) <= :maxPrice)\n" +
//                        " GROUP BY c.tenSanPham, c.maSanPham ")
                "SELECT \n" +
                        "    c.tenSanPham, \n" +
                        "    MAX(c.hinhAnhURL) AS hinhAnhURL, \n" +
                        "    MAX(c.giaBan) AS giaBan, \n" +
                        "    MAX(c.giaSauKhiGiam) AS giaSauKhiGiam,\n" +
                        "    Max(c.tenDungLuong) \n" +
                        "FROM (\n" +
                        "    SELECT \n" +
                        "        ctsp.maSanPham AS maSanPham,\n" +
                        "        SP.TenSanPham AS tenSanPham,\n" +
                        "        ctsp.hinhAnhURL AS hinhAnhURL,\n" +
                        "        ctsp.giaBan AS giaBan,\n" +
                        "        NULL AS giaSauKhiGiam,\n" +
                        "        dungLuong.TenDungLuong AS tenDungLuong -- Thêm trường dungLuong vào đây\n" +
                        "    FROM \n" +
                        "        ChiTietSanPham ctsp \n" +
                        "        JOIN SanPham SP ON SP.MaSanPham = ctsp.MaSanPham \n" +
                        "        JOIN DungLuong dungLuong ON dungLuong.MaDungLuong = ctsp.MaDungLuong\n" +
                        "        JOIN NSX N ON N.MaNSX = ctsp.MaNSX AND ctsp.MaSanPham NOT IN (\n" +
                        "            SELECT g.MaSanPham \n" +
                        "            FROM GiamGiaChiTietSanPham g \n" +
                        "            WHERE g.trangThai = 1\n" +
                        "        )\n" +
                        "    WHERE \n" +
                        "        ctsp.trangThai = 1 AND (N.MaNSX = :maNSX OR :maNSX IS NULL)\n" +
                        "\n" +
                        "    UNION\n" +
                        "\n" +
                        "    SELECT \n" +
                        "        p.maSanPham AS maSanPham,\n" +
                        "        S.TenSanPham AS tenSanPham,\n" +
                        "        P.HinhAnhUrl AS hinhAnhURL,\n" +
                        "        P.giaBan AS giaBan,\n" +
                        "        g.giaSauKhiGiam AS giaSauKhiGiam,\n" +
                        "        dungLuong.TenDungLuong AS tenDungLuong -- Thêm trường dungLuong vào đây\n" +
                        "    FROM \n" +
                        "        GiamGiaChiTietSanPham g \n" +
                        "        JOIN ChiTietSanPham P ON g.MaChiTietSanPham = P.MaChiTietSanPham \n" +
                        "        JOIN DungLuong dungLuong ON dungLuong.MaDungLuong = P.MaDungLuong \n" +
                        "        JOIN SanPham S ON P.MaSanPham = S.MaSanPham \n" +
                        "        JOIN NSX N ON N.MaNSX = P.MaNSX\n" +
                        "    WHERE \n" +
                        "        P.trangThai = 1 AND g.trangThai = 1 AND (N.MaNSX = :maNSX OR :maNSX IS NULL)\n" +
                        ") c\n" +
                        "WHERE \n" +
                        "    (:minPrice IS NULL OR COALESCE(c.giaSauKhiGiam, c.giaBan) >= :minPrice)\n" +
                        "    AND (:maxPrice IS NULL OR COALESCE(c.giaSauKhiGiam, c.giaBan) <= :maxPrice)\n" +
                        "GROUP BY \n" +
                        "    c.tenSanPham, c.maSanPham \n")
                .setFirstResult(offset)
                .setMaxResults(limit)
                .setParameter("maNSX", maNSX)
                .setParameter("minPrice", minPrice)
                .setParameter("maxPrice", maxPrice)
                .getResultList();

        List<SanPhamHTDTO> dtos = new ArrayList<>();
        for (Object[] result : results) {
            SanPhamHTDTO dto = new SanPhamHTDTO();
            dto.setTenSanPham((String) result[0]);
            dto.setHinhAnhURL((String) result[1]);
            dto.setGiaBan((BigDecimal) result[2]);
            dto.setGiaSauKhiGiam((BigDecimal) result[3]);
            dto.setDungLuong((String) result[4]);
            dtos.add(dto);
        }

        return dtos;
    }

    public List<SanPhamHTDTO> SanPhamHTDTOAll(Long maNSX,BigDecimal minPrice, BigDecimal maxPrice) {

        List<Object[]> results = entityManager.createNativeQuery(
                "SELECT c.tenSanPham, Max(c.hinhAnhURL) , MAX(c.giaBan), MAX(c.giaSauKhiGiam) AS giaSauKhiGiam\n" +
                        "                            FROM (SELECT ctsp.maSanPham as maSanPham, SP.TenSanPham as tenSanPham, ctsp.hinhAnhURL as hinhAnhURL, ctsp.giaBan as giaBan, null as giaSauKhiGiam\n" +
                        "                                  FROM ChiTietSanPham ctsp JOIN SanPham SP on SP.MaSanPham = ctsp.MaSanPham join NSX N on N.MaNSX = ctsp.MaNSX AND\n" +
                        "                                  ctsp.MaSanPham NOT IN (SELECT g.MaSanPham FROM GiamGiaChiTietSanPham g where g.trangThai = 1) WHERE ctsp.trangThai = 1 and (N.MaNSX = :maNSX Or :maNSX IS NULL)\n" +
                        "                                  UNION\n" +
                        "                                  SELECT p.maSanPham as maSanPham, S.TenSanPham as tenSanPham\n" +
                        "                                  , P.HinhAnhUrl as hinhAnhURL,P.giaBan as giaBan, g.giaSauKhiGiam as giaSauKhiGiam\n" +
                        "                                  FROM GiamGiaChiTietSanPham g JOIn ChiTietSanPham P on g.MaChiTietSanPham = P.MaChiTietSanPham\n" +
                        "                                                               JOIN SanPham S on P.MaSanPham = S.MaSanPham JOIN NSX N on N.MaNSX = P.MaNSX WHERE P.trangThai = 1 and g.trangThai = 1 and (N.MaNSX = :maNSX Or :maNSX IS NULL)) c\n" +
                        "                            WHERE (:minPrice IS NULL OR c.giaBan >= :minPrice) AND (:maxPrice IS NULL OR c.giaBan <= :maxPrice)\n" +
                        "                            GROUP BY  c.tenSanPham,   c.maSanPham")
                .setParameter("maNSX", maNSX)
                .setParameter("minPrice", minPrice)
                .setParameter("maxPrice", maxPrice)
                .getResultList();

        List<SanPhamHTDTO> dtos = new ArrayList<>();
        for (Object[] result : results) {
            SanPhamHTDTO dto = new SanPhamHTDTO();
            dto.setTenSanPham((String) result[0]);
            dto.setHinhAnhURL((String) result[1]);
            dto.setGiaBan((BigDecimal) result[2]);
            dto.setGiaSauKhiGiam((BigDecimal) result[3]);
            dtos.add(dto);
        }

        return dtos;
    }


    public List<SanPhamHTDTO> SearchSanPhamHTDTO(@Param("tenSanPham" )String tenSanPham) {
        List<Object[]> results = entityManager.createNativeQuery(
//                "SELECT c.tenSanPham, Max(c.hinhAnhURL) , MAX(c.giaBan),  MAX(c.giaSauKhiGiam) AS giaSauKhiGiam " +
//                        "FROM (SELECT  SP.TenSanPham as tenSanPham, ctsp.hinhAnhURL as hinhAnhURL, ctsp.giaBan as giaBan, null as giaSauKhiGiam " +
//                        "      FROM ChiTietSanPham ctsp JOIN SanPham SP on SP.MaSanPham = ctsp.MaSanPham WHERE ctsp.MaSanPham NOT IN (SELECT g.MaSanPham FROM GiamGiaChiTietSanPham g where g.trangThai = 1) AND ctsp.trangThai = 1 " +
//                        "      UNION" +
//                        "      SELECT  S.TenSanPham as tenSanPham, P.HinhAnhUrl as hinhAnhURL,P.giaBan as giaBan, g.giaSauKhiGiam as giaSauKhiGiam " +
//                        "      FROM GiamGiaChiTietSanPham g JOIn ChiTietSanPham P on g.MaChiTietSanPham = P.MaChiTietSanPham" +
//                        "                                   JOIN SanPham S on P.MaSanPham = S.MaSanPham WHERE P.trangThai = 1 and g.trangThai = 1) c " +
//                        " WHERE (:tenSanPham IS NULL OR c.tenSanPham LIKE CONCAT('%', :tenSanPham, '%')) " +
//                        "GROUP BY  c.tenSanPham")
                " SELECT \n" +
                        "    c.tenSanPham, \n" +
                        "    MAX(c.hinhAnhURL) AS hinhAnhURL, \n" +
                        "    MAX(c.giaBan) AS giaBan, \n" +
                        "    MAX(c.giaSauKhiGiam) AS giaSauKhiGiam,\n" +
                        "    MAX(c.tenDungLuong) AS tenDungLuong\n" +
                        "FROM (\n" +
                        "    SELECT \n" +
                        "        SP.TenSanPham AS tenSanPham, \n" +
                        "        ctsp.hinhAnhURL AS hinhAnhURL, \n" +
                        "        ctsp.giaBan AS giaBan, \n" +
                        "        NULL AS giaSauKhiGiam,\n" +
                        "        dungLuong.TenDungLuong AS tenDungLuong -- Thêm trường dungLuong vào đây\n" +
                        "    FROM \n" +
                        "        ChiTietSanPham ctsp \n" +
                        "        JOIN SanPham SP ON SP.MaSanPham = ctsp.MaSanPham \n" +
                        "        JOIN DungLuong dungLuong ON dungLuong.MaDungLuong = ctsp.MaDungLuong\n" +
                        "    WHERE \n" +
                        "        ctsp.MaSanPham NOT IN (\n" +
                        "            SELECT g.MaSanPham \n" +
                        "            FROM GiamGiaChiTietSanPham g \n" +
                        "            WHERE g.trangThai = 1\n" +
                        "        ) \n" +
                        "        AND ctsp.trangThai = 1\n" +
                        "    UNION\n" +
                        "    SELECT \n" +
                        "        S.TenSanPham AS tenSanPham, \n" +
                        "        P.HinhAnhUrl AS hinhAnhURL,\n" +
                        "        P.giaBan AS giaBan, \n" +
                        "        g.giaSauKhiGiam AS giaSauKhiGiam,\n" +
                        "        dungLuong.TenDungLuong AS tenDungLuong -- Thêm trường dungLuong vào đây\n" +
                        "    FROM \n" +
                        "        GiamGiaChiTietSanPham g \n" +
                        "        JOIN ChiTietSanPham P ON g.MaChiTietSanPham = P.MaChiTietSanPham \n" +
                        "        JOIN DungLuong dungLuong ON dungLuong.MaDungLuong = P.MaDungLuong \n" +
                        "        JOIN SanPham S ON P.MaSanPham = S.MaSanPham \n" +
                        "    WHERE \n" +
                        "        P.trangThai = 1 \n" +
                        "        AND g.trangThai = 1\n" +
                        "        AND (:tenSanPham IS NULL OR S.TenSanPham LIKE CONCAT('%', :tenSanPham, '%'))\n" +
                        ") c\n" +
                        "WHERE \n" +
                        "    (:tenSanPham IS NULL OR c.tenSanPham LIKE CONCAT('%', :tenSanPham, '%'))\n" +
                        "GROUP BY \n" +
                        "    c.tenSanPham;\n")
                .setParameter("tenSanPham", tenSanPham)
                .getResultList();

        List<SanPhamHTDTO> dtos = new ArrayList<>();
        for (Object[] result : results) {
            SanPhamHTDTO dto = new SanPhamHTDTO();
            dto.setTenSanPham((String) result[0]);
            dto.setHinhAnhURL((String) result[1]);
            dto.setGiaBan((BigDecimal) result[2]);
            dto.setGiaSauKhiGiam((BigDecimal) result[3]);
            dto.setDungLuong((String) result[4]);

            dtos.add(dto);
        }

        return dtos;
    }
}
