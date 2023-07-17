from flask import Flask, render_template
import random

app = Flask(__name__)

# list of cat images
images = ["http://localhost:8888/usr/src/app/images/IMG_2752.jpeg",
        "/usr/src/app/images/IMG_4764.jpeg",
        "/usr/src/app/images/IMG_5752.jpeg"]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")