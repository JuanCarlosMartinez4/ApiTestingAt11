import requests


class PostBoardRequest(object):

    def __init__(self):
        self.my_url = ""
        self.name = ""
        self.response = ""
        self.id = ""

    def add_url(self, url1):
        self.my_url = url1

    def add_name(self, board_name):
        self.name = board_name

    def post_board_request(self, input_url, input_name):
        querystring = {"name": input_name, "defaultLabels": "true", "defaultLists": "true",
                       "keepFromSource": "none",
                       "prefs_permissionLevel": "private", "prefs_voting": "disabled", "prefs_comments": "members",
                       "prefs_invitations": "members", "prefs_selfJoin": "true", "prefs_cardCovers": "true",
                       "prefs_background": "blue", "prefs_cardAging": "regular",
                       "key": "4178a940f6bdaed61804b6ff90d6d20e",
                       "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

        self.response = requests.request("POST", input_url, params=querystring)

    def get_response(self):
        return self.response

    def set_board_id(self, board_id):
        self.id = board_id

    def delete_board_request(self, input_url, input_id):
        url = input_url + input_id

        querystring = {"key": "4178a940f6bdaed61804b6ff90d6d20e",
                       "token": "e90ca503e4f0357e22543ff44250c74a98640c14d9e62e509b9171b5a4e8ecc6"}

        self.response = requests.request("DELETE", url, params=querystring)

    def get_board_request(self, input_url, input_id):
        url = input_url + input_id

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

        self.response = requests.request("GET", url, params=querystring)

    def return_message(self):
        return self.response
