Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A372;
	Sat, 17 Jul 2021 21:21:39 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1626556892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZGbQkre717e+y9GzfoMmxySjD/VGhthro/NSWf2QVw=;
	b=sMliJ5pZnC/yJYlOMaitqjk+3zZZMY0cQLwsIoSoFyY5s+iozcHnm9F8xg/MjbUTRRuVmY
	XaJChJXA2LPoFMPXuAkfhjw/ahZpMEqba1S5xF1+8JHovOcmA4tCA7ExAwqziVHn2d1RY7
	xYNJpV73rDoYfFXKlAcKpH82WmRl52AGKOtdl23XoctkaevapBVY0JCKXvRCaFeTroqsXk
	XeT0k6EbzS96P0PJ9WsprnrPfOxCNRTYDt22EXo5t+9+iVlbytZLNsLbkaAzKvuqUKt/ZL
	/WEqTNaC9eawnNpAEdK/2j3TyO8fd/oTiiK/o8KhXlniqN9wFrohHsKZjhiKLA==
From: Kyle Meyer <kyle@kyleam.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: utf-8 issues on b4 master
In-Reply-To: <20210717164836-mutt-send-email-mst@kernel.org>
References: <20210717164836-mutt-send-email-mst@kernel.org>
Date: Sat, 17 Jul 2021 17:21:30 -0400
Message-ID: <8735sc63hh.fsf@kyleam.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Michael S. Tsirkin writes:

> Passing message id
> bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com to b4
> gives this backtrace:
>
> Traceback (most recent call last):
>   File "/scm/b4/b4/command.py", line 263, in <module>
>     cmd()
>   File "/scm/b4/b4/command.py", line 246, in cmd
>     cmdargs.func(cmdargs)
>   File "/scm/b4/b4/command.py", line 41, in cmd_mbox
>     b4.mbox.main(cmdargs)
>   File "/scm/b4/b4/mbox.py", line 581, in main
>     msgid, msgs = get_msgs(cmdargs)
>   File "/scm/b4/b4/mbox.py", line 523, in get_msgs
>     msgid = b4.get_msgid(cmdargs)
>   File "/scm/b4/b4/__init__.py", line 2080, in get_msgid
>     msgid = get_msgid_from_stdin()
>   File "/scm/b4/b4/__init__.py", line 2072, in get_msgid_from_stdin
>     message = email.message_from_string(sys.stdin.read())
>   File "/usr/lib64/python3.9/codecs.py", line 322, in decode
>     (result, consumed) = self._buffer_decode(data, self.errors, final)
> UnicodeDecodeError: 'utf-8' codec can't decode byte 0xd4 in position 5886: invalid continuation byte
>
> mutt does not seem to have trouble decoding this ... weird.

I'm confused by that backtrace.  I think get_msgid_from_stdin() should
be called only when a message is fed on stdin.  You say you're passing a
message ID.  That's as a positional argument, right?

Fwiw I wasn't able to trigger the issue on my end.

  $ b4 am bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com
  Looking up https://lore.kernel.org/r/bbe52a89-c7ea-c155-6226-0397f223cd80%40linux.alibaba.com
  Analyzing 5 messages in the thread
  ---
    [PATCH] virtio-balloon: Use virtio_find_vqs() helper
      + Reviewed-by: David Hildenbrand <david@redhat.com>
  ---
  Total patches: 1
  ---
   Link: https://lore.kernel.org/r/1626190724-7942-1-git-send-email-xianting_tian@126.com
   Base: not specified
         git am ./20210713_xianting_tian_virtio_balloon_use_virtio_find_vqs_helper.mbx
  
  $ b4 mbox bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com
  Looking up https://lore.kernel.org/r/bbe52a89-c7ea-c155-6226-0397f223cd80%40linux.alibaba.com
  5 messages in the thread
  Saved ./bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com.mbx

That's with

  Python 3.7.3
  b4 v0.7.0-32-g45ef591
  patatt v0.4.6
