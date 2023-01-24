package com.finalproject.bada.admin.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileProduct {
	private int fileProductNo;
	private Product productNo;
	private String originalFileName;
	private String renamedFileName;
	private String thumbnail;
	private Date fileProductEnrollDate;

}
