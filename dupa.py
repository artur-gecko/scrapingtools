import requests
from bs4 import BeautifulSoup

# Define the target URL
url = "https://clutch.co/developers?geona_id=40823&page=30"

# Set headers to mimic a real browser
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
}

# Send a request to the page
response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.text, "html.parser")

# Find all company links
companies = soup.find_all("li", class_="provider-row")

# Extract the website URLs
for company in companies:
    website_tag = company.find("a", class_="website-link__item")
    if website_tag:
        print(website_tag["href"])  # Prints the website URL

