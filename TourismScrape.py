from selenium import webdriver
import time

options = webdriver.ChromeOptions()
#options.add_argument('--ignore-certificate-errors')
#options.add_argument("--test-type")
#options.binary_location = "D:\Programs\chromeDriver\chromedriver_win32"
driver = webdriver.Chrome(options=options,executable_path='D:\Programs\chromeDriver\chromedriver_win32\chromedriver.exe')
driver.get('http://mytourismdata.tourism.gov.my/?page_id=14#!range=month')

time.sleep(10)
driver.find_element_by_xpath('//*[@id="gwt-Export"]/button/span').click()
driver.find_element_by_xpath('/html/body/div[6]/div/div/button[1]').click()
