import 'unit.dart';
import 'monster.dart';

class Character extends Unit {
  bool isItemUsed = false; // 아이템 사용 여부
  bool itemAppliedThisTurn = false; // 이번 턴에 아이템 효과 적용 여부

  Character(super.name, super.hp, super.attack, super.defense);

  void attackMonster(Monster monster) {
    print('$name이(가) ${monster.name}을(를) 공격합니다!');

    int effectiveAttack = itemAppliedThisTurn ? attack * 2 : attack;
    int damage = effectiveAttack - monster.defense;
    if (damage < 0) damage = 0;

    monster.hp -= damage;
    if (monster.hp < 0) monster.hp = 0;

    print('💥 입힌 데미지: $damage ${itemAppliedThisTurn ? "(아이템 효과 2배)" : ""}');

    // 턴이 끝났으니 효과 해제
    itemAppliedThisTurn = false;
  }

  void defend(int damage) {
    print('$name이(가) 방어합니다. 체력이 $damage만큼 회복됩니다.');
    hp += damage;
  }

  void useItem() {
    if (isItemUsed) {
      print('⚠️ 이미 아이템을 사용했습니다.');
    } else {
      isItemUsed = true;
      itemAppliedThisTurn = true;
      print('💥 아이템 사용! 이번 공격은 2배의 데미지를 입힙니다!');
    }
  }

  @override
  void showStatus() {
    print('[캐릭터: $name] HP: $hp | ATK: $attack | DEF: $defense');
  }
}
