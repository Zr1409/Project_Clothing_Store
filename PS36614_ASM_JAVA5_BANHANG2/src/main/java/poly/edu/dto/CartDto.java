package poly.edu.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int userId;
	private double tongtien = 0;
	private int tongsl = 0;
	private String dienthoai;
	private String diachi;
	private HashMap<Integer, CartDetailDto> detail = new HashMap<>();

}
