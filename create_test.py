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
rows = c.fetchall()
count = 0;
for row in rows:
  print row["member_id"]
  count+=1

#while k < 10:
#	if recolist[k] != None:
#		c.execute("""UPDATE recommends SET question_id='%s' WHERE member_id='%s' AND recommend_no='%s'"""%(recolist[k],person,k+1))
#	else:
#		c.execute("""UPDATE recommends SET question_id=null WHERE member_id='%s' AND recommend_no='%s'"""%(person,k+1))
#	db.commit()
#	k = k+1
	
#for i in range (1, n_member+1):
#	dataRegister(i)

#db.close()
