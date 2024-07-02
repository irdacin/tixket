int currentCode = 0;

String getBookingCode() {
  currentCode++;
  return "T${currentCode.toString().padLeft(4, "0")}";
}