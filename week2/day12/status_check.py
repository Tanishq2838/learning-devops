import requests

urls_to_test = [ "https://api.github.com", "https://api.github.com/this-does-not-exist", "https://httpbin.org/status/500"]

for url in urls_to_test:
	response = requests.get(url)
	num = response.status_code
	if num == 200:
		print(f"{url} -> ok ({num})")
	elif num == 404:
		print(f"{url} -> not found ({num})")
	elif num >= 500:
		print(f"{url} -> Server Error ({num})")
	else:
		print(f"{url} -> Status : ({num})")
