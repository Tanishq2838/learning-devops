import requests

response = requests.get("https://api.github.com")

print("Status Code : ", response.status_code)
print("Success? : ", response.ok)
print("Content Type : ", response.headers["Content-Type"])

data = response.json()
print("Parsed Json : ",data)
