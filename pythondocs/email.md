email包
====

[toc]

> email包是python用于处理邮件内容的包。邮件内容的格式有很多RFC协议规定，且RFC有很多，邮件又支持各种媒体类型，所以handle邮件内容在python中是非常必要的。
> 通过反序列化层python中的对象，来操作邮件内容和结构，然后再序列化为文本邮件内容。最后通过邮件客户端讲邮件内容发送出去。这就是email包主要的功效。

## email.message

### Message的payload接口
1. Message object 
2. 如果Message对象的payload是一个子message对象的一个列表，那么message payload就是一个multipart，且messageobj.is_multipart() 返回True,否则返回False
3. 和上一条关联，is_multipart返回False的话，那么messageobj的payload的是个string 对象
4. messageobj在调用其messageobj.attach(payload)方法时，messageobj必须是一个payload是None或者payload是一个列表的对象。无论这两种情况的哪一种，调用attach后，messageobj的payload一定会是一个list了。如果messageobj是一个string的payload，那么这个方法不能用，相对的使用set_payload方法。
5. get_payload([i, [decode]])

### Message的headers接口
1. 就是类字典操作

### Message的其它接口方法
1. get_all
2. add_header
3. replace_header(_name, _value)
4. get_content_type()  返回Message对象的content-type，内容类型。
5. get_content_maintype()
6. get_content_subtype()
7. get_default_type()
8. set_default_type(ctype)
9. get_params([failobj[,header[,unquote]]])
10. get_param(param[, failobj[,header[,unquote]]])
11. set_param(param, value[, header[,requote[,charset[,language]]]])
12. del_param(param[, header[, requote]])¶
13. set_type(type[, header][, requote])
14. get_filename([failobj])
15. get_boundary([failobj])
16. set_boundary(boundary)
17. get_content_charset([failobj])
18. get_charsets([failobj])
19. walk() 是一个所有目的的generator,可以迭代出所有部分和message说对象树中的子部分， 

### Message 其它属性
1. preamble
2. epilogue
3. defects  缺陷列表，在parsing时出的错误缺陷。

## email.parser
Message对象的创建途径有两种：
1. 直接创建一个空白的Message(),让后通过attach，set_payload添加邮件内容。
2. 通过解析一个text文本来实例化出一个Message对象

email.parser模块就提供了第二种方法，可以解析**大多数邮件结构**,包括MIME documents.
通过将string或者like-file obj传递给parser,parser会返回一个**Root Message**对象。如果其中包含了MIME格式的，那么可以通过Messageobj.is_multipart()返回的bool值判定是否是MIME，如果是那么subpart可以通过get_payload()和walk()去访问。
 ### email.feedparser.FeedParser
 可以持续feed数据，最后close时返回Message对象
 1. feed(data)
 2. close()  会return一个Message对象

 ### eamil.parser.Parser
 1. parse(fp[, headersonly])       <===> email.message_from_string(s[, _class[,strict]])
 2. parsestr(text[,headeronly])        <===> email.message_from_file(s[, _class[,strict]])


 ### email.parser.HeaderParser
 同 email.parser.Parser接口，只是指挥解析到header，其它payload不会解析。


## email.generator
用于结构化的对象变为符合标准的邮件文本，便于python内部户的smtplib和nntplib等使用。

### email.generator.Generator(outfp[,mangle_Jfrom_[,maxheaderlen]])

1. 初始化需要一个like-file object且又write权限。
2. flatten(msg[, unixfrom]) 
3. clone(fp)
4. write(s)

## email.mime
1. mime.MIMEText
2. 