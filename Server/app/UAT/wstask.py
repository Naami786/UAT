from flask import session, Blueprint
from flask_socketio import emit,send
from app.tables.UAT import Task
from app.tables.User import users
from app import db
from .. import socketio

wstask = Blueprint('wstask', __name__)

@socketio.on('connect',namespace='/wstask')
def get_connect():
  print('connect client sucess')

@socketio.on('disconnect',namespace='/wstask')
def get_disconnect():
  print('disconnect client sucess')

@socketio.on('taskInfo',namespace='/wstask')
def taskInfo(message):
  taskId = message['taskId']
  row_data = Task.query.filter_by(id=taskId).first()
  taskInfo = {
    'taskId': message['taskId'],
    'status': row_data.status,
    'taskLog': row_data.task_log,
  }
  return taskInfo

@socketio.on('taskList',namespace='/wstask')
def get_connect(message):
  taskType = message['taskType']
  pageNum = message['pageNum']
  dataCount = Task.query.filter(db.and_(Task.task_type == taskType, )).count()
  top_task = Task.query.filter(db.and_(Task.task_type == taskType, Task.name.like("%置顶%"))).order_by(
    db.desc(Task.add_time)).all()
  if pageNum:
    listData = Task.query.filter(db.and_(Task.task_type == taskType, Task.name.notlike("%置顶%"))).order_by(
      db.desc(Task.add_time)).slice((pageNum - 1) * 20, pageNum * 20).all()
  else:
    listData = Task.query.filter(db.and_(Task.task_type == taskType, Task.name.notlike("%置顶%"))).order_by(
      db.desc(Task.add_time)).all()
  content = {
    'taskContent': [],
    'total': dataCount,
  }
  listData = top_task + listData
  for task in listData:
    row_data = users.query.filter(db.and_(users.id == task.user_id)).first()
    username = ""
    if row_data:
      username = row_data.username
    update_time = ""
    if task.update_time:
      update_time = task.update_time.strftime('%Y-%m-%d %H:%M:%S')
    content['taskContent'].append({
      "id": task.id,
      "name": task.name,
      "runTime": task.run_time,
      "add_time": task.add_time.strftime('%Y-%m-%d %H:%M:%S'),
      "add_user": username,
      "update_time": update_time,
      "status": task.status,
    })
  return content