import requests
data = {
	"name" : "Tanishq",
	"role" : "Devops Learner",
	"day" : 12
}

response = requests.post("https://postman-echo.com/post", json=data)
print("Status Code : ", response.status_code)
result = response.json()
print("Server Recieved : ", result["json"])

response2 = requests.put("https://postman-echo.com/post", json={"status": "updated"})
print("\nPut Status : ", response2.status_code)
if response2.status_code == 200:
	print("Put Recieved : ", response2.json()["json"])
else:
	print("Put Failed, response was not json")
response3 = requests.delete("https://postman-echo.com/delete")
if response3.status_code == 200:
	print("\nDelete Status : ", response3.status_code)
else:
	print("Delete Failed")
