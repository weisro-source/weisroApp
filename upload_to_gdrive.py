import os
import base64
import requests
from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload

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

def send_telegram_file(file_path, telegram_token, chat_id):
    url = f"https://api.telegram.org/bot{telegram_token}/sendDocument"
    with open(file_path, 'rb') as file:
        response = requests.post(url, data={'chat_id': chat_id}, files={'document': file})
    if response.status_code != 200:
        raise Exception(f"Failed to send file: {response.text}")
    print("File sent successfully to Telegram.")

if __name__ == '__main__':
    # Get environment variables
    telegram_token = os.environ.get('TELEGRAM_BOT_TOKEN')
    chat_id = os.environ.get('TELEGRAM_CHAT_ID')
    custom_apk_name = "V:0.0.1 29/11/2025"

    # Authenticate and upload to Google Drive
    gdrive_service = authenticate_gdrive()
    file_path = 'build/app/outputs/flutter-apk/app-release.apk'
    drive_link = upload_file(gdrive_service, file_path, custom_apk_name)

    # Send message to Telegram
    message = f"✅ APK uploaded successfully!\nGoogle Drive Link: {drive_link}"
    send_telegram_message(message, telegram_token, chat_id)

    # Send APK file to Telegram
    send_telegram_file(file_path, telegram_token, chat_id)
