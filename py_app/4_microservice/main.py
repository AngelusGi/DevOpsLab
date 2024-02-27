# main.py
import requests
import os
from flask import Flask, request, abort, jsonify
from random import randrange
from datetime import datetime, timezone
import pytz # you need to import this module to work with timezones

app = Flask(__name__)

port = int(os.environ.get('PORT', 8080))

@app.route("/")
def home():
    return render_template('index.html')

@app.route(rule='/getRandom', methods=['GET'])
def get_random():
    response = randrange(2048)
    __export_logs(route=request.url_rule, method=request.method, response=response)
    return jsonify({'answer': response})

def __get_log_time():
    timeZone = pytz.timezone("Europe/Rome") # you need to use pytz.timezone to create a timezone object
    return (datetime.now(tz=timeZone).strftime('%Y-%m-%d %H:%M:%S')) # you need to print the result


def __export_logs(route,method:str,**kwargs):
    __response = kwargs.get("response", None) # get the value of name or None if not given
    if (__response is None): # check if name is None
        __message_log = f"[{__get_log_time()}] route {route} - method > {method}"
    else:
        __message_log = f"[{__get_log_time()}] route {route} - method > {method} - result provided > {__response}"
    
    print(__message_log, flush=True)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=port)