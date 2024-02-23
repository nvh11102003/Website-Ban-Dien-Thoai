package com.example.demo.Service;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.DungLuongDTO;
import com.example.demo.Dto.Request.ChiTietSanPhamRequest;
import com.example.demo.Dto.Request.DungLuongRequest;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.Chip;
import com.example.demo.Entity.DungLuong;
import com.example.demo.Repository.ChiTietSanPhamRepository;
import com.example.demo.Repository.DungLuongRepository;
import com.example.demo.Utils.Constants;
import io.micrometer.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DungLuongService {
    @Autowired
    private DungLuongRepository repository;
    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    public Page<DungLuong> getAll(Pageable pageable) {
        return repository.findAllByTrangThai(Constants.ACTIVE, pageable);
    }

    public List<DungLuong> getAllActive() {
        return repository.findAllActive();
    }

    public ResponseEntity<?> add(DungLuongRequest dungLuongRequest) {
        DungLuong mauSac = new DungLuong();
        if (StringUtils.isEmpty(dungLuongRequest.getTenDungLuong())) {
            return new ResponseEntity<>(Constants.NOT_NULL, HttpStatus.OK);
        }
        String tenDungLuong = dungLuongRequest.getTenDungLuong();
        DungLuong dungLuongInactiveCheck = repository.findAllInactiveByTen(tenDungLuong);
        DungLuong dungLuongActiveCheck = repository.findAllActiveByTen(tenDungLuong);
        if(dungLuongInactiveCheck != null){
            return new ResponseEntity<>("Dung lượng đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if(dungLuongActiveCheck != null){
            return new ResponseEntity<>("Dung lượng đã tồn tại!", HttpStatus.OK);
        }
        mauSac.setTenDungLuong(tenDungLuong);
        mauSac.setTrangThai(dungLuongRequest.getTrangThai());
        repository.save(mauSac);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    public DungLuong getByMa(Long maDungLuong) {
        DungLuong dungLuong = repository.getReferenceById(maDungLuong);
        return dungLuong;
    }

    public ResponseEntity<?> update(DungLuongRequest dungLuongRequest) {
        DungLuong dungLuong = repository.getReferenceById(dungLuongRequest.getMaDungLuong());
        String tenDungLuong = dungLuongRequest.getTenDungLuong();
        DungLuong dungLuongInactiveCheck = repository.findAllInactiveByTen(tenDungLuong);
        DungLuong dungLuongActiveCheck = repository.findAllActiveByTen(tenDungLuong);
        if(dungLuongInactiveCheck != null && !dungLuong.getMaDungLuong().equals(dungLuongInactiveCheck.getMaDungLuong())){
            return new ResponseEntity<>("Dung lượng đã tồn tại nhưng đang Inactive hãy cập nhập trạng thái!", HttpStatus.OK);
        }
        if(dungLuongActiveCheck != null && !dungLuong.getMaDungLuong().equals(dungLuongActiveCheck.getMaDungLuong())){
            return new ResponseEntity<>("Dung lượng đã tồn tại!", HttpStatus.OK);
        }
        dungLuong.setTenDungLuong(dungLuongRequest.getTenDungLuong());
        dungLuong.setTrangThai(dungLuongRequest.getTrangThai());
        repository.save(dungLuong);
        return new ResponseEntity<>("Success",HttpStatus.OK);
    }

    public List<DungLuongDTO> searchDungLuong(DungLuongRequest request) {
        List<DungLuongDTO> dungLuongDTOS = repository.searchDungLuong(request.getTenDungLuong());
        return dungLuongDTOS;
    }

    public List<DungLuongDTO> viewAllDl() {
        return repository.viewAllDl();
    }

    public DungLuong update(Long maDungLuong) {
        DungLuong dungLuong = repository.getReferenceById(maDungLuong);
        dungLuong.setTrangThai(Constants.INACTIVE);
        repository.save(dungLuong);
        return dungLuong;
    }

    public List<DungLuong> getDungLuongByMaSanPham(Long maSanPham) {
        // Lấy danh sách ChiTietSanPham dựa trên mã sản phẩm được cung cấp
        List<ChiTietSanPham> chiTietSanPhamList = chiTietSanPhamRepository.findBySanPhamMaSanPham(maSanPham);
        List<DungLuong> dungLuongList = new ArrayList<>();

        // Lặp qua mỗi ChiTietSanPham và trích xuất thông tin về DungLuong
        for (ChiTietSanPham chiTietSanPham : chiTietSanPhamList) {
            // Gọi phương thức extractDungLuongFromChiTietSanPham để chuyển đổi thông tin từ ChiTietSanPham sang DungLuong
            DungLuong dungLuong = extractDungLuongFromChiTietSanPham(chiTietSanPham);
            dungLuongList.add(dungLuong); // Thêm DungLuong vào danh sách dungLuongList
        }

        return dungLuongList; // Trả về danh sách DungLuong tương ứng với mã sản phẩm
    }

    private DungLuong extractDungLuongFromChiTietSanPham(ChiTietSanPham chiTietSanPham) {
        DungLuong dungLuong = new DungLuong();
        dungLuong.setMaDungLuong(chiTietSanPham.getDungLuong().getMaDungLuong());
        dungLuong.setTenDungLuong(chiTietSanPham.getDungLuong().getTenDungLuong());

        return dungLuong;
    }

}
