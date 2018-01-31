import requests


api_key = ''
hash = '7657fcb7d772448a6d8504e4b20168b8'
target_url = 'http://www.hakanbayir.com'

def hash_search():
	url = 'https://www.virustotal.com/vtapi/v2/file/report'
	parameters = {'apikey': api_key, 'resource': hash}
	headers = {"Accept-Encoding": "gzip, deflate"}

	r = requests.post(url, headers=headers, params=parameters)

	result = r.json()

	scanner = result['scans']

	scanner_count = 1
	for i in scanner:
		print scanner_count , " : ", i, " - " , scanner[i] , '\n'
		scanner_count = scanner_count + 1


def url_search():
	url = 'http://www.virustotal.com/vtapi/v2/url/report'
	parameters = {'apikey' : api_key , 'resource' : target_url}
	headers = {"Accept-Encoding": "gzip, deflate"}

	r = requests.post(url, headers=headers, params=parameters)

	result = r.json()

	scanner = result['scans']

        scanner_count = 1
        for i in scanner:
                print scanner_count , " : ", i, " - " , scanner[i] , '\n'
                scanner_count = scanner_count + 1


if __name__ == '__main__':
	print "[1]. Hash Search" , "\n"
	print "[2]. URL Search" , "\n"

	print "Choose Search Options : "
	option = raw_input()

	if option == '1':
		hash_search()
	elif option == '2':
		url_search()






