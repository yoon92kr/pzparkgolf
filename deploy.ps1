# 1. Hugo 사이트 빌드
hugo --minify

# 2. gh-pages 브랜치 삭제 (존재하면)
git push origin --delete gh-pages 2>$null

# 3. 임시 gh-pages 브랜치 생성
git checkout --orphan gh-pages

# 4. public 디렉토리 내용 현재 루트로 복사
Copy-Item -Path ".\public\*" -Destination "." -Recurse -Force

# 5. .nojekyll 파일 생성
New-Item -Path ".nojekyll" -ItemType File -Force

# 6. git commit & 강제 push
git add .
git commit -m "Deploy Hugo site" -Force
git push origin gh-pages -Force

# 7. main 브랜치로 돌아가기
git checkout main

Write-Host "✅ Hugo 사이트가 gh-pages 브랜치로 배포 완료되었습니다!"
