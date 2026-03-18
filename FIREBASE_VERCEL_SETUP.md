# 배포된 Vercel 사이트에서 Firebase 저장 가능하도록 설정

배포 사이트(https://sbsmcanabada.vercel.app)에서 물건 저장이 안 되면 아래를 확인하세요.

## 1. Firebase 인증된 도메인 추가

1. https://console.firebase.google.com → **anabada-f15d5** 프로젝트
2. **Authentication** → **Settings** (설정) → **Authorized domains** (인증된 도메인)
3. **Add domain** 클릭
4. `sbsmcanabada.vercel.app` 입력 후 저장

## 2. API 키 HTTP 리퍼러 제한 확인 (선택)

1. https://console.cloud.google.com → **anabada-f15d5** 프로젝트 선택
2. **APIs & Services** → **Credentials**
3. **API keys** 목록에서 Firebase용 키 선택 (브라우저 키)
4. **Application restrictions**가 "None"이면 모든 도메인에서 동작
5. "HTTP referrers"로 제한되어 있다면 아래 추가:
   - `https://sbsmcanabada.vercel.app/*`
   - `https://*.vercel.app/*`

## 3. Vercel이 anabada 저장소에서 배포되는지 확인

1. https://vercel.com/dashboard
2. **sbsmcanabada** 프로젝트 → **Settings** → **Git**
3. 연결된 저장소가 `leejuheon83/anabada`인지 확인
4. 다르면 **Connect Git Repository** → `anabada` 선택
