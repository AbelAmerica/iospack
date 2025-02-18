#!/bin/bash


osascript -e 'tell application "System Events" to key code 4 using command down'

# 找到 Hubstaff 的进程并强制结束
if pgrep -x "ToDesk" > /dev/null; then
    echo "ToDesk is running"
    pkill -f "ToDesk"
    if [ $? -eq 0 ]; then
        echo "ToDesk 已被成功结束。"
    else
        echo "未找到 ToDesk 进程，或结束失败。"
    fi
else
    echo "ToDesk is not running"
fi
    
# 无限循环
while true; do
    # 随机生成 1 或 2，代表屏幕 1 或 2
    screen=$((RANDOM % 2 + 1))
    # screen=1

    # 使用 osascript 切换屏幕
    if [ "$screen" -eq 1 ]; then
        echo "切换到屏幕 1"
        echo "打开项目"

        # open -a Xcode /Users/mask/Documents/GitHub/newslots-games-cocos/native/engine/ios/service/FirebaseSDK.m
        # 随机选择屏幕 1 或屏幕 2
        PROJECT_PATH="/Users/mask/Documents/GitHub/newslots-games-cocos/build/ios/proj/goplay.xcworkspace" # 替换为实际文件路径
        echo "Switching to screen  and opening $file_path"

        # 打开指定项目
        open -a Xcode "$PROJECT_PATH"

        # 等待 Xcode 启动
        sleep 10

        # 切换到全屏模式
        osascript <<EOF
        tell application "System Events"
            tell application process "Xcode"
                keystroke "f" using {control down, command down}
            end tell
        end tell
