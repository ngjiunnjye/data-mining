import requests
from datetime import date
from datetime import datetime
from datetime import timedelta
import json

class SingaporeHazeRecord:
    def __init__(self, timestamp, west, east, central, south, north):
        self.timestamp = timestamp
        self.west = west
        self.east = east
        self.central = central
        self.south = south
        self.north = north

    def __str__(self):
        return "{},{:d},{:d},{:d},{:d},{:d}".format(self.timestamp, self.west,self.east,self.central,self.south,self.north)


def getDate(date):
    return "{}".format(date.strftime("%Y-%m-%d"))

def getAqi(date):
    url = "https://api.data.gov.sg/v1/environment/pm25?date={}".format(date)
    page = requests.get(url)
    return page.text

def parseHazeJson(jsonStr):
    reading = json.loads(jsonStr)
    items = reading['items']
    records = []
    for item in items:
        records.append(SingaporeHazeRecord(
            item['timestamp'],
            item['readings']['pm25_one_hourly']['west'],
            item['readings']['pm25_one_hourly']['east'],
            item['readings']['pm25_one_hourly']['central'],
            item['readings']['pm25_one_hourly']['south'],
            item['readings']['pm25_one_hourly']['north']))
        #print(sgHazeRecord)
    return records

def write(fileName, records):
    f = open(fileName, "a")
    f.write("timestamp, west, east, central, south, north\n")
    for record in records:
        f.write(record.__str__() + "\n")
    f.close()

def main():
    strDate = input("Please input date[default 2016-02-10]:") or "2016-02-10"
    d = datetime.strptime(strDate, '%Y-%m-%d')
    today = datetime.now()
    print("Scrapping data from {} until {}".format(d, today))

    while d.__le__(today):
        dateStr = getDate(d)
        print("Processing {}".format(dateStr))
        records = parseHazeJson(getAqi(dateStr))
        write("data/SingaporeHaze_{}.csv".format(dateStr), records)
        d = d + timedelta(days=1)

    print("done")

main()
