import 'unit.dart';
import 'monster.dart';

class Character extends Unit {
  Character(super.name, super.hp, super.attack, super.defense);

  void attackMonster(Monster monster) {
    print('$name이(가) ${monster.name}을(를) 공격합니다!');
    monster.hp -= attack;
    if (monster.hp < 0) monster.hp = 0;
  }

  void defend(int damage) {
    print('$name이(가) 방어합니다. 체력이 $damage만큼 회복됩니다.');
    hp += damage;
  }

  @override
  void showStatus() {
    print('[캐릭터: $name] HP: $hp | ATK: $attack | DEF: $defense');
  }
}
