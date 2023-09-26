String? youbi (int n) {
  switch (n) {
    case 1:
      return '月';
    case 2:
      return '火';
    case 3:
      return '水';
    case 4:
      return '木';
    case 5:
      return '金';
    case 6:
      return '土';
    case 7:
      return '日';
  }
}
String nowTime() {
  var today = DateTime.now();
  return '${today.year}/${today.month}/${today.day} ${today.hour}:${today.minute}';
}