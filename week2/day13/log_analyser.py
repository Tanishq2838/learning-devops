import re
import json
from collections import Counter

LOG_PATTERN = re.compile(
     r'(\d+\.\d+\.\d+\.\d+) - - \[(.*?)\] "(\w+) (.*?) HTTP/1.1" (\d+) (\d+)'
)

def parse_log_file(filename):
	ip_counter = Counter()
	status_counter = Counter()
	malformed_count = 0
	total_lines = 0
	with open(filename, "r") as f:
		for line in f:
			total_lines+=1
			line = line.strip()
			if not line:
				continue
			match = LOG_PATTERN.match(line)
			if match:
				ip = match.group(1)
				status = match.group(5)
				ip_counter[ip]+=1
				status_counter[status]+=1
			else:
				malformed_count+=1

	return ip_counter, status_counter, malformed_count, total_lines

def print_report(ip_counter, status_counter, malformed_count, total_lines):
    print("=" * 50)
    print("LOG ANALYSIS REPORT")
    print("=" * 50)
    print(f"Total lines processed: {total_lines}")
    print(f"Malformed lines skipped: {malformed_count}")
    print(f"Valid lines parsed: {total_lines - malformed_count}")

    print("\nTop 5 IP addresses:")
    for ip, count in ip_counter.most_common(5):
        print(f"  {ip}: {count} requests")

    print("\nStatus code breakdown:")
    for status, count in sorted(status_counter.items()):
        print(f"  {status}: {count}")

def save_json_report(ip_counter, status_counter, malformed_count, total_lines, output_file="log_report.json"):
    report = {
        "total_lines": total_lines,
        "malformed_lines": malformed_count,
        "valid_lines": total_lines - malformed_count,
        "top_ips": dict(ip_counter.most_common(5)),
        "status_codes": dict(status_counter)
    }

    with open(output_file, "w") as f:
        json.dump(report, f, indent=4)

    print(f"\nJSON report saved to {output_file}")

if __name__ == "__main__":
	ip_counter, status_counter, malformed_count, total_lines = parse_log_file("server.log")
	print_report(ip_counter, status_counter, malformed_count, total_lines)
	save_json_report(ip_counter, status_counter, malformed_count, total_lines)
