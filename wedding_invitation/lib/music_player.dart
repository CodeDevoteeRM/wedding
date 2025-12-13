import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class MusicPlayer {
  static final MusicPlayer _instance = MusicPlayer._internal();
  factory MusicPlayer() => _instance;
  MusicPlayer._internal();

  late AudioPlayer _player;
  bool _isPlaying = false;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      _player = AudioPlayer();
      
      // Ключевое исправление: разные пути для web и мобильных
      if (kIsWeb) {
        // Для web используем полный путь от корня сайта
        await _player.setSourceUrl('/wedding/assets/audio/Kai_Rosenkranz.mp3');
        print('✅ Web: аудио загружено по URL');
      } else {
        // Для мобильных приложений
        await _player.setSource(AssetSource('audio/Kai_Rosenkranz.mp3'));
        print('✅ Mobile: аудио загружено из assets');
      }

      await _player.setReleaseMode(ReleaseMode.loop);
      _isInitialized = true;
      print('Музыка инициализирована');
    } catch (e) {
      print('❌ Ошибка инициализации музыки: $e');
    }
  }

  Future<void> play() async {
    if (!_isInitialized) {
      await initialize();
    }

    try {
      await _player.resume();
      _isPlaying = true;
      print('▶️ Музыка начала играть');
    } catch (e) {
      print('❌ Ошибка воспроизведения: $e');
    }
  }

  Future<void> pause() async {
    try {
      await _player.pause();
      _isPlaying = false;
      print('⏸️ Музыка на паузе');
    } catch (e) {
      print('❌ Ошибка паузы: $e');
    }
  }

  Future<void> stop() async {
    try {
      await _player.stop();
      _isPlaying = false;
      print('⏹️ Музыка остановлена');
    } catch (e) {
      print('❌ Ошибка остановки: $e');
    }
  }

  bool get isPlaying => _isPlaying;
}