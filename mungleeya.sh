#!/bin/bash
usage() { echo "Usage: $0 [-i <input_file.mp4>]" 1>&2; exit 1; }
while getopts ":i:" o; do
    case "${o}" in
        i)
            i=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${i}" ]; then
    usage
fi

if [ ! -f "${i}" ]; then
    echo ""${i}" not found!"
fi

ffmpeg -i "${i}"  input.gif

# get height and width of input file
height=`convert input.gif[0] -format '%h' info:`
width=`convert input.gif[0] -format '%w' info:`

echo "input file's height = ${height}"
echo "input file's width = ${width}"

if [ "${height}" -gt "${width}" ]; then
    device_frame=~/MungleeYa/device/nexus5_portrait.png
else
    device_frame=~/MungleeYa/device/nexus5_landscape.png
fi

magick ${device_frame} null: \( input.gif -coalesce \) -gravity Center -layers composite -layers optimize out.gif

rm input.gif
echo "Output -> ${pwd}/out.gif"
open out.gif