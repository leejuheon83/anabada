# Firebase 설정 가이드 (anabada-f15d5)

다른 기기에서 물건이 보이려면 아래를 모두 완료하세요.

## 1. Firestore 데이터베이스 생성

1. https://console.firebase.google.com/project/anabada-f15d5/firestore
2. **데이터베이스 만들기** → 위치 선택(asia-northeast3 권장) → **테스트 모드**로 시작

## 2. Firestore 보안 규칙

1. **Firestore Database** → **규칙** 탭
2. 아래로 교체 후 **게시**

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

## 3. Storage 활성화 및 규칙

1. **Storage** → **시작하기** → **테스트 모드**로 시작
2. **규칙** 탭 → 아래로 교체 후 **게시**

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

## 4. 인증된 도메인 (배포 사이트용)

1. **Authentication** → **Settings** → **Authorized domains**
2. `sbsmcanabada.vercel.app` 추가
