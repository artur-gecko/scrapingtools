from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Set up Selenium WebDriver
driver = webdriver.Chrome()

# Open the webpage
driver.get("https://clutch.co/profile/valtech-1")

# Wait for the page to load
time.sleep(10)  # Adjust based on network speed

# Extract company website URLs
print(driver.page_source)
#companies = driver.page_source#.find_elements(By.CLASS_NAME, "website-link__item")
#print(companies)
    #print(company.get_attribute("href"))
# Close the browser
driver.quit()

