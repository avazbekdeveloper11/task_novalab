class ConstantData {
  static final ConstantData _instance = ConstantData._init();
  static ConstantData get instance => _instance;
  ConstantData._init();

  String randomImageUrl = "https://source.unsplash.com/480x900/?cat/";
  String factAPiUrl =
      "https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=2";

  String loading =
      "assets/gif/catLoading.gif"; //https://alexwohlbruck.github.io/cat-facts/docs/
}
