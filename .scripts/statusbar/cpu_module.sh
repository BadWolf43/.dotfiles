#!/bin/sh


icon=~/.icons/dunst/cpu-icon_x128.png
title_fg="foreground='#E8E713'"
color_bg="string:bgcolor:#252732"
color_fg="string:fgcolor:#05ffaf"
time="5000"
cpu="$(ps axc -o cmd:15,%cpu --sort=-%cpu | head -n 15)"

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>CPU Module</b></u></span>

echo $cpu" ;;
esac

#---------------------

URGENT_VALUE=90
PREV_TOTAL=0
PREV_IDLE=0

cpuFile="/tmp/.cpu"

if [[ -f "${cpuFile}" ]]; then
  fileCont=$(cat "${cpuFile}")
  PREV_TOTAL=$(echo "${fileCont}" | head -n 1)
  PREV_IDLE=$(echo "${fileCont}" | tail -n 1)
fi

CPU=(`cat /proc/stat | grep '^cpu '`) # Get the total CPU statistics.
unset CPU[0]                          # Discard the "cpu" prefix.
IDLE=${CPU[4]}                        # Get the idle CPU time.

# Calculate the total CPU time.
TOTAL=0

for VALUE in "${CPU[@]:0:4}"; do
  let "TOTAL=$TOTAL+$VALUE"
done

if [[ "${PREV_TOTAL}" != "" ]] && [[ "${PREV_IDLE}" != "" ]]; then
  # Calculate the CPU usage since we last checked.
  let "DIFF_IDLE=$IDLE-$PREV_IDLE"
  let "DIFF_TOTAL=$TOTAL-$PREV_TOTAL"
  let "DIFF_USAGE=(1000*($DIFF_TOTAL-$DIFF_IDLE)/$DIFF_TOTAL+5)/10"
  echo "${DIFF_USAGE}%"
  echo "${DIFF_USAGE}%"
  echo ""
else
  echo "?"
  echo "?"
  echo ""
fi

# Remember the total and idle CPU times for the next check.
echo "${TOTAL}" > "${cpuFile}"
echo "${IDLE}" >> "${cpuFile}"

if [[ "${DIFF_USAGE}" -gt 0 ]] && [[ "${DIFF_USAGE}" -gt "${URGENT_VALUE}" ]]; 
then
  exit 33
fi
