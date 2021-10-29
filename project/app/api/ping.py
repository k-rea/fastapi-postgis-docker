from fastapi import APIRouter, Depends

from app.config import Settings, get_settings

router = APIRouter()


@router.get("/ping")
def pong(settings: Settings = Depends(get_settings)):
    return {
        "ping": "pong!",
        "msg": "This is Sample for fastAPI and PostGIS API with Docker!",
        "environment": settings.environment,
        "testing": settings.testing
    }
