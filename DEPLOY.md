# Firebase + GitHub + Vercel 연동 가이드

## 1. Firebase 설정 (완료)

Firebase 콘솔에서 프로젝트를 생성하고 `index.html`의 `FIREBASE_CONFIG`에 설정값을 입력하세요.

---

## 2. GitHub 연결

### 방법 A: GitHub CLI 사용

1. **GitHub 로그인**
   ```powershell
   gh auth login --web --hostname github.com
   ```
   - 브라우저에서 https://github.com/login/device 열기
   - 표시된 코드 입력 (예: 52F1-C4D1)

2. **저장소 생성 및 푸시**
   ```powershell
   cd "c:\Users\USER\Desktop\Cursor_주헌\sbsmcanabada"
   gh repo create sbsmcanabada --public --source=. --remote=origin --push
   ```

### 방법 B: 수동으로 GitHub에 푸시

1. https://github.com/new 에서 `sbsmcanabada` 저장소 생성 (빈 저장소)
2. 아래 명령 실행:
   ```powershell
   cd "c:\Users\USER\Desktop\Cursor_주헌\sbsmcanabada"
   git remote add origin https://github.com/YOUR_USERNAME/sbsmcanabada.git
   git branch -M main
   git push -u origin main
   ```
   (YOUR_USERNAME을 본인 GitHub 아이디로 변경)

---

## 3. Vercel 연결

### GitHub와 자동 배포 연결

1. https://vercel.com/dashboard 접속
2. **Add New** → **Project**
3. **Import Git Repository** → GitHub 선택
4. `sbsmcanabada` 저장소 선택
5. **Deploy** 클릭

### 또는 기존 Vercel 프로젝트에 GitHub 연결

1. Vercel 대시보드 → **sbsmcanabada** 프로젝트
2. **Settings** → **Git**
3. **Connect Git Repository** → GitHub 선택
4. `sbsmcanabada` 저장소 연결

연결 후 `main` 브랜치에 푸시할 때마다 자동으로 배포됩니다.

---

## 4. Firebase 설정 확인

배포 후 `index.html`의 `FIREBASE_CONFIG`에 입력한 Firebase 설정이 적용됩니다.
(프론트엔드에 노출되므로 API 키는 공개되어도 됩니다. 보안은 Firestore/Storage 규칙으로 관리됩니다.)
