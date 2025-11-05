# 1. Hugo 사이트 빌드
hugo --minify

# 2. gh-pages 브랜치 삭제 (존재하면)
git push origin --delete gh-pages 2>$null

# 3. gh-pages 임시 브랜치 생성
git checkout --orphan gh-pages

# 4. public 내용 현재 루트로 복사
Copy-Item -Path ".\public\*" -Destination "." -Recurse -Force

# 5. .nojekyll 생성
New-Item -Path ".nojekyll" -ItemType File -Force

# 6. git commit & 강제 push
git add .
git commit -m "Deploy Hugo site"
git push origin gh-pages --force

# 7. main 브랜치로 돌아가기
git checkout main

Write-Host "✅ Hugo 사이트가 gh-pages 브랜치로 배포 완료되었습니다!"
