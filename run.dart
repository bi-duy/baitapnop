import 'dart:io';

double tinhDiemTrungBinh(List<double> diem) {
  if (diem.isEmpty) return 0.0;
  double tongDiem = 0.0;
  for (double d in diem) {
    tongDiem += d;
  }
  return tongDiem / diem.length;
}

String xepLoai(double dtb) {
  if (dtb >= 9.0) {
    return 'Xuất sắc';
  } else if (dtb >= 8.0) {
    return 'Giỏi';
  } else if (dtb >= 6.5) {
    return 'Khá';
  } else if (dtb >= 5.0) {
    return 'Trung bình';
  } else {
    return 'Yếu';
  }
}

void main() {
  stdout.write('Nhập điểm môn Toán: ');
  double toan = double.parse(stdin.readLineSync()!);
  stdout.write('Nhập điểm môn Văn: ');
  double van = double.parse(stdin.readLineSync()!);
  stdout.write('Nhập điểm môn Anh: ');
  double anh = double.parse(stdin.readLineSync()!);
  Map<String, double> diemMonHoc = {'Toán': toan, 'Văn': van, 'Anh': anh};

  List<double> danhSachDiem = diemMonHoc.values.toList();
  double dtb = tinhDiemTrungBinh(danhSachDiem);
  String hocLuc = xepLoai(dtb);
  print('Điểm trung bình: ${dtb.toStringAsFixed(2)}. Xếp loại: $hocLuc');
}
