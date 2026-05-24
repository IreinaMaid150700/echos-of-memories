import 'package:music_app/features/introduction/domain/models/Introduction_content_model.dart';

class AppContrants {
  static const String appName = "Echoes of Memorias";

  static const String keyFirstLogin = "key_first_login";

  static const List<IntroductionContentModel> appLinks = [
    IntroductionContentModel(
      title: "Những ngày bình thường",
      description: [
        "“Rồi sẽ có lúc bạn nhớ những ngày tưởng chừng rất bình thường này.”",
        "Những buổi chiều yên tĩnh, một tách cà phê,",
        "hay khoảnh khắc thức đến 2 giờ sáng để làm điều mình thích.",
      ],
      animationPath: "assets/animations/splash_animation.json",
    ),
    IntroductionContentModel(
      title: "Không cần phải chia sẻ",
      description: [
        "“Có những điều đẹp nhất… chỉ muốn giữ cho riêng mình.”",
        "Không lượt thích. Không ánh nhìn từ người khác.",
        "Chỉ còn lại bạn và những ký ức của chính mình.",
      ],
      animationPath: "assets/animations/splash_animation.json",
    ),
    IntroductionContentModel(
      title: "Một góc nhỏ cho tâm hồn",
      description: [
        "“Cuộc sống không cần quá đặc biệt để trở nên đáng nhớ.”",
        "Đôi khi chỉ là một bức ảnh, một dòng ghi chú ngắn,",
        "cũng đủ để sau này mỉm cười khi nhìn lại.",
      ],
      animationPath: "assets/animations/splash_animation.json",
    ),

    IntroductionContentModel(
      title: "Sau này nhìn lại",
      description: [
        "“Rồi sẽ có một ngày, bạn cảm ơn mình vì đã lưu giữ những điều này.”",
        "Bắt đầu cất giữ những mảnh nhỏ của cuộc sống,",
        "theo cách nhẹ nhàng nhất dành cho riêng bạn.",
      ],
      animationPath: "assets/animations/splash_animation.json",
    ),
  ];
}
