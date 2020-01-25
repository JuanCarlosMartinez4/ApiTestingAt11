import requests


class SendRequest(object):

    def __init__(self):
        self.response = ""

    def post_request(self, input_url, querystring):
        self.response = requests.request("POST", input_url, params=querystring)

    def get_request(self, input_url, querystring):
        self.response = requests.request("GET", input_url, params=querystring)

    def put_request(self, input_url, querystring):
        self.response = requests.request("PUT", input_url, params=querystring)

    def delete_request(self, input_url, querystring):
        self.response = requests.request("DELETE", input_url, params=querystring)

    def get_response(self):
        return self.response

    def return_message(self):
        return self.response
