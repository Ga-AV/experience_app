"""Lee una venta de Firestore, busca el token de su usuario y envía el push."""

import sys
import warnings

import firebase_admin
from firebase_admin import credentials, firestore, messaging

warnings.filterwarnings("ignore", category=DeprecationWarning)

SERVICE_ACCOUNT = "serviceAccountKey.json"

VENTA_ID = "fVjITc4OUoodArrt7s4k"

COLECCION_VENTAS = "sales"
COLECCION_USUARIOS = "users"

CAMPO_USUARIO = "user_id"
CAMPO_TOKEN = "token"


firebase_admin.initialize_app(
    credentials.Certificate(SERVICE_ACCOUNT)
)

db = firestore.client()

venta_snap = (
    db.collection(COLECCION_VENTAS)
    .document(VENTA_ID)
    .get()
)

if not venta_snap.exists:
    sys.exit(
        f"[!] No existe la venta '{VENTA_ID}' "
        f"en '{COLECCION_VENTAS}'"
    )

venta = venta_snap.to_dict()

print(f"Venta {VENTA_ID}: {venta}")

usuario = venta.get(CAMPO_USUARIO)

if not usuario:
    sys.exit(
        f"[!] La venta no tiene el campo '{CAMPO_USUARIO}'"
    )

if isinstance(usuario, firestore.DocumentReference):
    usuario_snap = usuario.get()
else:
    usuario_snap = (
        db.collection(COLECCION_USUARIOS)
        .document(str(usuario))
        .get()
    )


if not usuario_snap.exists:
    sys.exit(
        f"[!] No existe el usuario '{usuario}' "
        f"en '{COLECCION_USUARIOS}'"
    )


datos_usuario = usuario_snap.to_dict()

print(
    f"Usuario {usuario_snap.id}: "
    f"{datos_usuario.get('name', '(sin nombre)')}"
)

token = datos_usuario.get(CAMPO_TOKEN)

if not token:
    sys.exit(
        f"[!] El usuario '{usuario_snap.id}' "
        f"no tiene '{CAMPO_TOKEN}' guardado"
    )

print(f"Token encontrado: {token[:20]}...")

try:
    response = messaging.send(
        messaging.Message(
            notification=messaging.Notification(
                title="Venta confirmada ✅",
                body=(
                    f"Tu compra por "
                    f"{venta.get('total', 0)} "
                    f"ya está procesada"
                ),
            ),
            data={
                "feature": "sale_details",
                "sale_id": VENTA_ID,
                "total": str(venta.get("total", 0)),
            },
            token=token,
        )
    )

except messaging.UnregisteredError:

    usuario_snap.reference.update(
        {
            CAMPO_TOKEN: firestore.DELETE_FIELD
        }
    )

    sys.exit(
        f"[!] Token inválido. "
        f"Se eliminó '{CAMPO_TOKEN}' "
        f"de '{usuario_snap.id}'"
    )

except Exception as error:

    sys.exit(
        f"[!] Error enviando la notificación: {error}"
    )


print(
    f"Enviado a {usuario_snap.id} "
    f"({token[:20]}...)"
)

print(f"message_id: {response}")
