# Firebase 설정 가이드 (anabada 프로젝트)

물건 등록 데이터를 모든 사용자에게 공유하려면 Firebase를 설정해야 합니다.

## 1. Firebase 프로젝트 (anabada)

프로젝트 **anabada**가 이미 생성되어 있습니다.
https://console.firebase.google.com → **anabada** 선택

## 2. Firestore 데이터베이스 활성화

1. Firebase 콘솔 → **Firestore Database** → **데이터베이스 만들기**
2. **테스트 모드**로 시작 (개발용)
3. 위치 선택 (asia-northeast3 권장)

## 3. Storage 활성화

1. Firebase 콘솔 → **Storage** → **시작하기**
2. **테스트 모드**로 시작

## 4. Firestore 보안 규칙 (프로덕션용)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /items/{itemId} {
      allow read: if true;
      allow write: if true;
    }
  }
}
```

## 5. Storage 보안 규칙

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /item-photos/{allPaths=**} {
      allow read: if true;
      allow write: if true;
    }
  }
}
```

## 6. 웹 앱 등록 및 설정값 복사

1. Firebase 콘솔 → **anabada** 프로젝트 → 프로젝트 설정(⚙️) → **일반** 탭
2. **내 앱** → 웹(</>) 아이콘 클릭 (없으면 앱 추가)
3. 앱 닉네임 입력 후 등록
4. 표시되는 설정값을 `index.html`의 `FIREBASE_CONFIG`에 입력 (apiKey, messagingSenderId, appId 등):

```javascript
const FIREBASE_CONFIG = {
  apiKey: 'AIza...',           // Firebase에서 복사
  authDomain: 'anabada.firebaseapp.com',  // projectId에 따라 다를 수 있음
  projectId: 'anabada',        // Firebase에서 확인
  storageBucket: 'anabada.appspot.com',
  messagingSenderId: '123456789',
  appId: '1:123456789:web:abc123'
};
```

## 7. Firestore 인덱스 (필요시)

`createdAt` 필드로 정렬하려면 인덱스가 필요할 수 있습니다.
오류 메시지에 표시되는 링크를 클릭해 인덱스를 생성하세요.
