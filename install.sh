#!/bin/sh

cat <<"EOF"
__________                        ____   ____
\______   \__  _  ______          \   \ /   /
 |     ___/\ \/ \/ /    \   ______ \   Y   /
 |    |     \     /   |  \ /_____/  \     /
 |____|      \/\_/|___|  /           \___/
                       \/
________
\______ \  __ __  ____
 |    |  \|  |  \/  _ \
 |    |   \  |  (  <_> )
/_______  /____/ \____/
        \/
EOF

echo "★ v1.0.0 ★"
echo ""
echo "by: https://github.com/0x1iii1ii/Pwn-V-Duo"
echo "credit to:"
echo "https://github.com/TheOfficialFloW/PPPwn"
echo "https://github.com/xfangfang/PPPwn_cpp"
echo "https://github.com/SiSTR0"
echo ""

# Colors
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
BGreen='\033[1;32m'       # Bold Green
BYellow='\033[1;33m'      # Bold Yellow
BCyan='\033[1;36m'        # Cyan
NC='\033[0m'              # No Color

# Display the list of firmware versions
echo "Please select your PS4 firmware version:"
echo "a) 9.00"
echo "b) 9.03"
echo "c) 9.60"
echo "d) 10.00"
echo "e) 10.01"
echo "f) 10.50"
echo "g) 10.70"
echo "h) 10.71"
echo "i) 11.00"

# Prompt the user for the selection
while true; do
    echo ""
    read -p "Enter your choice (a/b/c/d/e/f/g/h/i): " FW_CHOICE
    case $FW_CHOICE in
        a) FW_VERSION="900"; READABLE_FW_VERSION="9.00" ;;
        b) FW_VERSION="903"; READABLE_FW_VERSION="9.03" ;;
        c) FW_VERSION="960"; READABLE_FW_VERSION="9.60" ;;
        d) FW_VERSION="1000"; READABLE_FW_VERSION="10.00" ;;
        e) FW_VERSION="1001"; READABLE_FW_VERSION="10.01" ;;
        f) FW_VERSION="1050"; READABLE_FW_VERSION="10.50" ;;
        g) FW_VERSION="1070"; READABLE_FW_VERSION="10.70" ;;
        h) FW_VERSION="1071"; READABLE_FW_VERSION="10.71" ;;
        i) FW_VERSION="1100"; READABLE_FW_VERSION="11.00" ;;
        *) echo "Invalid choice. Please select a valid option." ;;
    esac
    # Confirmation of firmware version
    echo -e "You have selected firmware version ${BGreen}$READABLE_FW_VERSION${NC}. Is this correct? (y/n)"
    read -p "Enter your choice: " CONFIRMATION
    if [ "$CONFIRMATION" = "y" ]; then
        break
    else
        echo "Firmware selection not confirmed. Please select again."
        FW_CHOICE=""
        CONFIRMATION=""
    fi
done

# Ask user if they want shutdown after jailbreak
while true; do
    echo ""
    echo "Do you want your device to shutdown after successfully jailbreak? (y/n)"
    read -p "Enter your choice: " HALT_CHOICE
    if [[ "$HALT_CHOICE" == "y" || "$HALT_CHOICE" == "n" ]]; then
        break
    else
        echo "Invalid choice. Please enter 'y' or 'n'."
    fi
done
INSTALL_DIR=$(pwd)
STAGE1_FILE="stage1/$FW_VERSION/stage1.bin"
STAGE2_FILE="stage2/$FW_VERSION/stage2.bin"

cat <<EOL > S99pppwn
#!/bin/sh

INSTALL_DIR=$INSTALL_DIR
FW_VERSION=$FW_VERSION
STAGE1_FILE="$STAGE1_FILE"
STAGE2_FILE="$STAGE2_FILE"
HALT_CHOICE=$HALT_CHOICE
PPPWN_EXEC=$PPPWN_EXEC

case \$1 in
    start)
        echo "Starting pppwn"
        cd \$INSTALL_DIR
        ifconfig eth0 down
        sleep 1
        ifconfig eth0 up
        sleep 1
        \$INSTALL_DIR/pppwn_riscv --interface eth0 --fw \$FW_VERSION --stage1 "\$STAGE1_FILE" --stage2 "\$STAGE2_FILE" -a -nw -t 5 -wap 5
		if [ "\$HALT_CHOICE" = "y" ]; then
			sleep 1
			ifconfig eth0 down
			sleep 1
			halt
		else
			echo "System halt skipped."
		fi
        ;;
    stop)
        echo "Stopping pppwn"
        ;;
    *)
        echo "Usage: \$0 {start|stop}"
        exit 1
        ;;
esac

exit 0

EOL

# rename
mv /etc/init.d/S99user /etc/init.d/S98user
mv S99pppwn /etc/init.d/
chmod +x /etc/init.d/S99pppwn pppwn_riscv
echo -e "${BGreen}install completed!${NC}"
