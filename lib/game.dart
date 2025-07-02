import 'character.dart';
import 'monster.dart';
import 'dart:io';
import 'dart:math';

class Game {
  late Character character;
  List<Monster> monsters = [];
  int defeatedCount = 0;

  void loadCharacterStats() {
    try {
      final file = File('characters.txt');
      final contents = file.readAsStringSync().trim();
      final stats = contents.split(',');
      if (stats.length != 3) throw FormatException('Invalid character data');

      stdout.write('캐릭터 이름을 입력하세요: ');
      String? name = stdin.readLineSync();
      if (name == null || !RegExp(r'^[a-zA-Z가-힣]+$').hasMatch(name)) {
        throw FormatException('이름은 한글 또는 영문만 가능합니다.');
      }

      character = Character(
        name,
        int.parse(stats[0]),
        int.parse(stats[1]),
        int.parse(stats[2]),
      );
    } catch (e) {
      print('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
      exit(1);
    }
  }

  void loadMonsterStats() {
    try {
      final file = File('monsters.txt');
      final lines = file.readAsLinesSync();
      for (var line in lines) {
        final parts = line.split(',');
        if (parts.length != 3) continue;

        String name = parts[0];
        int hp = int.parse(parts[1]);
        int maxAtk = int.parse(parts[2]);
        int finalAtk = max(character.defense, Random().nextInt(maxAtk + 1));
        monsters.add(Monster(name, hp, finalAtk));
      }
    } catch (e) {
      print('몬스터 데이터를 불러오는 데 실패했습니다: $e');
      exit(1);
    }
  }

  Monster getRandomMonster() {
    final rand = Random();
    return monsters[rand.nextInt(monsters.length)];
  }

  void battle() {
    Monster monster = getRandomMonster();
    print('\n⚔️ 새로운 전투 시작!');
    monster.showStatus();

    while (character.hp > 0 && monster.hp > 0) {
      character.showStatus();
      stdout.write('행동을 선택하세요 (1: 공격, 2: 방어): \n');
      String? input = stdin.readLineSync();

      if (input == '1') {
        character.attackMonster(monster);
      } else if (input == '2') {
        int damage = monster.attack - character.defense;
        if (damage < 0) damage = 0;
        character.defend(damage);
      } else {
        print('잘못된 입력입니다.');
        continue;
      }

      if (monster.hp > 0) {
        monster.attackCharacter(character);
      }
    }

    if (character.hp > 0) {
      print('🎉 ${monster.name} 처치 성공!');
      monsters.remove(monster);
      defeatedCount++;
    } else {
      print('💀 캐릭터가 사망했습니다...');
    }
  }

  void saveResult() {
    stdout.write('결과를 저장하시겠습니까? (y/n): ');
    String? input = stdin.readLineSync();
    if (input?.toLowerCase() == 'y') {
      final file = File('result.txt');
      String result = character.hp > 0 ? '승리' : '패배';
      file.writeAsStringSync(
        '${character.name}, HP: ${character.hp}, 결과: $result\n',
        mode: FileMode.append,
      );
      print('✅ 결과가 저장되었습니다.');
    }
  }

  void startGame() {
    loadCharacterStats();
    loadMonsterStats();

    while (character.hp > 0 && defeatedCount < monsters.length) {
      battle();

      if (character.hp <= 0) {
        break;
      }

      if (defeatedCount >= monsters.length) {
        print('🎊 모든 몬스터를 물리쳤습니다! 게임 승리!');
        break;
      }

      stdout.write('다음 몬스터와 싸우시겠습니까? (y/n): ');
      String? cont = stdin.readLineSync();
      if (cont?.toUpperCase() != 'Y') break;
    }

    saveResult();
    print('게임이 종료되었습니다.');
  }
}