EOF

        sleep 10

        urls=(
        "https://www.bilibili.com/video/BV1HY411H7V5/?spm_id_from=333.788.videopod.episodes&vd_source=263a9bf4c1360296ae85fa5d618aec2f&p=11"
        "https://docs.cocos.com/creator/2.4/manual/zh/components/sprite.html"
        "https://www.bilibili.com/video/BV1HY411H7V5/?spm_id_from=333.788.videopod.episodes&vd_source=263a9bf4c1360296ae85fa5d618aec2f&p=11"
        "https://docs.cocos.com/creator/2.4/manual/zh/components/sprite.html"
        "https://www.bilibili.com/video/BV1HY411H7V5/?spm_id_from=333.788.videopod.episodes&vd_source=263a9bf4c1360296ae85fa5d618aec2f&p=11"
        "https://docs.cocos.com/creator/2.4/manual/zh/components/sprite.html"
        "https://www.bilibili.com/video/BV1HY411H7V5/?spm_id_from=333.788.videopod.episodes&vd_source=263a9bf4c1360296ae85fa5d618aec2f&p=11"
        "https://docs.cocos.com/creator/2.4/manual/zh/components/sprite.html"
        "https://www.google.com"
        "https://github.com/AbelAmerica/iospack"
        "https://github.com/AbelAmerica/iospack/blob/main/goplay-mobile.ipa"
        "https://github.com/AbelAmerica/iospack/blob/main/%E8%AF%B4%E6%98%8E.md"
        "https://github.com/AbelAmerica/iospack/blob/main/manifest.plist"
        "https://www.stackoverflow.com"
        "http://jira.tools5c6ae5402bbe9415.com/secure/Dashboard.jspa"
        "https://admin.goplaystage.com/#/ops/appManagement"
        "https://d4e36d7f03d8b593cb51b02e6b915b51.com/gp-games/slots-app-ios"
        "https://translate.google.com.hk/?hl=hk&sourceid=cnhp&sl=auto&tl=zh-CN&op=translate"
        "https://www.json.cn/#gsc.tab=0"
        "http://jira.tools5c6ae5402bbe9415.com/secure/Dashboard.jspa"
        "https://admin.goplaystage.com/#/ops/ops_siteManagement"
        "https://d4e36d7f03d8b593cb51b02e6b915b51.com/gp-games/newslots-games-cocos/-/issues/service_desk"
        "https://d4e36d7f03d8b593cb51b02e6b915b51.com/gp-games/newslots-games-cocos/-/project_members"
        "https://chatgpt.com/"
        "http://jira.tools5c6ae5402bbe9415.com/secure/RapidBoard.jspa?rapidView=8&projectKey=GOP&view=planning.nodetail&quickFilter=15"
        )
        # 生成随机索引
        random_index=$(( RANDOM % ${#urls[@]} ))
        # 获取随机URL
        random_url=${urls[$random_index]}
        # 使用 Chrome 打开随机 URL
        open -a "Google Chrome" "$random_url"
        sleep 10
    else
        echo "切换到屏幕 2"
        osascript -e 'tell application "System Events" to key code 124 using {control down}' # 右箭头

        screen=$((RANDOM % 2 + 1))

        # 使用 osascript 切换屏幕
        if [ "$screen" -eq 1 ]; then
            echo "打开项目"

            # open -a Xcode /Users/mask/Documents/GitHub/newslots-games-cocos/native/engine/ios/service/FirebaseSDK.m
            # 随机选择屏幕 1 或屏幕 2
            PROJECT_PATH="/Users/mask/Documents/GitHub/newslots-games-cocos/build/ios/proj/goplay.xcworkspace" # 替换为实际文件路径
            echo "Switching to screen  and opening $file_path"


            # 打开指定项目
            open -a Xcode "$PROJECT_PATH"

            # 等待 Xcode 启动
            sleep 10

            # 切换到全屏模式
            osascript <<EOF
            tell application "System Events"
                tell application process "Xcode"
                    keystroke "f" using {control down, command down}
                end tell
            end tell
EOF
        sleep 10
        else
            echo "随机打开文件"

            # 指定要搜索的目录
            TARGET_DIR="/Users/mask/Documents/GitHub/newslots-games-cocos/native/engine/ios"

            # 获取该目录及其子目录中的所有文件路径
            FILES=($(find "$TARGET_DIR" -type f))

            # 检查是否有文件
            if [ ${#FILES[@]} -eq 0 ]; then
            echo "指定的目录中没有找到任何文件。"
            exit 1
            fi

            # 随机选择一个文件
            RANDOM_FILE=${FILES[$RANDOM % ${#FILES[@]}]}

            # 使用 Xcode 全屏打开文件（通过 AppleScript 设置全屏）
            osascript <<EOF
            tell application "Xcode"
                open POSIX file "$RANDOM_FILE"
                activate
            end tell
            tell application "System Events"
                keystroke "f" using {control down, command down}
            end tell
EOF
        sleep 10
        fi
    fi


    num1=420
    divide=100

    random_num_all=$((RANDOM % 21 + 27))
    random_num=$(expr $num1 \* $random_num_all / $divide)

    echo "Random number: $random_num"

    for i in $(seq 1 $random_num); do
        # 生成一个随机数，范围 0-61
        random=$((RANDOM % 62))

        # 映射到数字和字母
        if [ "$random" -lt 10 ]; then
        # 数字 0-9 (ASCII: 48-57)
        char=$(printf "\\$(printf '%03o' $((random + 48)))")
        elif [ "$random" -lt 36 ]; then
        # 大写字母 A-Z (ASCII: 65-90)
        char=$(printf "\\$(printf '%03o' $((random + 55)))")
        else
        # 小写字母 a-z (ASCII: 97-122)
        char=$(printf "\\$(printf '%03o' $((random + 61)))")
        fi

        # 使用 osascript 模拟按键
        osascript -e "tell application \"System Events\" to keystroke \"$char\""

        sleep 1
        osascript -e 'tell application "System Events" to key code 6 using command down'
    done
    
    exttime=10
    random_num_last=$(expr $num1 - $random_num + $exttime)
    echo "等待 $random_num_last 秒"
    sleep $random_num_last
    

    # 获取当前时间（24小时制），格式为 "小时分钟" (如 2110)
    current_time=$(date +"%H%M")

    # 设置目标时间为 21:10
    target_time=2010

    # 检查当前时间是否晚于 21:10
    if [ "$current_time" -ge "$target_time" ]; then
        echo "当前时间晚于 20:10，正在结束 Hubstaff..."

        # 找到 Hubstaff 的进程并强制结束
        if pgrep -x "Hubstaff" > /dev/null; then
            echo "Hubstaff is running"
            pkill -f "Hubstaff"
            if [ $? -eq 0 ]; then
                echo "Hubstaff 已被成功结束。"
            else
                echo "未找到 Hubstaff 进程，或结束失败。"
            fi
        else
            echo "Hubstaff is not running"
        fi
    else
    echo "当前时间早于 21:10，继续运行。"
    fi

    if pgrep -x "Xcode" > /dev/null; then
        echo "Xcode is running"
        # 使用 AppleScript 关闭 Xcode 的所有窗口
        osascript <<EOF
        tell application "Xcode"
            close every window
        end tell
EOF
    else
        echo "Xcode is not running"
    fi

    sleep_time2=$((RANDOM % 5 + 10))
    sleep $sleep_time2

    # 检查 Google Chrome 是否运行
    if  pgrep -x "Google Chrome" > /dev/null; then
        echo "Google Chrome is running."

        osascript <<EOD
        tell application "Google Chrome"
            set allWindows to every window
            repeat with w in allWindows
                set tabCount to count of tabs of w
                if tabCount > 7 then
                    repeat with i from (tabCount) to 8 by -1
                        close tab i of w
                    end repeat
                end if
            end repeat
        end tell
EOD
        echo "Excess windows closed. Remaining window count: 7"
    else
        echo "Google Chrome is not running"
    fi

    sleep 10
done
