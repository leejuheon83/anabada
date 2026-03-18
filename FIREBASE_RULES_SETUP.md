# Firebase 보안 규칙 설정 (저장 안 될 때)

물건 저장이 안 되거나 목록이 안 보이면 **Firestore/Storage 보안 규칙**을 확인하세요.

## 1. Firestore 규칙

1. https://console.firebase.google.com → **anabada-f15d5** 프로젝트
2. **Firestore Database** → **규칙** 탭
3. 아래 내용으로 **전체 교체** 후 **게시** 클릭

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /items/{itemId} {
      allow read, write: if true;
    }
  }
}
```

## 2. Storage 규칙

1. **Storage** → **규칙** 탭
2. 아래 내용으로 **전체 교체** 후 **게시** 클릭

```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /item-photos/{allPaths=**} {
      allow read, write: if true;
    }
  }
}
```

## 3. Firestore/Storage가 없다면

- **Firestore**: Firestore Database → 데이터베이스 만들기 → **테스트 모드**로 시작
- **Storage**: Storage → 시작하기 → **테스트 모드**로 시작
