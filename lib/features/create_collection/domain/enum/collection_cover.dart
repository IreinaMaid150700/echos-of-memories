/// Các tuỳ chọn bìa (gradient theo cảm xúc) cho một album/collection.
enum CollectionCover {
  calm('Trầm lặng'),
  peaceful('Bình yên'),
  grateful('Ấm áp'),
  reflective('Tự sự'),
  focused('Tập trung'),
  joyful('Vui nhẹ');

  const CollectionCover(this.label);

  final String label;
}
