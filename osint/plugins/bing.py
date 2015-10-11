from bs4 import BeautifulSoup

import base
from osint.utils.requesters import Requester
from osint.utils.results import Result


class Bing(base.SourceBase):
    """Bing
    """

    def __init__(self):
        base.SourceBase.__init__(self)
        self.web_requester = Requester()
        self.url = 'https://www.bing.com/search?q={}'
        self.query = None

    def set_query(self, query):
        self.query = query

    def get_result(self):
        result = Result('Bing')
        response = self.web_requester.get(self.url.format(self.query))
        soup = BeautifulSoup(response.content, "html.parser")
        links = [x['href'] for x in soup.select('li.b_algo h2 a')]
        result.add_urls(links)
        return result
