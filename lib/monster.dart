import 'unit.dart';
import 'character.dart';

class Monster extends Unit {
  Monster(String name, int hp, int attack)
    : super(name, hp, attack, 0); // 방어력은 항상 0

  void attackCharacter(Character character) {
    int damage = attack - character.defense;
    if (damage < 0) damage = 0;
    character.hp -= damage;
    if (character.hp < 0) character.hp = 0;
    print('$name이(가) ${character.name}을(를) 공격합니다! 데미지: $damage');
  }

  int turnCount = 0;

  void checkAndIncreaseDefense() {
    turnCount++;
    if (turnCount % 3 == 0) {
      defense += 2;
      print('🛡️ $name의 방어력이 증가했습니다! 현재 방어력: $defense');
    }
  }

  @override
  void showStatus() {
    print('[몬스터: $name] HP: $hp | ATK: $attack');
  }
}
