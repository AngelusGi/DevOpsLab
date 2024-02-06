# app.py
from flask import Flask, request, abort, jsonify
from random import randrange
from datetime import datetime, timezone
import pytz # you need to import this module to work with timezones

app = Flask(__name__)


@app.route('/getSquare', methods=['POST'])
def get_square():
    if (not request.json or 'number' not in request.json):
        abort(400)
    num = request.json['number']
    if(type(num) is str):
        num = float(num)
    response = num ** 2
    __export_logs(route=request.url_rule, method=request.method, response=response)
    return jsonify({'answer': response})

@app.route(rule='/getRandom', methods=['GET'])
def get_random():
    response = randrange(2048)
    __export_logs(route=request.url_rule, method=request.method, response=response)
    return jsonify({'answer': response})

@app.route(rule="/hello", methods=['GET','POST'])
def get_greetings():
    if (request.method == 'GET'):
        __export_logs(route=request.url_rule, method=request.method)
        return jsonify({'answer': "hello"})
    elif(request.method == 'POST'):
        if (not request.json or 'name' not in request.json):
            abort(400)
        else:
            name = request.json['name']
            response = f"hello {name}!"
            __export_logs(route=request.url_rule, method=request.method, response=response)
            return jsonify({'answer': response })
    else:
        abort(400)

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
    

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True )
