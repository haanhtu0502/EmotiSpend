enum Emotion { happy, excited, peaceful, impulsive, sad, angry, neutral }

extension EmotionExtension on Emotion {
  String get toEmoji => switch (this) {
    Emotion.happy => "😁",
    Emotion.excited => "🤩",
    Emotion.peaceful => "☺️",
    Emotion.impulsive => "😅",
    Emotion.sad => "😔",
    Emotion.angry => "😡",
    Emotion.neutral => "😐",
  };

  String get toText => switch (this) {
    Emotion.happy => "Vui vẻ",
    Emotion.excited => "Phấn khích",
    Emotion.peaceful => "Bình yên",
    Emotion.impulsive => "Ngẫu hứng",
    Emotion.sad => "Buồn",
    Emotion.angry => "Bực bội",
    Emotion.neutral => "Bình thường",
  };
}
