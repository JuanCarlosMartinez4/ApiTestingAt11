import requests


def main():
    post_board_request()
    get_board_request()
    put_board_request()
    delete_board_request()


def post_board_request():
    url = "https://api.trello.com/1/boards/"

    querystring = {"name": "BoardFromRequest", "defaultLabels": "true", "defaultLists": "true",
                   "keepFromSource": "none",
                   "prefs_permissionLevel": "private", "prefs_voting": "disabled", "prefs_comments": "members",
                   "prefs_invitations": "members", "prefs_selfJoin": "true", "prefs_cardCovers": "true",
                   "prefs_background": "blue", "prefs_cardAging": "regular", "key": "4178a940f6bdaed61804b6ff90d6d20e",
                   "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

    response = requests.request("POST", url, params=querystring)
    print(response.json())


def get_board_request():
    url = "https://api.trello.com/1/boards/5e2a30443bc4f421e3912e9e"

    querystring = {"actions": "all", "boardStars": "none", "cards": "none", "card_pluginData": "false",
                   "checklists": "none",
                   "customFields": "false",
                   "fields": "name,desc,descData,closed,idOrganization,pinned,url,shortUrl,prefs,labelNames",
                   "lists": "open", "members": "none", "memberships": "none", "membersInvited": "none",
                   "membersInvited_fields": "all",
                   "pluginData": "false", "organization": "false", "organization_pluginData": "false",
                   "myPrefs": "false",
                   "tags": "false", "key": "4178a940f6bdaed61804b6ff90d6d20e",
                   "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

    response = requests.request("GET", url, params=querystring)
    print(response.json())


def put_board_request():
    url = "https://api.trello.com/1/boards/5e2a30443bc4f421e3912e9e"

    querystring = {"name": "updatedBoardRequest", "key": "4178a940f6bdaed61804b6ff90d6d20e",
                   "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

    response = requests.request("PUT", url, params=querystring)
    print(response.json())


def delete_board_request():
    url = "https://api.trello.com/1/boards/5e2a30443bc4f421e3912e9e"

    querystring = {"key": "4178a940f6bdaed61804b6ff90d6d20e",
                   "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

    response = requests.request("DELETE", url, params=querystring)
    print(response.json())


if __name__ == '__main__':
    main()
