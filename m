Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by mx.groups.io with SMTP id smtpd.web11.3891.1585102284673665018
 for <tools@linux.kernel.org>;
 Tue, 24 Mar 2020 19:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zx2c4.com header.s=mail header.b=P9Yi12bI;
 spf=pass (domain: zx2c4.com, ip: 192.95.5.64, mailfrom: jason@zx2c4.com)
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3770cc02;
	Wed, 25 Mar 2020 02:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:references:in-reply-to:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=y3h+rAxZzoZ3BUzUqy+Br94n9O0=; b=P9Yi12
	bI9agKYu3RlTEw/fdJ80PC1DBzjbPpNyfqW/1W3afK6a6F0sb2kDjyZ1vpWTADK+
	pANdK8AOR4fFJGCfPW9gAeoY7rcTU5VUqZjgE2YVFsgr0sFBetvpBZZR7t4uzTkR
	HU9wnN0xYaEFSGWZhIMkCmqkGHhF0+f7MjXwkV7tUQXd0Fq22fAR6vsl30I6TU8m
	BM39SdUjM0QxZc8HcmnnySo5WY40YwbxuHwdnuzYUkqBsO++oueuhOXwtk/DD2Ib
	wq+TLLr+j7vp5J3zdlOlrYiDwVFV/umChu3/XFaigQx1jVLAoagx8BNq/uS52Bwv
	QVC0v6iAOjund69A==
Received: 
	by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 11b31fea (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
	Wed, 25 Mar 2020 02:04:10 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id p13so487744ilp.3;
        Tue, 24 Mar 2020 19:11:22 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3owMueMbpXYaNhG4cIwY2brUBB1mAI4iBbhgiDTGMEcTvszxFo
	2GDZSqbvKTfARqceW8c8R9HuDdXP3HXfVXTiT4w=
X-Google-Smtp-Source: ADFU+vs/fcWobuVHF/18P1bIWTW/caOmUz0DNGznaZ9xTt47oJuTnYKaSkBHuiq9VhExkHmGxvGTw4YK6HqxfJnSZ30=
X-Received: by 2002:a92:cc8c:: with SMTP id x12mr1417204ilo.224.1585102281588;
 Tue, 24 Mar 2020 19:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
In-Reply-To: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 24 Mar 2020 20:11:10 -0600
X-Gmail-Original-Message-ID: <CAHmME9os=HxxxqWHp9nM6ggDdkqwpa6gOpTTAG68gamR3NtWaA@mail.gmail.com>
Message-ID: <CAHmME9os=HxxxqWHp9nM6ggDdkqwpa6gOpTTAG68gamR3NtWaA@mail.gmail.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

Still not a fan at all of the attestation stuff, but the lore
integration is a great convenience. Thanks for this great tool. I've
packaged it up for Gentoo:

https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=8374a4402f40ad1ff3613e281db5bb897708fcea

Users can now run:

`$ emerge b4`

Please let me know if any of the metadata I've used in that commit is
off. As well, at the bottom of this email is a listing of all the
files this winds up installing, in case you spot something as being
wrong.

Will you continue to send release announcements here, or should I set
up a notifier through other means?

I'm curious to learn: where did this name "b4" come from? Is it like
the millennial meme phrase "inb4" being a deconstruction of "inbox"
for a postmodern command line work of art?

Regards,
Jason

----8<--------------------------

zx2c4@thinkpad ~ $ equery f b4
* Searching for b4 ...
* Contents of net-mail/b4-0.3.4:
/usr
/usr/bin
/usr/bin/b4 -> ../lib/python-exec/python-exec2
/usr/lib
/usr/lib/python-exec
/usr/lib/python-exec/python3.6
/usr/lib/python-exec/python3.6/b4
/usr/lib64
/usr/lib64/python3.6
/usr/lib64/python3.6/site-packages
/usr/lib64/python3.6/site-packages/b4
/usr/lib64/python3.6/site-packages/b4-0.3.4-py3.6.egg-info
/usr/lib64/python3.6/site-packages/b4-0.3.4-py3.6.egg-info/PKG-INFO
/usr/lib64/python3.6/site-packages/b4-0.3.4-py3.6.egg-info/SOURCES.txt
/usr/lib64/python3.6/site-packages/b4-0.3.4-py3.6.egg-info/dependency_links.txt
/usr/lib64/python3.6/site-packages/b4-0.3.4-py3.6.egg-info/entry_points.txt
/usr/lib64/python3.6/site-packages/b4-0.3.4-py3.6.egg-info/requires.txt
/usr/lib64/python3.6/site-packages/b4-0.3.4-py3.6.egg-info/top_level.txt
/usr/lib64/python3.6/site-packages/b4/__init__.py
/usr/lib64/python3.6/site-packages/b4/__pycache__
/usr/lib64/python3.6/site-packages/b4/__pycache__/__init__.cpython-36.opt-1.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/__init__.cpython-36.opt-2.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/__init__.cpython-36.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/attest.cpython-36.opt-1.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/attest.cpython-36.opt-2.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/attest.cpython-36.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/command.cpython-36.opt-1.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/command.cpython-36.opt-2.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/command.cpython-36.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/mbox.cpython-36.opt-1.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/mbox.cpython-36.opt-2.pyc
/usr/lib64/python3.6/site-packages/b4/__pycache__/mbox.cpython-36.pyc
/usr/lib64/python3.6/site-packages/b4/attest.py
/usr/lib64/python3.6/site-packages/b4/command.py
/usr/lib64/python3.6/site-packages/b4/mbox.py
/usr/share
/usr/share/doc
/usr/share/doc/b4-0.3.4
/usr/share/doc/b4-0.3.4/README.rst.bz2
