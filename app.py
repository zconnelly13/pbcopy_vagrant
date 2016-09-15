from flask import Flask
from flask import request
from os import system


app = Flask(__name__)


@app.route('/', methods=["GET"])
def paste():
    pasta = request.args['c']
    system('echo "{pasta}" | pbcopy'.format(pasta=pasta))
    return pasta
