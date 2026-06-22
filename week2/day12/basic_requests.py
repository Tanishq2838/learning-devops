import requests

response = requests.get("https://api.github.com")
print("Status Code : ", response.status_code)
print("Headers : ", response.headers)
print("Body : ", response.text)
