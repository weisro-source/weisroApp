import os
import base64
import requests
from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
import speedtest

# Function to check internet speed
def print_internet_speed():
    st = speedtest.Speedtest()
    st.get_best_server()
    download_speed = st.download() / 1_000_000  # Convert to Mbps
    upload_speed = st.upload() / 1_000_000  # Convert to Mbps
    print(f"Internet Speed: Download {download_speed:.2f} Mbps, Upload {upload_speed:.2f} Mbps")

# Authentication and Drive setup
def authenticate_gdrive():
    base64_creds = os.environ.get('GDRIVE_CREDENTIALS')
    if not base64_creds:
        raise Exception("GDRIVE_CREDENTIALS not found in environment variables")

    # Decode the Base64 credentials and save it as a temporary JSON file
    creds_json = base64.b64decode(base64_creds).decode('utf-8')
    with open('credentials.json', 'w') as f:
        f.write(creds_json)

    # Authenticate using the downloaded credentials
    creds = Credentials.from_service_account_file('credentials.json')
    return build('drive', 'v3', credentials=creds)

def upload_file(service, file_path, custom_name, drive_folder_id="1zETSzGW1-bECl6f2clFZhrJPuMwLyoyL"):
    file_metadata = {
        'name': custom_name,
        'parents': [drive_folder_id] if drive_folder_id else []
    }
    media = MediaFileUpload(file_path, resumable=True)
    file = service.files().create(
        body=file_metadata,
        media_body=media,
        fields='id, webViewLink'
    ).execute()
    print(f"File ID: {file.get('id')} uploaded successfully.")
    
    # Set file permission to "anyone with the link"
    permission = {
        'type': 'anyone',
        'role': 'reader'
    }
    service.permissions().create(fileId=file.get('id'), body=permission).execute()

    return file.get('webViewLink')

def send_telegram_message(message, telegram_token, chat_id):
    url = f"https://api.telegram.org/bot{telegram_token}/sendMessage"
    payload = {
        'chat_id': chat_id,
        'text': message
    }
    response = requests.post(url, json=payload)
    if response.status_code != 200:
        raise Exception(f"Failed to send message: {response.text}")
    print("Message sent successfully to Telegram.")
    return response.json()['result']['message_id']

def send_telegram_file(file_path, telegram_token, chat_id,custom_apk_name):
    url = f"https://api.telegram.org/bot{telegram_token}/sendDocument"
    with open(file_path, 'rb') as file:
        response = requests.post(url, data={'chat_id': chat_id}, files={'document': (custom_apk_name, file)})
    if response.status_code != 200:
        raise Exception(f"Failed to send file: {response.text}")
    print("File sent successfully to Telegram.")
    return response.json()['result']['message_id']
def forward_telegram_message(telegram_token, from_chat_id, message_id, to_chat_id):
    url = f"https://api.telegram.org/bot{telegram_token}/forwardMessage"
    payload = {
        'chat_id': to_chat_id,
        'from_chat_id': from_chat_id,
        'message_id': message_id
    }
    response = requests.post(url, json=payload)
    if response.status_code != 200:
        raise Exception(f"Failed to forward message: {response.text}")
    print("Message forwarded successfully to another group.")
# Sanitize the file name
def sanitize_filename(filename):
    return filename.replace(':', '_').replace('/', '_')
if __name__ == '__main__':
    # Print internet speed
    print_internet_speed()
    # Get environment variables
    telegram_token = os.environ.get('TELEGRAM_BOT_TOKEN')
    chat_id = os.environ.get('TELEGRAM_CHAT_ID')
    custom_apk_name = sanitize_filename("Version-1.0.4+5_2-12-2025.apk")

    # Authenticate and upload to Google Drive
    gdrive_service = authenticate_gdrive()
    file_path = 'build/app/outputs/flutter-apk/app-release.apk'
    drive_link = upload_file(gdrive_service, file_path, custom_apk_name)

    # Send message to Telegram
    message = f"✅ Weisro APK uploaded successfully!\nGoogle Drive Link: {drive_link}"
    message_id = send_telegram_message(message, telegram_token, chat_id)

    # Send APK file to the first chat/group
    file_message_id = send_telegram_file(file_path, telegram_token, chat_id,custom_apk_name)
    forward_telegram_message(telegram_token, chat_id, message_id, "-4515415857")
    forward_telegram_message(telegram_token, chat_id, file_message_id, "-4515415857")