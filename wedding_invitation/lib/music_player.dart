import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class MusicPlayer {
  AudioPlayer? _player;
  bool _isPlaying = false;

  Future<void> initialize() async {
    try {
      _player = AudioPlayer();
      
      // Ключевое исправление для веб-версии GitHub Pages
      if (kIsWeb) {
        // Правильный путь для GitHub Pages
        await _player!.setSourceUrl('assets/audio/Kai_Rosenkranz.mp3');
        print('✅ Web: аудио загружено по URL');
      } else {
        await _player!.setSource(AssetSource('audio/Kai_Rosenkranz.mp3'));
      }
      
      await _player!.setReleaseMode(ReleaseMode.loop);
      await _player!.setVolume(0.7);
      print('Музыка инициализирована');
    } catch (e) {
      print('❌ Ошибка инициализации музыки: $e');
    }
  }

  Future<void> play() async {
    try {
      if (_player == null) await initialize();
      await _player!.resume();
      _isPlaying = true;
      print('▶️ Музыка играет (web)');
    } catch (e) {
      print('❌ Ошибка воспроизведения: $e');
      // Попробуем альтернативный метод
      try {
        await _player!.play(UrlSource('assets/audio/East_Duo.mp3'));
        _isPlaying = true;
      } catch (e2) {
        print('❌ И альтернативный метод не сработал: $e2');
      }
    }
  }

  Future<void> pause() async {
    try {
      await _player?.pause();
      _isPlaying = false;
    } catch (e) {
      print('❌ Ошибка паузы: $e');
    }
  }

  bool get isPlaying => _isPlaying;
}