#!/bin/bash
ffmpeg -i device/nexus5_portrait.png -i device/input.mp4 -filter_complex "overlay=(W-w)/2:(H-h)/2:enable='between(t,0,5)'"  -b:v 16M -bufsize 16M device/output.mp4;
ffmpeg -i device/output.mp4 -b:v 16M device/output.gif


