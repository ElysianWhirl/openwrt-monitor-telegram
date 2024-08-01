**README.md**:

```markdown
# OpenWrt Monitor Telegram

A shell script for OpenWrt devices to monitor network interfaces and ping status, alerting via a Telegram bot on connectivity failures.

## Features

- Monitors specified network interfaces for IP assignment and connectivity.
- Logs failed pings to a specified target IP.
- Sends alerts to a Telegram chat via bot upon detecting connectivity issues.

## Installation

### Clone the Repository

Clone the repository to your OpenWrt device:

```sh
git clone https://github.com/ElysianWhirl/openwrt-monitor-telegram.git
```

### Download Script Using `wget`

Alternatively, you can download the script directly using `wget`:

```sh
wget https://raw.githubusercontent.com/ElysianWhirl/openwrt-monitor-telegram/main/openwrt_monitor.sh -O /path/to/openwrt_monitor.sh
```

## Configuration

1. **Set Telegram Bot Token and Chat ID**:
   Open the script and set your Telegram bot token and chat ID:
   ```sh
   BOT_TOKEN="your_bot_token_here"
   CHAT_ID="your_chat_id_here"
   ```

2. **Set the Target IP Address**:
   Specify the IP address you want to ping:
   ```sh
   TARGET_IP="target_ip_here"
   ```

3. **Specify Network Interfaces**:
   List the network interfaces to monitor:
   ```sh
   INTERFACES="eth1 usb0 usb1"
   ```

## Usage

Make the script executable:

```sh
chmod +x /path/to/openwrt_monitor.sh
```

Run the script manually:

```sh
/path/to/openwrt_monitor.sh
```

## Run at Startup

To run the script at startup on an OpenWrt device, add it to the system startup scripts:

```sh
cat << EOF >> /etc/rc.local
/path/to/openwrt_monitor.sh &
EOF
```

Make sure to replace `/path/to/openwrt_monitor.sh` with the actual path where you saved the script.

## License

This project is licensed under the MIT License.
```

### Final Steps

1. **Push the README.md**: Ensure the `README.md` file is in your local repository and push it to GitHub:
   ```sh
   git add README.md
   git commit -m "Add README with installation and configuration instructions"
   git push origin main
   ```

2. **Test the Script**: Run the script on your OpenWrt device and ensure it functions correctly.

3. **Startup Configuration**: Verify that the script is set up to run on startup by checking your OpenWrt device's configuration.

By following these steps, your repository will be fully set up, and users will have clear instructions on how to install, configure, and run the script.
