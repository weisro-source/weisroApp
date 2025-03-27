import os
import base64
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import requests
from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload


def authenticate_gdrive():
    base64_creds = os.environ.get('GDRIVE_CREDENTIALS')
    if not base64_creds:
        raise Exception(
            "GDRIVE_CREDENTIALS not found in environment variables")

    creds_json = base64.b64decode(base64_creds).decode('utf-8')
    with open('credentials.json', 'w') as f:
        f.write(creds_json)

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

    permission = {'type': 'anyone', 'role': 'reader'}
    service.permissions().create(fileId=file.get('id'), body=permission).execute()

    return file.get('webViewLink')


def send_telegram_message(message, telegram_token, chat_id):
    url = f"https://api.telegram.org/bot{telegram_token}/sendMessage"
    payload = {'chat_id': chat_id, 'text': message}
    response = requests.post(url, json=payload)
    if response.status_code != 200:
        raise Exception(f"Failed to send message: {response.text}")
    print("Message sent successfully to Telegram.")
    return response.json()['result']['message_id']


def send_telegram_file(file_path, telegram_token, chat_id, custom_file_name):
    url = f"https://api.telegram.org/bot{telegram_token}/sendDocument"
    with open(file_path, 'rb') as file:
        response = requests.post(url, data={'chat_id': chat_id}, files={
                                 'document': (custom_file_name, file)})
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


def send_email(subject, body, email_user, email_password, recipients):
    # Loop over recipients and send the email to each one
    for recipient in recipients:
        msg = MIMEMultipart()
        msg['From'] = email_user
        msg['To'] = recipient
        msg['Subject'] = subject
        msg.attach(MIMEText(body, 'plain'))

        try:
            # Set up the SMTP server
            server = smtplib.SMTP('smtp.gmail.com', 587)
            server.starttls()
            server.login(email_user, email_password)
            server.send_message(msg)
            server.quit()
            print(f"Email sent successfully to {recipient}")
        except Exception as e:
            print(f"Failed to send email to {recipient}: {e}")


def sanitize_filename(filename):
    return filename.replace(':', '_').replace('/', '_')


if __name__ == '__main__':
    telegram_token = os.environ.get('TELEGRAM_BOT_TOKEN')
    chat_id = os.environ.get('TELEGRAM_CHAT_ID')

    email_user = os.environ.get('EMAIL_USER')
    email_password = os.environ.get('EMAIL_PASSWORD')
    # List of recipients
    recipients = [
        "nassimsolimanflutter@gmail.com",
        "nassimsoliman22@gmail.com",
        "nassimtok9@gmail.com",

    ]

    apk_path = 'build/app/outputs/flutter-apk/app-release.apk'
    apk_name = sanitize_filename("Weisro-APK_1.0.4+5_2-12-2025.apk")

    aab_path = 'build/app/outputs/bundle/release/app-release.aab'
    aab_name = sanitize_filename("Weisro-AAB_1.0.4+5_2-12-2025.aab")

    gdrive_service = authenticate_gdrive()

    # Upload APK and AAB
    apk_link = upload_file(gdrive_service, apk_path, apk_name)
    aab_link = upload_file(gdrive_service, aab_path, aab_name)

    # Send Telegram Notifications
    send_telegram_message(
        f"✅ Weisro APK uploaded successfully!\nGoogle Drive Link: {apk_link}", telegram_token, chat_id)
    send_telegram_file(apk_path, telegram_token, chat_id, apk_name)
    send_telegram_message(
        f"✅ Weisro AAB uploaded successfully!\nGoogle Drive Link: {aab_link}", telegram_token, chat_id)
    send_telegram_file(aab_path, telegram_token, chat_id, aab_name) 
    # Send Email with Drive Links
    email_body = f"""
    Hi,

    The APK and AAB have been successfully built and uploaded to Google Drive. Here are the download links:

    - APK: {apk_link}
    - AAB: {aab_link}

    Best regards,
    Your CI/CD Pipeline
    """
    send_email("Weisro Build Uploaded", email_body,
               email_user, email_password, recipients)
