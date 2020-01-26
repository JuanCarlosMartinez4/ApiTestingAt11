import requests


class SendRequest(object):

    def __init__(self):
        self.response = ""

    def method_request(self, method_type, input_url, querystring):
        self.response = requests.request(method_type, input_url, params=querystring)
        return self.response
