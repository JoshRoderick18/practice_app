import 'dart:developer';

import 'package:practice_app/core/services/http_service.dart';
import 'package:practice_app/domain/models/character_model.dart';
import 'package:practice_app/domain/repositories/character_repository.dart';

class CharacterRepositoryImplementation implements CharacterRepository {
  final HttpService _httpService;

  CharacterRepositoryImplementation({required HttpService httpService})
      : _httpService = httpService;

  late Character _character;
  late List<Character?> _characters;
  int page = 0;

  @override
  Character? get character => _character;

  @override
  List<Character?> get characters => _characters;

  @override
  Future<Character> getCharacter(int id) async {
    try {
      final response = await _httpService.dio.get('/character/$id');
      return Character.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to get character');
  }

  @override
  Future<List<Character>> getCharacters() async {
    try {
      page += 1;
      final response = await _httpService.dio.get('/character?page=$page');
      return (response.data['results'] as List)
          .map((character) => Character.fromJson(character))
          .toList();
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to get characters');
  }
}
