import requests

headers = {
	"User-Agent": "DevOps-Learning-Bot/1.0",
	"Accept": "application/json",
	"X-Custom-Header": "tanishq-learning"
}

response = requests.get("https://postman-echo.com/headers", headers=headers)
print("Status : ", response.status_code)
print("Headers echoed back : ", response.json())

auth_headers = {
	"Authorization": "Bearer fake-token-12345"
}
response2 = requests.get("https://postman-echo.com/headers", headers=auth_headers)
print("Bearer Auth Status : ", response2.status_code)
print("Bearer Auth Recieved : ", response2.json()["headers"]["authorization"])

response3 = requests.get("https://postman-echo.com/basic-auth", auth=("postman", "password"))
print("Basic Auth Status : ", response3.status_code)
print("Basic Auth Response : ", response3.json())
