from firebase_admin import firestore, initialize_app, messaging
from firebase_functions import firestore_fn


initialize_app()


def send_push_notification(token, message_payload):


    notification = messaging.Notification(
        title=message_payload['title'],
        body=message_payload['body'],
    )


    message = messaging.Message(
        notification=notification,
        token=token,
    )

    response = messaging.send(message)
    print('Successfully sent message:', response)


@firestore_fn.on_document_created(
    document="sales/{sale_id}",
)
def nueva_venta(event):
    print("============================================================")
    print("🔥 TRIGGER: NUEVA VENTA")
    print("============================================================")

    if event.data is None:
        print("❌ Event has no document data.")
        return

    sale_id = event.params["sale_id"]
    sale_data = event.data.to_dict() or {}

    print("============================================================")
    print("🛒 SALE DATA")
    print("============================================================")
    print(f"Sale ID: {sale_id}")
    print(f"Sale data: {sale_data}")

    user_id = sale_data.get("user_id")
    if not user_id:
        print("❌ Sale has no user_id.")
        return

    print(f"User ID: {user_id}")

    db = firestore.client()

    user_snapshot = db.collection("users").document(str(user_id)).get()
    if not user_snapshot.exists:
        print(f"❌ User '{user_id}' does not exist.")
        return

    user_data = user_snapshot.to_dict() or {}
    print(f"User data: {user_data}")

    token = user_data.get("token")
    if not token:
        print(f"❌ User '{user_id}' has no FCM token.")
        return

    print("============================================================")
    print("📱 FCM TOKEN FOUND")
    print("============================================================")
    print(f"Token: {token[:20]}...")

    message = {
        'title': 'New Sale Notification',
        'body': f'A new sale has been made with ID: {sale_id}',
    }

    send_push_notification(token, message)

    print("============================================================")
    print("🏁 NOTIFICATION SENT")
    print("============================================================")