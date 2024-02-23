package com.example.demo.Service;

import com.example.demo.Dto.NhanVienDTO;
import com.example.demo.Dto.Request.NhanVienRequest;
import com.example.demo.Entity.NhanVien;
import com.example.demo.Repository.ChucVuRepository;
import com.example.demo.Repository.NhanVienRepository;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class NhanVienService {
    @Autowired
    private NhanVienRepository repository;

    @Autowired
    private ChucVuRepository chucVuRepository;

    @Value("${TEMPLATE_PATH}")
    private String templateFolder;

    @Value("${FILE_TEMP_UPLOAD_PATH}")
    private String fileNameFullFolder;

    public List<NhanVien> getAll(){
        return repository.findAllByOrderByTrangThaiDesc();
    }

    public ResponseEntity<?> add(NhanVienRequest nhanVienRequest) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        NhanVien nhanVien = new NhanVien();
        nhanVien.setTen(nhanVienRequest.getTen());
        nhanVien.setEmail(nhanVienRequest.getEmail());
        nhanVien.setMatKhau(nhanVienRequest.getMatKhau());
        nhanVien.setSdt(nhanVienRequest.getSdt());
        nhanVien.setDiaChi(nhanVienRequest.getDiaChi());
        nhanVien.setCccd(nhanVienRequest.getCccd());
        if (nhanVienRequest.getNgaySinh() != null) {
            nhanVien.setNgaySinh(sdf.parse(nhanVienRequest.getNgaySinh()));
        }
        nhanVien.setTrangThai(1);
        if (nhanVienRequest.getMaChucVu() != null) {
            nhanVien.setChucVu(chucVuRepository.getReferenceById(nhanVienRequest.getMaChucVu()));
        }

        repository.save(nhanVien);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public NhanVien getByMa(Long maKhachHang){
        NhanVien nhanVien = repository.getReferenceById(maKhachHang);
        return nhanVien;
    }

    public ResponseEntity<?> update(NhanVienRequest nhanVienRequest) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        NhanVien nhanVien = this.getByMa(nhanVienRequest.getMaNhanVien());
        nhanVien.setTen(nhanVienRequest.getTen());
        nhanVien.setEmail(nhanVienRequest.getEmail());
        nhanVien.setMatKhau(nhanVienRequest.getMatKhau());
        nhanVien.setSdt(nhanVienRequest.getSdt());
        nhanVien.setDiaChi(nhanVienRequest.getDiaChi());
        nhanVien.setTrangThai(nhanVienRequest.getTrangThai());
        nhanVien.setCccd(nhanVienRequest.getCccd());
        if (nhanVienRequest.getNgaySinh() != null) {
            nhanVien.setNgaySinh(sdf.parse(nhanVienRequest.getNgaySinh()));
        }
        if (nhanVienRequest.getMaChucVu() != null) {
            nhanVien.setChucVu(chucVuRepository.getReferenceById(nhanVienRequest.getMaChucVu()));
        }

        repository.save(nhanVien);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public ResponseEntity<?> xoa(Long maNV) {
        NhanVien nhanVien = repository.getReferenceById(maNV);
        nhanVien.setTrangThai(0);
        repository.save(nhanVien);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public String buildSearchNhanVienResultFile() {
        List<NhanVienDTO> nhanVienList = repository.getListNhanVien();
        for (NhanVienDTO nhanVienDTO: nhanVienList){
            nhanVienDTO.convertTrangThaiToString();
        }
        String templateFolder = this.templateFolder;
        String fileName = "template_export_nhan_vien.xls";
        String fileNameFull = this.fileNameFullFolder + File.separator + fileName;
        String fileTemplate = "template_export_nhan_vien.xls";
        File templateFile = new File(templateFolder, fileTemplate);
        try {
            InputStream is = new FileInputStream(templateFile);
            File fileResult = new File(fileNameFull);
            OutputStream os = new FileOutputStream(fileResult);

            Context context = new Context();
            context.putVar("nvs", nhanVienList);
            JxlsHelper.getInstance().processTemplate(is, os, context);
            return fileNameFull;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Integer tongNhanVienDangHoatDong(){
        return repository.tongNhanVienDangHoatDong();
    }

    public ResponseEntity<?> updateMatKhau(Long id, String matKhau) {
        NhanVien nhanVien = this.getByMa(id);
        nhanVien.setMatKhau(matKhau);
        repository.save(nhanVien);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
