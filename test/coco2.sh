#!/bin/bash

# 隐藏终端窗口
osascript -e 'tell application "Terminal" to close first window' &

# 进程控制函数
kill_todesk() {
    pgrep ToDesk | xargs kill -9 2>/dev/null
}

# 窗口最大化通用函数
maximize_window() {
    osascript <<EOD
tell application "System Events"
    set frontApp to name of first application process whose frontmost is true
    tell process frontApp
        set value of attribute "AXFullScreen" of window 1 to true
    end tell
end tell
EOD
}

# 浏览器操作函数
browser_operation() {
    # 随机获取目标标签数
    local target_tabs=$(jot -r 1 4 7)
    local current_tabs=$(osascript <<EOD
tell application "Google Chrome"
    return count of tabs of front window
end tell
EOD
)
    
    # 关闭多余标签
    while [ $current_tabs -gt $target_tabs ]; do
        osascript -e 'tell application "Google Chrome" to close last tab of front window'
        ((current_tabs--))
    done

    # 访问随机网址
    local url=$(shuf -n 1 /Users/mask/Documents/GitHub/iospack/test/url_list.txt)
    open -a "Google Chrome" "$url"
    maximize_window
}

# IDE通用操作函数
ide_operation() {
    local app_name=$1
    local project_path=$2
    
    # 启动IDE
    open -a "$app_name" "$project_path"
    sleep 2
    maximize_window

    # 窗口切换周期
    while true; do
        # 滚动代码
        osascript <<EOD
tell application "System Events"
    key code 125 using command down  # 向下滚动
    delay 0.5
    key code 126 using command down  # 向上滚动
end tell
EOD
        sleep 5
        
        # 窗口切换
        osascript <<EOD
tell application "System Events"
    key code 48 using {command down}  # 切换编辑器窗口
end tell
EOD
        sleep 10
    done &
}

# 智能输入模拟函数
smart_typing() {
    local base=25
    local random_add=$(jot -r 1 20 30)
    local percentage=$((base + random_add))
    local active_time=$((420 * percentage / 100))  # 总秒数*百分比
    local sleep_time=$((420 - active_time))

    # 活动时段
    end_time=$((SECONDS + active_time))
    while [ $SECONDS -lt $end_time ]; do
        # 生成随机输入模式（60%概率输入，40%概率暂停）
        if [ $((RANDOM % 100)) -lt 60 ]; then
            # 模拟代码输入（带撤销）
            char=$(jot -rc 1 a z | tr -d '\n')
            osascript <<EOD
tell application "System Events"
    keystroke "$char"
    delay 0.3
    keystroke "z" using command down
end tell
EOD
        else
            # 模拟暂停思考（长间隔）
            sleep_time=$(jot -r 1 3 8)
            sleep $sleep_time
        fi
        sleep 0.7
    done

    # 休眠时段
    sleep $sleep_time
}

# 主程序
while true; do
    # 时间检查
    if [ $(date +%H%M) -gt 2010 ]; then
        pkill Hubstaff
        pkill Xcode
        pkill "Visual Studio Code"
        exit 0
    fi

    kill_todesk

    # 第一阶段操作
    case $((RANDOM % 6)) in
        1)
            browser_operation
            ;;
        2)
            ide_operation "Xcode" "/Users/mask/Documents/GitHub/newslots-games-cocos/build/ios/proj/goplay.xcworkspace"
            ;;
        *)
            ide_operation "Visual Studio Code" "/Users/mask/Documents/GitHub/newslots-games-cocos/"
            ;;
    esac

    # 第二阶段操作
    smart_typing
done