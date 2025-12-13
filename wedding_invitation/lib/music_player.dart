import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class MusicPlayer {
  AudioPlayer? _player;
  bool _isPlaying = false;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      _player = AudioPlayer();
      
      // Ключевое исправление для веб-версии
      if (kIsWeb) {
        // Путь должен быть правильным относительно корня сайта
        await _player!.setSourceUrl('/assets/audio/East_Duo.mp3');
        print('✅ Web: аудио загружено по URL');
      } else {
        await _player!.setSource(AssetSource('audio/East_Duo.mp3'));
      }
      
      await _player!.setReleaseMode(ReleaseMode.loop);
      await _player!.setVolume(0.7); // Настроим громкость
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
      // На веб-версии музыку можно включать только по действию пользователя
      await _player!.resume();
      _isPlaying = true;
      print('▶️ Музыка играет');
    } catch (e) {
      print('❌ Ошибка воспроизведения: $e');
    }
  }

  Future<void> pause() async {
    try {
      await _player?.pause();
      _isPlaying = false;
      print('⏸️ Музыка на паузе');
    } catch (e) {
      print('❌ Ошибка паузы: $e');
    }
  }

  Future<void> stop() async {
    try {
      await _player?.stop();
      _isPlaying = false;
    } catch (e) {
      print('❌ Ошибка остановки: $e');
    }
  }

  bool get isPlaying => _isPlaying;
}