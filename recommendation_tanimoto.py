# coding:utf-8

import MySQLdb
# MySQLデータベースに接続するにはMySQLdb.connectを用いる
# 引数に指定できるのは下のやつ(MySQL C APIに準拠)
# host, user, passwd, db, port, unix_socket, conv, connect_timeout, compress, named_pipe, init_command, read_default_file, read_default_group, cursorclass, use_unicode, charset, sql_mode, client_flag, ssl, local_infile
db = MySQLdb.connect(db="answers_development",host="localhost",user="root",passwd="lemon")
# カーソルクラスをディクショナリベースにしている。
db.cursorclass = MySQLdb.cursors.DictCursor
# カーソルの作成
c = db.cursor()

#全データ取得
c.execute("SELECT member_id, question_id, ans FROM answers")
item = {}
itemfake = {}
j = 1
itemfake[j] = c.fetchone()
while itemfake[j] != None:
	item[j] = itemfake[j]
	j = j+1
	itemfake[j] = c.fetchone()

#質問リスト(質問:作成者)
c.execute("SELECT id, member_id FROM questions")
q_ids = {}
j = c.fetchone()
while j != None:
	q_ids[j['id']] = j['member_id']
	j = c.fetchone()

#メンバーIDの最大値
c.execute("SELECT MAX(member_id) from answers")
n_member = c.fetchone().values()[0]

#質問番号の最大値
c.execute("SELECT MAX(id) from questions")
n_question = c.fetchone().values()[0]
#print "n_question "+ str(n_question)

#メンバー毎の答えた質問と答え
p_questions = {}
for member in range (1,n_member+1):
	p_questions[member] = {}
	j = 0
	for it in item:
		if item[it]['member_id'] == member:
			p_questions[member][item[it]['question_id']] = item[it]['ans']
			j = j+1

from math import sqrt
import random

## similarity score of person1 & person2

def sim_tanimoto(question,p1,p2): 
	n1 = len(question[p1])
	n2 = len(question[p2])
	# get the list of the items which both answer
	si={}
	for q1 in question[p1]:
		for q2 in question[p2]:
			if q1 == q2:
				si[q1]=1.0
	# count the number of the element
	n=len(si)*1.0
	
	#if nothing maches between the two, then return 0
	if n==0: return 0
	
	r = n/(n1 + n2 - n)
	
	return r

def topMatches(question,person,similarity=sim_tanimoto):
  scores=[(similarity(question,person,other),other)
          for other in question if other!=person]
  # sort (from high score)
  scores.sort()
  scores.reverse()
  return scores

def getRecommendations(question,person):
#	print "member" + str(person) + ":" + str(topMatches(question,person))
	k = 0
	osusume = {}
	isinlist = {}
	j = 1
	tm = topMatches(question, person)
	while k+1 < n_member and len(osusume)<10:
		#print "k" + str(k)
		bangou = range(1,n_question+1)
		random.shuffle(bangou)
		if tm[k][0] == 0:
			for q in bangou:
				if len(osusume) < 10:
					if q in q_ids:
						if q_ids[q] != person and q not in question[person] and q not in isinlist:
							osusume[j] = q
							isinlist[q] = 1.0
							j = j+1
		else:
			niteruhito = tm[k][1]
			si={}
			for q1 in question[person]:
				for q2 in question[niteruhito]:
					if q1 == q2:
						si[q1] = 1.0
			for q in bangou:
				if q in question[niteruhito]:
					if q_ids[q] != person and q not in si and q not in isinlist:
						osusume[j] = q
						#既に入っているものの重複防止
						isinlist[q] = 1.0
						j = j+1
		k = k+1
	return osusume

# データ登録
def dataRegister(person):
	osusume = getRecommendations(p_questions,person)
	#c.execute("""DELETE FROM recommend WHERE member_id = '%s'""",person)
	recolist = [None,None,None,None,None,None,None,None,None,None]
	i = 0
	for j in range(1,len(osusume)+1):
		if i < 10:
			recolist[i] = osusume[j]
			i = i+1
#	print "recolist=" + str(recolist)
	
	k = 0
	while k < 10:
		if recolist[k] != None:
			c.execute("""UPDATE recommends SET question_id='%s' WHERE member_id='%s' AND recommend_no='%s'"""%(recolist[k],person,k+1))
		else:
			c.execute("""UPDATE recommends SET question_id=null WHERE member_id='%s' AND recommend_no='%s'"""%(person,k+1))
		db.commit()
		k = k+1
	

for i in range (1, n_member+1):
	dataRegister(i)

c.close()
db.close()
