from selenium import webdriver
import time
import os
import shutil
import glob

def initDriver():
    options = webdriver.ChromeOptions()
    driver = webdriver.Chrome(options=options,
                              executable_path='D:\Programs\chromeDriver\chromedriver_win32\chromedriver.exe')
    return driver


def download20052013(driver):
    driver.get('http://www.data.gov.my/data/ms_MY/dataset/bacaan-indeks-pencemaran-udara-ipu-di-malaysia-pada-tahun-2005-hingga-2013')
    time.sleep(10)
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/a').click()
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/ul/li[2]/a').click()
    time.sleep(60)
    archive('14-bacaanipu2005-2013.csv')


def download20132014(driver):
    driver.get('http://www.data.gov.my/data/ms_MY/dataset/bacaan-indeks-pencemaran-udara-ipu-di-malaysia-pada-tahun-2013-hingga-2014')
    time.sleep(10)
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/a').click()
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/ul/li[2]/a').click()
    time.sleep(60)
    archive('15-bacaanipu2013-2014.csv')

def download20142015(driver):
    driver.get('http://www.data.gov.my/data/ms_MY/dataset/bacaan-indeks-pencemaran-udara-ipu-di-malaysia-pada-tahun-2014-hingga-2015')
    time.sleep(10)
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/a').click()
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/ul/li[2]/a').click()
    time.sleep(60)
    archive('16 - bacaanipu2014 - 2015.csv')

def download2016(driver):
    driver.get('http://www.data.gov.my/data/ms_MY/dataset/bacaan-indeks-pencemaran-udara-ipu-2016')
    time.sleep(10)
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/a').click()
    driver.find_element_by_xpath('//*[@id="dataset-resources"]/ul/li/div/ul/li[2]/a').click()
    time.sleep(60)
    archive('jasipu2016.xlsx')

def archive(filename):
    print("Moving download file {} to data archive".format(filename))
    filepath = "{}\\Downloads\\{}".format(os.path.expanduser('~'), filename)
    shutil.move(filepath, "./data")


driver = initDriver()
download20052013(driver)
download20132014(driver)
download20142015(driver)
download2016(driver)