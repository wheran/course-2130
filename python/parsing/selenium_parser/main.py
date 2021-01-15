import os
import random
from contextlib import contextmanager
from time import sleep
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

URL = 'https://www.cian.ru/cat.php?deal_type=sale&engine_version=2&offer_type=flat&p={page}&region=1&room1=1&room2=1&room3=1&room4=1&room5=1&room6=1&room7=1&room9=1'
COLLECTION_PAGES_PATH = 'collection_pages'
DETAIL_PAGES_PATH = 'detail_pages'


@contextmanager
def chrome_driver(**kwargs):
    web_driver = webdriver.Chrome(**kwargs)
    try:
        yield web_driver
    finally:
        web_driver.close()


def load_collections():
    if not os.path.exists(COLLECTION_PAGES_PATH):
        os.mkdir(COLLECTION_PAGES_PATH)

    with chrome_driver(executable_path='..\\drivers\\chromedriver.exe') as driver:
        driver.get(URL.format(page=1))
        for page_id in range(1, 100):
            print(f'process page {page_id}', end='')
            try:
                WebDriverWait(driver, 10).until(
                    EC.visibility_of_any_elements_located((By.XPATH, "//article[@data-name='CardComponent']"))
                )
                pages_we = WebDriverWait(driver, 10).until(
                    EC.element_to_be_clickable((By.XPATH, "//a[@class='_93444fe79c--list-itemLink--3o7_6']")))
            except Exception as error:
                continue

            with open(os.path.join(COLLECTION_PAGES_PATH, f'adverts_{page_id}.html'), 'w', encoding='utf-8') as file:
                file.write(driver.page_source)
            driver.execute_script("arguments[0].scrollIntoView(true);", pages_we)
            pages = driver.find_elements_by_xpath("//ul[@class='_93444fe79c--list--HEGFW']/li")
            for number, element in enumerate(pages):
                try:
                    element.find_element_by_xpath(".//span")
                    number_to_click = number + 1
                    break
                except Exception as error:
                    pass
            else:
                number_to_click = -1
            sleep(random.uniform(0.5, 2))
            try:
                pages[number_to_click].click()
            except Exception as error:
                driver.refresh()
                pass
            sleep(random.uniform(2, 3))
            print(f'---> done')


def parse_adverts(document):
    links = []
    root = BeautifulSoup(document, features='lxml')
    adverts = root.find_all('article', {'data-name': 'CardComponent'})
    for advert in adverts:
        left_navigation_card = advert.find('div', {'class': '_93444fe79c--content--2IC7j'})
        if left_navigation_card:
            link = left_navigation_card.find('a', {'class': '_93444fe79c--link--39cNw'}, href=True)
            links.append(link.get('href', None))
    return list(filter(lambda x: x, links))


def load_details():
    if not os.path.exists(DETAIL_PAGES_PATH):
        os.mkdir(DETAIL_PAGES_PATH)

    collection_pages = os.listdir(COLLECTION_PAGES_PATH)
    with chrome_driver(executable_path='..\\drivers\\chromedriver.exe') as driver:
        for collection_page in collection_pages:
            print(f'working on collection {collection_page}')
            with open(os.path.join(COLLECTION_PAGES_PATH, collection_page), 'r', encoding='utf-8') as file:
                links = parse_adverts(file.read())
            for link in links:
                print(f'\tworking on link {link}', end='')
                driver.get(link)
                try:
                    description = WebDriverWait(driver, 10).until(
                        EC.element_to_be_clickable((By.XPATH, "//p[@class='a10a3f92e9--description-text--3Sal4']")))
                except Exception as error:
                    continue
                with open(os.path.join(DETAIL_PAGES_PATH, f'{collection_page.split(".")[0]}_detail_{link.split("/")[-2]}.html'), 'w', encoding='utf-8') as file:
                    file.write(driver.page_source)
                sleep(random.uniform(2, 3))
                print('---> done')
        sleep(random.uniform(2, 3))


if __name__ == '__main__':
    load_collections()
    load_details()
