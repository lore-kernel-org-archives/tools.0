Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE85268;
	Thu,  9 Dec 2021 21:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914FEC004DD;
	Thu,  9 Dec 2021 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639084145;
	bh=Qonv6+HwhUibHTIs8VltwIMF5qAA8cIlVuK0mnlzIT4=;
	h=From:Date:Subject:To:Cc:From;
	b=HlvlNqsUKOKLtOMag6YTQ68K62ZD+1Q2n+mHk1auiwzqjje1Q31GJiooC9WKaXE0R
	 dNoMmcdtg9WV9vjKWYOa+vXMqTyYLX0iwLpjMiO1W1kbDER45j8DIHC6el4k67RIXp
	 K/XvPsparm8bKqCbyTyT1DDwRoEfNsIEoBQx3S1KjNR5v9fF+orJH/4Sb6EAcEDrJK
	 6gbmc4czOPcDDi5J/cnKpKLPHOYGc7S5LkpWXfb3/7kOjlxsM+xem9WVkSZD2zYAAQ
	 ICDk9AvnXLWSVXclD75rwkMJMvT+d/3knjQfk0yqYQNtVFbnu/Y2QrFPKEA8Ydh0Yy
	 pqeas8oGj1ahw==
Received: by mail-ed1-f50.google.com with SMTP id e3so24091458edu.4;
        Thu, 09 Dec 2021 13:09:05 -0800 (PST)
X-Gm-Message-State: AOAM532oc687+obweBlcshks8AurTNULt7xyYGbOlXiuQp5kxLWAFJrl
	jcVloGBK275zHf6qL40s1bBZ1sOIUG3qurpazA==
X-Google-Smtp-Source: ABdhPJxo5r7p5MQ74yqo/ESF/IgopJq3zlZGgwxs2Q6ckDzMJ7JBDJD714Ghn0UL6iegpGbq/QHrJWfAxuoPoOSgJoo=
X-Received: by 2002:a17:907:3f24:: with SMTP id hq36mr18483002ejc.390.1639084143952;
 Thu, 09 Dec 2021 13:09:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Dec 2021 15:08:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLgO5a282_w=gj1sjegTuwCchnUaR4TtwLX4JDLEkd29w@mail.gmail.com>
Message-ID: <CAL_JsqLgO5a282_w=gj1sjegTuwCchnUaR4TtwLX4JDLEkd29w@mail.gmail.com>
Subject: b4 splat
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org
Cc: users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

I'm seeing a splat from b4 on this thread. I briefly looked at it, but
don't see the problem. The email looks pretty 'normal' to me.

Rob

$ b4 -d mbox 20211209172206.17778-3-sumitg@nvidia.com
Running git --no-pager config -z --get-regexp b4\..*
Running git --no-pager config -z --get-regexp get-lore-mbox\..*
Running git --no-pager config -z --get-regexp gpg\..*
Looking up https://x-lore.kernel.org/r/20211209172206.17778-3-sumitg%40nvidia.com
t_mbx_url=https://x-lore.kernel.org/all/20211209172206.17778-3-sumitg%40nvidia.com/t.mbox.gz
Using cached copy:
/home/rob/.cache/b4/efa2c648ff0f4928169fcc154d99c92552a9ff56.pi.msgs
Looking at: 20211209172206.17778-1-sumitg@nvidia.com
Looking at: 20211209172206.17778-9-sumitg@nvidia.com
Going into maybe:
20211209172206.17778-1-sumitg@nvidia.com->20211209172206.17778-9-sumitg@nvidia.com
Looking at: 20211209172206.17778-4-sumitg@nvidia.com
Going into maybe:
20211209172206.17778-1-sumitg@nvidia.com->20211209172206.17778-4-sumitg@nvidia.com
Looking at: 20211209172206.17778-3-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-3-sumitg@nvidia.com
Looking at: 20211209172206.17778-2-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-2-sumitg@nvidia.com
Looking at: 20211209172206.17778-5-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-5-sumitg@nvidia.com
Looking at: 20211209172206.17778-8-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-8-sumitg@nvidia.com
Looking at: 20211209172206.17778-7-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-7-sumitg@nvidia.com
Looking at: 20211209172206.17778-6-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-6-sumitg@nvidia.com
Looking at: 20211209172206.17778-1-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-1-sumitg@nvidia.com
Looking at: 20211209172206.17778-9-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-9-sumitg@nvidia.com
Looking at: 20211209172206.17778-4-sumitg@nvidia.com
Kept in thread: 20211209172206.17778-4-sumitg@nvidia.com
9 messages in the thread
Traceback (most recent call last):
  File "/home/rob/.local/bin/b4", line 33, in <module>
    sys.exit(load_entry_point('b4', 'console_scripts', 'b4')())
  File "/home/rob/proj/git/b4/b4/command.py", line 272, in cmd
    cmdargs.func(cmdargs)
  File "/home/rob/proj/git/b4/b4/command.py", line 64, in cmd_mbox
    b4.mbox.main(cmdargs)
  File "/home/rob/proj/git/b4/b4/mbox.py", line 782, in main
    b4.save_git_am_mbox(msgs, fh)
  File "/home/rob/proj/git/b4/b4/__init__.py", line 2451, in save_git_am_mbox
    gen.flatten(msg, unixfrom=True)
  File "/usr/lib/python3.9/email/generator.py", line 116, in flatten
    self._write(msg)
  File "/usr/lib/python3.9/email/generator.py", line 181, in _write
    self._dispatch(msg)
  File "/usr/lib/python3.9/email/generator.py", line 218, in _dispatch
    meth(msg)
  File "/usr/lib/python3.9/email/generator.py", line 247, in _handle_text
    msg.set_payload(payload, charset)
  File "/usr/lib/python3.9/email/message.py", line 315, in set_payload
    payload = payload.encode(charset.output_charset)
LookupError: unknown encoding: y
