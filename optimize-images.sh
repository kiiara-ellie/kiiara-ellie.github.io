#!/bin/bash

# WebP 변환 및 리사이즈 스크립트
# 사용법: ./optimize-images.sh

echo "🖼️  이미지 최적화 시작..."

# cwebp 설치 확인
if ! command -v cwebp &> /dev/null; then
    echo "❌ cwebp가 설치되어 있지 않습니다."
    echo "설치 방법: brew install webp"
    exit 1
fi

# 출력 디렉토리 생성
mkdir -p images/webp

# 포트폴리오/갤러리 이미지 (800px 너비)
for img in images/gallery-*.jpg images/portfolio-*.jpg images/porfolio-*.jpg; do
    if [ -f "$img" ]; then
        filename=$(basename "$img" .jpg)
        echo "처리중: $filename"
        cwebp -resize 800 0 -q 85 "$img" -o "images/webp/${filename}.webp"
    fi
done

# 상담 이미지 (1200px 너비 - OG 이미지용)
for img in images/consult-*.jpg; do
    if [ -f "$img" ]; then
        filename=$(basename "$img" .jpg)
        echo "처리중: $filename"
        cwebp -resize 1200 0 -q 85 "$img" -o "images/webp/${filename}.webp"
    fi
done

echo "✅ 완료! images/webp/ 폴더를 확인하세요."
