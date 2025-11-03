use casestudy_database;
# 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT  *FROM nhan_vien 
WHERE (ho_ten LIKE'h%' OR ho_ten LIKE'k%' OR ho_ten LIKE't%') 
AND char_length(ho_ten)<16;

# 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT *FROM khach_hang
WHERE (TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) BETWEEN 18 AND 50)
AND (dia_chi LIKE '%Đà Nẵng%'  OR dia_chi LIKE '%Quảng Trị%');


# 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT kh.ho_ten AS 'Khách Hàng' , 
lk.ten_loai_khach AS 'Loại Khách',
count(hd.ma_khach_hang) AS 'Số lần đặt'
FROM khach_hang kh
JOIN loai_khach AS lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN  hop_dong AS hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach ='Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach
ORDER BY COUNT(hd.ma_khach_hang) ASC;
# 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT kh.ma_khach_hang AS 'Mã Khách Hàng', 
kh.ho_ten AS 'Tên Khách Hàng', 
lk.ten_loai_khach AS'Loại Khách', 
IFNULL(dv.ten_dich_vu,'Chưa từng đặt') AS'Dịch Vụ', 
hd.ngay_lam_hop_dong AS 'Ngày làm hợp đồng', 
hd.ngay_ket_thuc AS 'Ngày kết thúc hợp đồng',
 IFNULL( MAX(dv.chi_phi_thue), 0 )
    + IFNULL( SUM(hdct.so_luong * dvdk.gia), 0 ) AS 'Tổng tiền'
FROM khach_hang kh
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY 
kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
ORDER BY kh.ma_khach_hang
