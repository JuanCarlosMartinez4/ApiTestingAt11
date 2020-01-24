import requests


def main():
    post_list_request()
    get_list_request()
    put_list_request()


def post_list_request():
    url = "https://api.trello.com/1/lists"

    querystring = {"name": "listAddedFromRequest", "idBoard": "5e2a2c10b2d1028563408b57",
                   "key": "4178a940f6bdaed61804b6ff90d6d20e",
                   "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

    response = requests.request("POST", url, params=querystring)

    print(response.json())


def get_list_request():
    url = "https://api.trello.com/1/lists/5e2adb9614f5c44985899666"

    querystring = {"fields": "name,closed,idBoard,pos", "key": "4178a940f6bdaed61804b6ff90d6d20e",
                   "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

    response = requests.request("GET", url, params=querystring)

    print(response.json())
    
    
def put_list_request():
    url = "https://api.trello.com/1/lists/5e2adb9614f5c44985899666"

    querystring = {"name": "listName Updated", "key": "4178a940f6bdaed61804b6ff90d6d20e",
                   "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

    response = requests.request("PUT", url, params=querystring)

    print(response.json())


if __name__ == '__main__':
    main()
