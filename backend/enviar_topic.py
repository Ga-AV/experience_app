"""Envía una notificación push a todos los dispositivos
suscritos a un topic de Firebase Cloud Messaging.
"""

import firebase_admin
from firebase_admin import credentials, messaging

SERVICE_ACCOUNT = "serviceAccountKey.json"

TOPIC = "noticias"

TITLE = "Novedades 📣"
BODY = "Ya está disponible la nueva versión"

DATA = {
    "feature": "news",
    "version": "2.0",
}


firebase_admin.initialize_app(
    credentials.Certificate(SERVICE_ACCOUNT)
)


message_id = messaging.send(
    messaging.Message(
        notification=messaging.Notification(
            title=TITLE,
            body=BODY,
        ),
        data=DATA,
        topic=TOPIC,
    )
)


print(f"Enviado al topic '{TOPIC}'")
print(f"message_id: {message_id}")
