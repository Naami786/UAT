#-*-coding:utf-8-*-
from scripts.data import libdoc
import requests, time,json

class syncRFLib2DB():
  def __init__(self,host):
    self.serverHost = host

  def transWord(self,word):
    url = 'http://fanyi.youdao.com/translate'
    data = {
      'doctype': 'json',
      'type': 'AUTO',
      'i': word,
    }
    res = requests.get(url,params=data)
    response = res.json()
    if response['errorCode'] == 0:
      return response['translateResult'][0][0]['tgt']
    return ''

  def loopKeyWords(self,keywords):
    for index,item in enumerate(keywords):
      zhWord = self.transWord(item['name'])
      print(index+1, item['name'], zhWord)
      time.sleep(0.5)

  def uploadLib(self,name,isDefault):
    url = self.serverHost + '/api/UAT/case/uploadLib'
    headers = {
      'content-type': 'application/json',
    }
    data = {
      'name': name,
      'libtype': isDefault,
    }
    res = requests.post(url, headers=headers,data=json.dumps(data))
    response = res.json()
    print(response)
    return response['content']['id']

  def uploadKeywords(self,libId, keywords):
    url = self.serverHost + '/api/UAT/case/uploadKeyword'
    for item in keywords:
      wordType = 0
      if "locator" in item['args']:
        wordType = 1
      newItem = {
        'keywordInfo':{
          'lib_id': libId,
          'word_type': wordType,
          'name_en': item['name'],
          'shortdoc': item['shortdoc'],
          'doc': item['doc'],
          'args': json.dumps(item['args']),
          'tags': json.dumps(item['tags']),
        }
      }
      headers = {
        'content-type': 'application/json',
      }
      res = requests.post(url, headers=headers, data=json.dumps(newItem))
      response = res.json()
      print(item['name'],response['msg'])

if __name__ == '__main__':
  # 生成库表关键词数据
  # python -m robot.libdoc SeleniumLibrary SeleniumLibrary.html
  # isDefault定义是否为RF的默认库，默认库不需要引入项目
  # 1.默认库 2.自定义库
  # serverHost 当前服务端地址
  serverHost = 'http://127.0.0.1:5000'
  isDefault = 1
  syncRFLib2DB = syncRFLib2DB(serverHost)
  libId = syncRFLib2DB.uploadLib(libdoc['name'],isDefault)
  syncRFLib2DB.uploadKeywords(libId,libdoc['keywords'])

