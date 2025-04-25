enum ShoeType { doremon, conan, shin, dragon, khac }

extension ParseToString on ShoeType {
  String toShortString() {
    return toString().split('.').last;
  }
}
