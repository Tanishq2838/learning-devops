import requests

def safe_request(url, timeout = 5):
	try:
		response = requests.get(url, timeout=timeout)
		response.raise_for_status()
		return response
	except requests.exceptions.Timeout:
		print(f"Error : Request to {url} timed out after {timeout}s")
		return None
	except requests.exceptions.ConnectionError:
		print(f"Error : Could not connect to {url}")
		return None
	except requests.exceptions.HTTPError as e:
		print(f"Error : HTTP error for {url} - {e}")
		return None
	except requests.exceptions.RequestException as e:
		print(f"Error : Unexpected error for {url} - {e}")
		return None

result = safe_request("https://postman-echo.com/get")
if result:
	print("Success:", result.status_code)

result = safe_request("https://postman-echo.com/status/404")
if result:
	print("Success:", result.status_code)
else:
	print("Handled the failure gracefully")

result = safe_request("https://this-domain-does-not-exist-12345xyz.com")
if result:
	print("Success:", result.status_code)
else:
	print("Handled the failure gracefully")

result = safe_request("https://postman-echo.com/delay/10", timeout=2)
if result:
	print("Success:", result.status_code)
else:
	print("Handled failure gracefully")

