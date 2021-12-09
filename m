Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AE668;
	Thu,  9 Dec 2021 22:07:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id D0A6EC9D20;
	Thu,  9 Dec 2021 21:47:55 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2716B20005;
	Thu,  9 Dec 2021 21:47:47 +0000 (UTC)
Date: Thu, 9 Dec 2021 22:47:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 splat
Message-ID: <YbJ5g4MG1VFX5dWW@piout.net>
References: <CAL_JsqLgO5a282_w=gj1sjegTuwCchnUaR4TtwLX4JDLEkd29w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLgO5a282_w=gj1sjegTuwCchnUaR4TtwLX4JDLEkd29w@mail.gmail.com>

On 09/12/2021 15:08:52-0600, Rob Herring wrote:
> Hi Konstantin,
> 
> I'm seeing a splat from b4 on this thread. I briefly looked at it, but
> don't see the problem. The email looks pretty 'normal' to me.
> 
> Rob
> 
> $ b4 -d mbox 20211209172206.17778-3-sumitg@nvidia.com
> Running git --no-pager config -z --get-regexp b4\..*
> Running git --no-pager config -z --get-regexp get-lore-mbox\..*
> Running git --no-pager config -z --get-regexp gpg\..*
> Looking up https://x-lore.kernel.org/r/20211209172206.17778-3-sumitg%40nvidia.com
> t_mbx_url=https://x-lore.kernel.org/all/20211209172206.17778-3-sumitg%40nvidia.com/t.mbox.gz
> Using cached copy:
> /home/rob/.cache/b4/efa2c648ff0f4928169fcc154d99c92552a9ff56.pi.msgs
> Looking at: 20211209172206.17778-1-sumitg@nvidia.com
> Looking at: 20211209172206.17778-9-sumitg@nvidia.com
> Going into maybe:
> 20211209172206.17778-1-sumitg@nvidia.com->20211209172206.17778-9-sumitg@nvidia.com
> Looking at: 20211209172206.17778-4-sumitg@nvidia.com
> Going into maybe:
> 20211209172206.17778-1-sumitg@nvidia.com->20211209172206.17778-4-sumitg@nvidia.com
> Looking at: 20211209172206.17778-3-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-3-sumitg@nvidia.com
> Looking at: 20211209172206.17778-2-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-2-sumitg@nvidia.com
> Looking at: 20211209172206.17778-5-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-5-sumitg@nvidia.com
> Looking at: 20211209172206.17778-8-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-8-sumitg@nvidia.com
> Looking at: 20211209172206.17778-7-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-7-sumitg@nvidia.com
> Looking at: 20211209172206.17778-6-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-6-sumitg@nvidia.com
> Looking at: 20211209172206.17778-1-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-1-sumitg@nvidia.com
> Looking at: 20211209172206.17778-9-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-9-sumitg@nvidia.com
> Looking at: 20211209172206.17778-4-sumitg@nvidia.com
> Kept in thread: 20211209172206.17778-4-sumitg@nvidia.com
> 9 messages in the thread
> Traceback (most recent call last):
>   File "/home/rob/.local/bin/b4", line 33, in <module>
>     sys.exit(load_entry_point('b4', 'console_scripts', 'b4')())
>   File "/home/rob/proj/git/b4/b4/command.py", line 272, in cmd
>     cmdargs.func(cmdargs)
>   File "/home/rob/proj/git/b4/b4/command.py", line 64, in cmd_mbox
>     b4.mbox.main(cmdargs)
>   File "/home/rob/proj/git/b4/b4/mbox.py", line 782, in main
>     b4.save_git_am_mbox(msgs, fh)
>   File "/home/rob/proj/git/b4/b4/__init__.py", line 2451, in save_git_am_mbox
>     gen.flatten(msg, unixfrom=True)
>   File "/usr/lib/python3.9/email/generator.py", line 116, in flatten
>     self._write(msg)
>   File "/usr/lib/python3.9/email/generator.py", line 181, in _write
>     self._dispatch(msg)
>   File "/usr/lib/python3.9/email/generator.py", line 218, in _dispatch
>     meth(msg)
>   File "/usr/lib/python3.9/email/generator.py", line 247, in _handle_text
>     msg.set_payload(payload, charset)
>   File "/usr/lib/python3.9/email/message.py", line 315, in set_payload
>     payload = payload.encode(charset.output_charset)
> LookupError: unknown encoding: y
> 

This is a common error: the declared charset is y which isn't a thing.
What happens is that the submitter gets to the following git prompt:

The following files are 8bit, but do not declare a Content-Transfer-Encoding.
something.patch
Which 8bit encoding should I declare [UTF-8]?

At that point, y was pressed instead of enter.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
