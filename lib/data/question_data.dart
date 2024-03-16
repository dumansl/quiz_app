import 'package:quiz_app/models/question.dart';

List<Question> questions = [
  Question(
    question:
        "Aşağıda belirtilen ifadelerden hangisi mobil platformları için geliştirilen işletim sistemlerinin kendi sundukları API üzerinden yazılım geliştirmeyi ifade eden mobil programlama türüdür?",
    answers: [
      Answer(answer: "A) Katmanlı (Layered)", isCorrect: false),
      Answer(answer: "B) Mobil Web (Mobile Web)", isCorrect: false),
      Answer(answer: "C) Çekirdek (Kernel)", isCorrect: false),
      Answer(answer: "D) Doğal (Native)", isCorrect: true),
    ],
  ),
  Question(
    question:
        "Aşağıdaki değişken tanımlamalarından hangisi hem int hem de double türü değer saklayabilir?",
    answers: [
      Answer(answer: "A) double x", isCorrect: false),
      Answer(answer: "B) var x = 0", isCorrect: false),
      Answer(answer: "C) int x", isCorrect: false),
      Answer(answer: "D) num x", isCorrect: true),
    ],
  ),
  Question(
    question:
        "Bir Flutter projesinde lib klasörü altında bulunan kod dosyasının uzantısı aşağıdakilerden hangisidir?",
    answers: [
      Answer(answer: "A) .yaml", isCorrect: false),
      Answer(answer: "B) .flutter", isCorrect: false),
      Answer(answer: "C) .dart", isCorrect: true),
      Answer(answer: "D) .bin", isCorrect: false),
    ],
  ),
  Question(
    question:
        "Aşağıdakilerden hangisi Flutter projesinin hangi paketleri içerdiği gibi ayarlarının yapıldığı dosyanın adıdır?",
    answers: [
      Answer(answer: "A) pubspec.yaml", isCorrect: true),
      Answer(answer: "B) README.md", isCorrect: false),
      Answer(answer: "C) analysis_options.yaml", isCorrect: false),
      Answer(answer: "D) main.dart", isCorrect: false),
    ],
  ),
];
