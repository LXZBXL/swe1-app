from django.test import TestCase


class SmokeTest(TestCase):
    def test_polls_index_loads(self):
        response = self.client.get("/polls/")
        self.assertEqual(response.status_code, 200)
