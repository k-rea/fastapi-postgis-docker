from fastapi import FastAPI

app = FastAPI()


@app.get('/')
def index() -> dict:
    return {"msg": "Hello world!"}
