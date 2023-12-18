import 'package:practice_app/domain/models/character_model.dart';

abstract class CharacterRepository {
  Character? get character;
  List<Character?> get characters;
  Future<Character> getCharacter(int id);
  Future<List<Character>> getCharacters();
}
