//로거 설정
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 3,
    lineLength: 130,
    colors: true,
    printEmojis: false,
    printTime: false,
  ),
);

//깃허브로 받으신분은 걍 제 에세스 코드 쓰셔도 뭐라안하겠음..ㅋ 뭐 돈나가는것도 아니고
String accessCode = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODMwMjRkYzgwYzQ2NGMxYWYwN2ExYjk4ZWJhY2UxNyIsInN1YiI6IjY0ZTg1ZjA3YzYxM2NlMDEyY2M1MDY5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sEg3EDwlugvxSKZewLTZ_SKfTIyZWrSHXpBODuUPEmA";