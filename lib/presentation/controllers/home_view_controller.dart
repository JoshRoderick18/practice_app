import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_app/core/dependency_injection/locator.dart';
import 'package:practice_app/domain/models/character_model.dart';
import 'package:practice_app/domain/repositories/character_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewController extends ChangeNotifier {
  // ignore: unused_field
  final SnackbarService _snackbarService;
  final CharacterRepository _characterRepository;

  List<Character> _characters = [];
  List<Character> get characters => _characters;
  bool isLoading = true;

  HomeViewController(
      {required CharacterRepository characterRepository,
      required SnackbarService snackbarService})
      : _characterRepository = characterRepository,
        _snackbarService = snackbarService;

  Future<void> getCharacters() async {
    _characters = await _characterRepository.getCharacters();
    isLoading = false;
    notifyListeners();
  }
}

final homeViewProvider = ChangeNotifierProvider(
  (ref) => HomeViewController(
    characterRepository: locator<CharacterRepository>(),
    snackbarService: locator<SnackbarService>(),
  ),
);
