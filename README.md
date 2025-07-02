A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
# rpgGame
# 🧙 Dart CLI RPG Game

간단한 캐릭터 생성, 몬스터와의 전투, 결과 저장까지 포함된 **Dart CLI 기반 RPG 게임**입니다.  
파일 입출력, 클래스 상속, 추상 클래스 등 Dart의 주요 개념을 학습하기 위한 예제입니다.

---

## 📁 프로젝트 구조

rpg_game/
├── bin/
│ └── main.dart # 프로그램 진입점
├── lib/
│ ├── character.dart # 캐릭터 클래스
│ ├── monster.dart # 몬스터 클래스
│ ├── unit.dart # 추상 클래스 Unit
│ └── game.dart # 게임 전체 로직
├── characters.txt # 캐릭터 기본 능력치
├── monsters.txt # 몬스터 리스트 (이름, HP, ATK)
├── result.txt # 게임 결과 저장 파일
└── README.md # 프로젝트 설명


---

## 🕹️ 실행 방법

1. 프로젝트 루트에 다음 파일이 존재해야 합니다:

   - `characters.txt`
     ```
     50,10,5
     ```

   - `monsters.txt`
     ```
     고블린,30,15
     오우거,40,20
     트롤,35,18
     ```

2. 실행 명령어:

   ```bash
   dart run bin/main.dart

3. 게임 진행:

    캐릭터 이름 입력 (한글 또는 영문)
    전투 방식 선택 (1: 공격, 2: 방어)
    모든 몬스터 처치 시 승리
    사망 시 패배
    결과 저장 여부 선택 (result.txt에 저장)

📌 주요 기능
    캐릭터/몬스터 스탯 파일로부터 불러오기
    사용자 입력 이름 검증 (정규식 사용)
    전투 시스템 구현
    결과 파일 저장 기능
    추상 클래스 사용 (Unit)

🛠️ 기술 스택
    Dart (CLI)
    OOP: 클래스, 상속, 추상 클래스
    File I/O: dart:io
    유효성 검사: RegExp


🙋‍♂️ 제작자
    한민 / HOJOE GitHub