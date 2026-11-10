from fastapi import FastAPI
from app.routers import game_router

app = FastAPI()
app.include_router(game_router)

@app.get("/ping")
def get_ping():
    return "Buzi-e vagy?"