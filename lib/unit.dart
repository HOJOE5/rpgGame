// lib/unit.dart

abstract class Unit {
  String name;
  int hp;
  int attack;
  int defense;

  Unit(this.name, this.hp, this.attack, this.defense);

  void showStatus();
}
