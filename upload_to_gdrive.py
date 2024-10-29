from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build
import os

# Authentication and Drive setup
def authenticate_gdrive():
    # Get the credentials from the environment
    base64_creds = os.environ.get('GDRIVE_CREDENTIALS')
    if not base64_creds:
        raise Exception("GDRIVE_CREDENTIALS not found in environment variables")

    # Decode the Base64 credentials and save it as a temporary JSON file
    with open('credentials.json', 'w') as f:
        f.write(base64_creds.decode('base64'))

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
        fields='id'
    ).execute()
    print(f"File ID: {file.get('id')} uploaded successfully.")

if __name__ == '__main__':
    gdrive_service = authenticate_gdrive()
    upload_file(gdrive_service, 'build/app/outputs/flutter-apk/app-release.apk')
