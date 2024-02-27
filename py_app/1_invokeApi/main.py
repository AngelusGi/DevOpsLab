import requests
import json
import os

def get_hp_book(baseUrl:str = "https://api.potterdb.com", version:str = "v1", outputJson:str="output.json", **kwargs):
    bookId = kwargs.get('bookId', None)
    chapterId = kwargs.get('chapterId', None)
    
    if (bookId is None) and (chapterId is None):
        api = "books"
    elif (bookId is not None) and (chapterId is None):
        print(f"bookID > {bookId}")
        api = f"books/{bookId}/chapters/"
    elif (bookId is not None) and (chapterId is not None):
        print(f"bookID > {bookId}")
        print(f"chapterId > {chapterId}")
        api = f"books/{bookId}/chapters/{chapterId}"
    elif (bookId is not None):
        print(f"chapterId > {chapterId}")
        api = f"books/{bookId}"
    
    url = f"{baseUrl}/{version}/{api}"
    print(f"invoke api url > {url}")
    try:
        response = requests.get(url=url)
    except Exception as exception:
        print(f"error performing api request with error {exception}")
    
    try:
        if response.status_code == 200:
            jsonResponse = response.json()
            currentDir = os.getcwd()
            currentFilePath = os.path.join(currentDir, outputJson)
            print(currentFilePath)
            with open(currentFilePath, 'w') as fileJson:
                json.dump(jsonResponse,fileJson)
            chapterInfo = jsonResponse["data"]["attributes"]
            chapterTitle = chapterInfo["title"]
            chapterNumber = chapterInfo["order"]
            chapterSummary = chapterInfo["summary"]
            print(f"chapter title > {chapterTitle}")
            print(f"chapter num > {chapterNumber}")
            print(f"chapter sum > {chapterSummary}")
        else:
            print(f"error performing api request {response.request.body}")
    except Exception as exception:
        print(f"error saving api response with error {exception}")

bookId = "d6e641e7-f1e1-4d79-b137-86e32c7120b4"
chapId = "dc4ba4e1-9bad-453b-b6ab-07955d932bb6"
get_hp_book(bookId=bookId, chapterId=chapId)



