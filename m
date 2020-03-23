Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [66.63.167.143])
 by mx.groups.io with SMTP id smtpd.web10.54400.1584974864315272608
 for <tools@linux.kernel.org>;
 Mon, 23 Mar 2020 07:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=B11de3mj;
 spf=pass (domain: hansenpartnership.com, ip: 66.63.167.143, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 755E68EE15F;
	Mon, 23 Mar 2020 07:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1584974863;
	bh=dkkZatVO9N5ti3I+KsXBspvaIlQJ25oQwnpXc6NLNbc=;
	h=Subject:From:To:Cc:Date:From;
	b=B11de3mjW6+l9uMD9nGkxo3UQZHkjyYQr4qjbMmfKrzWGzQNXkrr3L86gkniAa9cF
	 L5mgeyyolNphF+bGdx9JHzC7QRO6CqUnnESfvEulM2dqdRlEgWtPnQmja5qQXDLh0v
	 sEgc0hqI12jLKgIxliclsNjZFlu8M0t5yw/NFiAM=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1q_u28jWqIty; Mon, 23 Mar 2020 07:47:42 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7DDAE8EE0FC;
	Mon, 23 Mar 2020 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1584974861;
	bh=dkkZatVO9N5ti3I+KsXBspvaIlQJ25oQwnpXc6NLNbc=;
	h=Subject:From:To:Cc:Date:From;
	b=LC4rTwucglWHmDf9BmJ8HCTxz7mk1Gs4YnsbXH62zgx4H/etqez8EkHpJk6PrbRZr
	 i7Bbbeu0ZnLgguEq3Gh0WpTwy6CPZMW8ISlXuWOCELnclUjMqNMaAbxxbQZolxQxgA
	 mfjK7CI5XwhRYO8sBMl3M2crR5MVX+hk697AbGDg=
Message-ID: <1584974859.3780.10.camel@HansenPartnership.com>
Subject: Pip dependency problem with b4
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Date: Mon, 23 Mar 2020 07:47:39 -0700
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is on a vanilla ubuntu 19.10 system with a fresh install.  After
doing

apt-get install python-pip
pip-install b4

I get this

jejb@amdmilan1:~/git/linux-build$ b4 --help
Traceback (most recent call last):
  File "/home/jejb/.local/bin/b4", line 6, in <module>
    from b4.command import cmd
  File "/home/jejb/.local/lib/python2.7/site-packages/b4/__init__.py",
line 11, in <module>
    import email.policy
ImportError: No module named policy

Which looks like a missing dependency pip should have installed.

James

