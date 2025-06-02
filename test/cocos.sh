#!/bin/bash

# 结束ToDesk进程的函数
kill_todesk() {
    if pgrep ToDesk >/dev/null; then
        pkill ToDesk
    fi
}

# 获取随机数
get_random_number() {
    echo $((RANDOM % 100))
}

# 打开随机网址的函数
open_random_url() {
    local url_list_file="$HOME/Documents/GitHub/iospack/test/url_list.sh" # 假设网址列表文件名为url_list.txt
    local url=$(shuf -n 1 $url_list_file)
    echo "打开网址$url"
    open -a "Google Chrome" "$url"
    # 这里需要额外的逻辑来处理标签数量，可能需要使用AppleScript或其他工具
}

# 在Xcode中操作
xcode_operations() {
    local project_path="$HOME/Documents/GitHub/newslots-games-cocos/build/ios/proj/goplay.xcworkspace" # 替换为你的Xcode项目路径
    open -a Xcode "$project_path"
    # 这里需要额外的逻辑来切换窗口和滚动代码，可能需要使用AppleScript或其他工具
}

# 在VSCode中操作
vscode_operations() {
    local project_path="$HOME/Documents/GitHub/newslots-games-cocos/" # 替换为你的VSCode项目路径
    open -a "Visual Studio Code" "$project_path"
    # 这里需要额外的逻辑来切换窗口和滚动代码，可能需要使用AppleScript或其他工具
}

# 在Trae中操作
trae_operations() {
    local project_path="$HOME/Documents/GitHub/newslots-games-cocos/" # 替换为你的Trae项目路径
    open -a "Trae" "$project_path"
    # 这里需要额外的逻辑来切换窗口和滚动代码，可能需要使用AppleScript或其他工具
}

# 辅助函数：生成随机小写字母
generate_random_char() {
    chars=({a..z})
    echo "${chars[$RANDOM % 26]}"
}

# 键盘输入模拟（带撤销）
simulate_keyboard_input() {
    local weekday=$(date +"%w")
    weekday=$((7 - weekday))
    echo "weekday=$weekday"
    local random_range=$((RANDOM % $weekday + 10)) # 20-30
    echo "random_range=$random_range"
    local base_number=20
    local total_keys=$((base_number + random_range))
    echo "total_keys=$total_keys"
    local all_time=420
    local work_time=$(expr $total_keys \* $all_time / 100)
    echo "work_time=$work_time"
    local sleep_time=$((all_time - work_time))
    echo "sleep_time=$sleep_time"

    for ((i = 0; i < work_time; i++)); do
        # echo "i=$i"
        # 生成随机字符
        char=$(generate_random_char)

        # 模拟键盘输入
        osascript <<EOF
tell application "System Events"
    keystroke "$char"
    delay 0.2
    keystroke "z" using command down
end tell
EOF

        # 等待间隔（总间隔1秒）
        sleep 0.8
    done

    sleep $sleep_time

}

osascript -e 'tell application "System Events" to key code 4 using command down'
# 主循环
while true; do
    current_time=$(date +%H:%M)
    if [[ "$current_time" > "20:10" ]]; then
        pkill Hubstaff
        break
    fi

    kill_todesk
    random_num=$(get_random_number)
    remainder=$((random_num % 10))
    echo "随机数$remainder"
    case $remainder in
    0)
        open_random_url
        ;;
    1)
        open_random_url
        ;;
    2)
        xcode_operations
        ;;
    3)
        vscode_operations
        ;;
    4)
        vscode_operations
        ;;
    *)
        trae_operations
        ;;
    esac
    sleep 4

    simulate_keyboard_input
done
