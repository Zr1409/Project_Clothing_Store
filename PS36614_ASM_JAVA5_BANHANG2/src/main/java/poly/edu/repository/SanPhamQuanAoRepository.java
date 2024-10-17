package poly.edu.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import poly.edu.model.SanPhamQuanAo;

@Repository
public interface SanPhamQuanAoRepository extends JpaRepository<SanPhamQuanAo, Integer> {
    Page<SanPhamQuanAo> findAllByTenSanPhamLike(String keywords, Pageable pageable);
}

