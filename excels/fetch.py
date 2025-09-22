import os
import requests
from bs4 import BeautifulSoup

base_url = "https://top500.org/lists/top500/"
download_dir = "./"
os.makedirs(download_dir, exist_ok=True)

def download_file(url, filename):
    try:
        response = requests.get(url)
        response.raise_for_status()  # Check if the request was successful
        with open(filename, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded: {filename}")
    except requests.exceptions.RequestException as e:
        print(f"Failed to download {filename}: {e}")

def get_list_years_and_months():
    years_and_months = []
    for year in range(1993, 2026):  # TOP500 started in 1993
        for month in ["06", "11"]:  # Lists are published in June and November
            years_and_months.append((year, month))
    return years_and_months

for year, month in get_list_years_and_months():
    url = f"{base_url}{year}/{month}/"
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        excel_link = soup.find('a', href=True, text='TOP500 List (Excel)')
        if excel_link:
            excel_url = excel_link['href']
            if not excel_url.startswith("http"):
                excel_url = "https://top500.org" + excel_url
            filename = os.path.join(download_dir, f"TOP500_{year}_{month}.xlsx")
            download_file(excel_url, filename)
        else:
            print(f"Excel file not found for {year}-{month}")
    else:
        print(f"Failed to retrieve page for {year}-{month}")


