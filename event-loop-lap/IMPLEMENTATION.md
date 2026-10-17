# Credit Cards Financial API

1. **GET /api/v1/credit-cards** — Returns array of active cards (200 OK)
2. **GET /api/v1/credit-cards/:id** — Get single card (200 OK or 404 Not Found)
3. **POST /api/v1/credit-cards** — Create card (201 Created or 400 validation error)
4. **PATCH /api/v1/credit-cards/:id** — Update creditLimit/status (200 OK or 404)
5. **DELETE /api/v1/credit-cards/:id** — Soft delete (204 No Content or 404)
