#!/bin/bash

# 비디오 최적화 스크립트
# ffmpeg 필요: brew install ffmpeg

echo "🎬 비디오 최적화 시작..."

if ! command -v ffmpeg &> /dev/null; then
    echo "❌ ffmpeg가 설치되어 있지 않습니다."
    echo "설치: brew install ffmpeg"
    exit 1
fi

mkdir -p videos/optimized

# 메인 비디오 최적화 (모바일용 저화질)
ffmpeg -i videos/main-video.mp4 \
  -vf "scale=1280:-2" \
  -c:v libx264 -crf 28 -preset slow \
  -c:a aac -b:a 96k \
  -movflags +faststart \
  videos/optimized/main-video-mobile.mp4 -y

# 세컨드 비디오 최적화
ffmpeg -i videos/second-video.mp4 \
  -vf "scale=1280:-2" \
  -c:v libx264 -crf 28 -preset slow \
  -c:a aac -b:a 96k \
  -movflags +faststart \
  videos/optimized/second-video-mobile.mp4 -y

# 세컨드 비디오2 최적화
ffmpeg -i videos/second-video2.mp4 \
  -vf "scale=1280:-2" \
  -c:v libx264 -crf 28 -preset slow \
  -c:a aac -b:a 96k \
  -movflags +faststart \
  videos/optimized/second-video2-mobile.mp4 -y

echo "✅ 완료! videos/optimized/ 확인"
