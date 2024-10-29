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

def upload_file(service, file_path, drive_folder_id="1zETSzGW1-bECl6f2clFZhrJPuMwLyoyL"):
    file_metadata = {
        'name': os.path.basename(file_path),
        'parents': [drive_folder_id] if drive_folder_id else []
    }
    media = MediaFileUpload(file_path, resumable=True)
    file = service.files().create(
        body=file_metadata,
        media_body=media,
        fields='id, webViewLink, webContentLink'
    ).execute()
    print(f"File ID: {file.get('id')} uploaded successfully.")
    return file.get('webViewLink')

def send_telegram_message(message):
    telegram_token = os.environ.get('TELEGRAM_BOT_TOKEN')
    chat_id = os.environ.get('TELEGRAM_CHAT_ID')
    if not telegram_token or not chat_id:
        raise Exception("Telegram bot token or chat ID not found in environment variables")

    url = f"https://api.telegram.org/bot{telegram_token}/sendMessage"
    payload = {
        'chat_id': chat_id,
        'text': message
    }
    response = requests.post(url, json=payload)
    if response.status_code != 200:
        raise Exception(f"Failed to send message: {response.text}")
    print("Message sent successfully to Telegram.")

if __name__ == '__main__':
    # Authenticate and upload to Google Drive
    gdrive_service = authenticate_gdrive()
    file_path = 'build/app/outputs/flutter-apk/app-release.apk'
    drive_link = upload_file(gdrive_service, file_path)

    # Send message to Telegram
    message = f"✅ APK uploaded successfully!\nGoogle Drive Link: {drive_link}"
    send_telegram_message(message)
