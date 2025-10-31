use ss3_student_management;


#1. Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’

select * from student where studentName like'h%';

# 2. Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

select * from class where month(startDate)=12;

# 3. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.

select * from subject where credit in(3,4,5);

# 4. Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

update student set classID = 2 where studentID= 5;

# 5 .Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

SELECT s.studentName, sub.subName, m.mark
FROM mark m
JOIN student s ON m.studentID = s.studentID
JOIN subject sub ON m.subID = sub.subID
ORDER BY m.mark DESC, s.studentName ASC;
