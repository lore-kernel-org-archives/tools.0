Received: from qproxy1-pub.mail.unifiedlayer.com (qproxy1-pub.mail.unifiedlayer.com [173.254.64.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB5B185A
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 03:42:35 +0000 (UTC)
Received: from gproxy2-pub.mail.unifiedlayer.com (unknown [69.89.18.3])
	by qproxy1.mail.unifiedlayer.com (Postfix) with ESMTP id BE83E804846F
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 03:22:23 +0000 (UTC)
Received: from cmgw11.mail.unifiedlayer.com (unknown [10.0.90.126])
	by progateway4.mail.pro1.eigbox.com (Postfix) with ESMTP id AE1AC1004439D
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 03:22:17 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53])
	by cmsmtp with ESMTP
	id RPQ1pJ8S6jkdRRPQ1pD1AX; Mon, 13 Feb 2023 03:22:17 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=LPqj/La9 c=1 sm=1 tr=0 ts=63e9ace9
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=m04uMKEZRckA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=zstS-IiYAAAA:8
 a=sg3SanerQoCEkX_6cxUA:9 a=4G6NA9xxw8l3yy4pmD5M:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com;
	s=default; h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=veEwk2Ykx7DSuEWaBPC8Fm6hCkTYZoYYc4Wv/aS9uQk=; b=lcV4IInUGq75TH26r4zJC5ejkO
	2c9w97PXJ7aLBl4/SryE5a3Q3mnTscjpHGdxlffiYWzTCBU4OwS8wLa4rio7zX7/yYqkYe3wHW4nP
	GiFEFQBlFdQFUXMem/wkhOK8Z;
Received: from 75-166-130-93.hlrn.qwest.net ([75.166.130.93]:54596 helo=prentzel)
	by box5379.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <tom@tromey.com>)
	id 1pRPQ1-001HdO-Dj;
	Sun, 12 Feb 2023 20:22:17 -0700
From: Tom Tromey <tom@tromey.com>
To: tools@linux.kernel.org
Subject: b4 should batch email
X-Attribution:  Tom
Date: Sun, 12 Feb 2023 20:22:13 -0700
Message-ID: <87sffadzbu.fsf@tromey.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5379.bluehost.com
X-AntiAbuse: Original Domain - linux.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tromey.com
X-BWhitelist: no
X-Source-IP: 75.166.130.93
X-Source-L: No
X-Exim-ID: 1pRPQ1-001HdO-Dj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 75-166-130-93.hlrn.qwest.net (prentzel) [75.166.130.93]:54596
X-Source-Auth: tom+tromey.com
X-Email-Count: 60
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes

My mail provider doesn't like when I send too many messages in one
session, so I got the appended error message.

"git send-email" doesn't have this problem, because I do:

[sendemail]
...
	smtpBatchSize = 10

Perhaps b4 could use this same mechanism.  FWIW it was also a bit weird
to me that I had to set b4.send-series-to, when I already have
sendemail.to configured.

I'm using:

prentzel. b4 --version
0.12.0

thanks,
Tom

Traceback (most recent call last):
  File "/home/tromey/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/command.py", line 360, in cmd
    cmdargs.func(cmdargs)
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/command.py", line 86, in cmd_send
    b4.ez.cmd_send(cmdargs)
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/ez.py", line 1532, in cmd_send
    sent = b4.send_mail(smtp, send_msgs, fromaddr=fromaddr, patatt_sign=sign,
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/__init__.py", line 3429, in send_mail
    smtp.sendmail(fromaddr, destaddrs, bdata)
  File "/usr/lib64/python3.10/smtplib.py", line 887, in sendmail
    raise SMTPSenderRefused(code, resp, from_addr)
smtplib.SMTPSenderRefused: (421, b'too many messages in this connection', 'tom@tromey.com')
