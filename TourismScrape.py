from selenium import webdriver
import time
import shutil
import glob


def download():
    options = webdriver.ChromeOptions()
    driver = webdriver.Chrome(options=options,
                              executable_path='D:\Programs\chromeDriver\chromedriver_win32\chromedriver.exe')
    driver.get('http://mytourismdata.tourism.gov.my/?page_id=14#!range=month')

    time.sleep(10)
    driver.find_element_by_xpath('//*[@id="gwt-Export"]/button/span').click()
    driver.find_element_by_xpath('/html/body/div[6]/div/div/button[1]').click()


def archive():
    listing = glob.glob('C:/Users/wqd180009/Downloads/Tourist*')
    for filename in listing:
        print("Moving download file {} to data archive".format(filename))
        shutil.move(filename, "./data")


download()
archive()