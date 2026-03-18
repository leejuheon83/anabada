# GitHub 저장소 생성 및 푸시
# 1. 먼저 gh auth login 완료 후 실행
# 2. gh auth login --web --hostname github.com

Write-Host "GitHub 인증 상태 확인..." -ForegroundColor Cyan
gh auth status
if ($LASTEXITCODE -ne 0) {
    Write-Host "`n먼저 다음 명령으로 로그인하세요:" -ForegroundColor Yellow
    Write-Host "  gh auth login --web --hostname github.com" -ForegroundColor White
    Write-Host "  브라우저에서 https://github.com/login/device 열고 코드 입력" -ForegroundColor Gray
    exit 1
}

Write-Host "`nGitHub 저장소 생성 및 푸시..." -ForegroundColor Cyan
gh repo create sbsmcanabada --public --source=. --remote=origin --push

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n완료! 다음 단계:" -ForegroundColor Green
    Write-Host "  1. https://vercel.com/dashboard 접속" -ForegroundColor White
    Write-Host "  2. sbsmcanabada 프로젝트 → Settings → Git" -ForegroundColor White
    Write-Host "  3. Connect Git Repository → GitHub → sbsmcanabada 선택" -ForegroundColor White
}
