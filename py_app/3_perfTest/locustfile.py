import time
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    # seconds between requests
    wait_time = between(1, 5)

    @task
    def get_randoms(self):
        # for item_id in range(10):
        api = "/getRandom"
        # print(f"start {api}")
        while True:
            response = self.client.get(api)
            # print("Response status code:", response.status_code)
            # print("Response text:", response.text)
            time.sleep(0.5)
