#!/bin/sh

# Token bot Telegram dan ID chat
BOT_TOKEN="your_bot_token_here"
CHAT_ID="your_chat_id_here"

# Alamat IP yang akan di-ping
TARGET_IP="target_ip_here"

# Daftar interface
INTERFACES="eth1 usb0 usb1"

# File log untuk menyimpan hasil
LOG_FILE="/root/internet_fail.log"

# Fungsi untuk mengirim pesan ke Telegram
send_telegram_message() {
  local message=$1
  curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    -d chat_id=${CHAT_ID} \
    -d text="${message}"
}

# Kosongkan file log sebelum mulai
> $LOG_FILE

# Cek status interface dan ping
for iface in $INTERFACES; do
  # Cek apakah interface memiliki IP
  if ip addr show $iface | grep -q "inet "; then
    # Cek ping
    if ! ping -I $iface -c 1 $TARGET_IP > /dev/null; then
      # Dapatkan waktu saat ini
      FAIL_TIME=$(date +"%Y-%m-%d %H:%M:%S")
      echo "Ping to ${TARGET_IP} via ${iface} failed at ${FAIL_TIME}" >> $LOG_FILE
    fi
  fi
done

# Cek apakah ada log yang tersimpan
if [ -s $LOG_FILE ]; then
  # Kirim isi log ke Telegram
  while IFS= read -r line; do
    send_telegram_message "$line"
  done < $LOG_FILE
fi
