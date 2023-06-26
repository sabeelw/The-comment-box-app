from django.shortcuts import render, HttpResponse, redirect
import pymongo
import os
import base64
from bson.binary import Binary
from bson import ObjectId
# Create your views here.
def HomeView(request):
    myclient = pymongo.MongoClient(f"mongodb://{os.getenv('MONGO_USER')}:{os.getenv('MONGO_PASS')}@{os.getenv('MONGO_URL')}:27017/")
    mydb = myclient["commentDB"]
    msgtbl = mydb["messages"]
    msgs = list(msgtbl.find())
    msgs.reverse()
    for i in msgs:
        i["id"] = str(i["_id"])
    return render(request,'html/index.html', {"message": msgs})


def DefaultView(request):
    return HttpResponse("<h1>It works!</h1>")

def SaveMessageView(request):
    myclient = pymongo.MongoClient(f"mongodb://{os.getenv('MONGO_USER')}:{os.getenv('MONGO_PASS')}@{os.getenv('MONGO_URL')}:27017/")
    mydb = myclient["commentDB"]
    msgtbl = mydb["messages"]
    if request.method == 'POST':
        print(request.POST)
        if bool(request.FILES.get('thumbnail', False)) == True::
            encoded = base64.b64encode(request.FILES['thumbnail'].read()).decode()
        else:
            encoded = base64.b64encode(b'0').decode()
        msg = {"message": request.POST["msg"],
       "name": request.POST["name"],
       "img": encoded,
       }
        msgtbl.insert_one(msg)
    return redirect("home")

def DeleteMsgView(request):
    if request.method == 'POST':
        myclient = pymongo.MongoClient(f"mongodb://{os.getenv('MONGO_USER')}:{os.getenv('MONGO_PASS')}@{os.getenv('MONGO_URL')}:27017/")
        mydb = myclient["commentDB"]
        msgtbl = mydb["messages"]
        deleted = msgtbl.delete_one({"_id": ObjectId(request.POST["id"])})
    return redirect("home")
