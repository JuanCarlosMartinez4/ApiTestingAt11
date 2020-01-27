from coderequests.SendRequest import SendRequest


class CRUDBoardRequest(object):

    def __init__(self):
        self.response = ""
        self.send_request = SendRequest()

    def post_board(self, input_url, input_name, input_key, input_token):
        querystring = {"name": input_name, "defaultLabels": "true", "defaultLists": "true",
                       "keepFromSource": "none",
                       "prefs_permissionLevel": "private", "prefs_voting": "disabled", "prefs_comments": "members",
                       "prefs_invitations": "members", "prefs_selfJoin": "true", "prefs_cardCovers": "true",
                       "prefs_background": "blue", "prefs_cardAging": "regular",
                       "key": input_key,
                       "token": input_token}

        method_type = "POST"
        self.response = self.send_request.method_request(method_type, input_url, querystring)
        return self.response

    def get_board(self, input_url, input_id, input_key, input_token):
        url = input_url + input_id

        querystring = {"actions": "all", "boardStars": "none", "cards": "none", "card_pluginData": "false",
                       "checklists": "none",
                       "customFields": "false",
                       "fields": "name,desc,descData,closed,idOrganization,pinned,url,shortUrl,prefs,labelNames",
                       "lists": "open", "members": "none", "memberships": "none", "membersInvited": "none",
                       "membersInvited_fields": "all",
                       "pluginData": "false", "organization": "false", "organization_pluginData": "false",
                       "myPrefs": "false",
                       "tags": "false", "key": input_key,
                       "token": input_token}

        method_type = "GET"
        self.response = self.send_request.method_request(method_type, url, querystring)
        return self.response

    def put_board(self, input_url, input_id, input_name, input_desc, input_key, input_token):
        url = input_url + input_id

        querystring = {"name": input_name, "desc": input_desc, "key": input_key,
                       "token": input_token}

        method_type = "PUT"
        self.response = self.send_request.method_request(method_type, url, querystring)
        return self.response

    def delete_board(self, input_url, input_id, input_key, input_token):
        url = input_url + input_id

        querystring = {"key": input_key,
                       "token": input_token}

        method_type = "DELETE"
        self.response = self.send_request.method_request(method_type, url, querystring)
        return self.response

    def return_message(self):
        return self.response
