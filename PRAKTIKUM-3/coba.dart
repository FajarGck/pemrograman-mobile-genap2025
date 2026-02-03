String profile(
  String? alamat, {
  required String? name,
  String? hobi = "gak suka ngapa ngapain",
}) {
  return "Nama: $name, hobi: $hobi, alamat: $alamat";
}

void main(List<String> args) {
  print(profile(name: "Fajar", "oke"));
}
