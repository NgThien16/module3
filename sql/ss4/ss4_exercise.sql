use ss3_student_management;
#Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select* from `subject` order by credit desc limit 1;
#Hiển thị các thông tin môn học có điểm thi lớn nhất.

select s.subID as ID, s.subName as Name, m.mark as max_point 
from `subject` s
join mark m on m.subID = s.subID 
where m.mark = (SELECT MAX(mark) FROM mark);

#Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.studentID, s.studentName, ifnull(avg(m.mark), 'chưa có điểm') as avg_mark
from student s
left join mark m on m.studentID = s.studentID
group by s.studentID, s.studentName;
