import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class MusicPlayer {
  AudioPlayer? _player;
  bool _isPlaying = false;
  
  Future<void> initialize() async {
    try {
      _player = AudioPlayer();
      
      if (kIsWeb) {
        // ВАЖНО: Правильный путь для веб-версии после сборки Flutter
        await _player!.setSourceUrl('assets/assets/audio/Kai_Rosenkranz.mp3');
        print('✅ Web: аудио загружено: assets/assets/audio/Kai_Rosenkranz.mp3');
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
      
      if (kIsWeb) {
        // Для веб всегда используем play() с UrlSource
        await _player!.play(UrlSource('assets/assets/audio/Kai_Rosenkranz.mp3'));
      } else {
        await _player!.resume();
      }
      
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

  bool get isPlaying => _isPlaying;
}