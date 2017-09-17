# MungleeYa
A tool to generate a gif with device-frame. For example:

<img src="https://github.com/CoXier/CheckBox/blob/master/art/screenshot.gif" alt="screenshot" title="screenshot" width="300" height="533" />

Let me explain how to make a gif.

* Use Android Studio built-in tool to record a video. 

  [Refer](https://developer.android.com/studio/debug/am-video.html)

* Use ffmpeg to convert video to gif but now without device frame.

* Use ImageMagick to overlay a device frame on generated gif.

There is a simple way to do that while I have writen the script for you. 

```bash
 ~/MungleeYa/mungleeya.sh -i input.mp4
```

In addition it support landscape mode.

