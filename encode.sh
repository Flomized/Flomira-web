#!/bin/bash
for i in {1..6}; do
  echo "Encoding dive_$i.mp4..."
  ffmpeg -y -i "dive_$i.mp4" -an -vf "unsharp=5:5:0.8:5:5:0.0" -c:v libx264 -preset slow -crf 20 -pix_fmt yuv420p -g 8 -keyint_min 8 -sc_threshold 0 -movflags +faststart "website/assets/vid/dive_${i}.mp4"
done

for i in {1..5}; do
  echo "Encoding conn_$i.mp4..."
  ffmpeg -y -i "conn_$i.mp4" -an -vf "unsharp=5:5:0.8:5:5:0.0" -c:v libx264 -preset slow -crf 20 -pix_fmt yuv420p -g 8 -keyint_min 8 -sc_threshold 0 -movflags +faststart "website/assets/vid/conn_${i}.mp4"
done

# Copy the still posters
cp still_*.jpg website/assets/
echo "Encoding complete!"
