String sizeConversion(String size) {
  Map<String, String> sizes = {
    "30": "X",
    "32": "XL",
    "36": "2L",
    "40.44": "X",
  };

  return sizes[size] ?? "";
}
