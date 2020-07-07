Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
 by mx.groups.io with SMTP id smtpd.web10.12128.1594109846885793352
 for <tools@linux.kernel.org>;
 Tue, 07 Jul 2020 01:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: ubuntu.com, ip: 91.189.89.112, mailfrom: christian.brauner@ubuntu.com)
Received: from ip5f5af08c.dynamic.kabel-deutschland.de ([95.90.240.140] helo=wittgenstein)
	by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <christian.brauner@ubuntu.com>)
	id 1jsin6-0000tN-OE; Tue, 07 Jul 2020 08:17:24 +0000
Date: Tue, 7 Jul 2020 10:17:24 +0200
From: "Christian Brauner" <christian@brauner.io>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: Failure to grab a thread with b4
Message-ID: <20200707081724.rde6zb2iu43n3k52@wittgenstein>
References: <CABgObfZ4SXoXimBGVwL1uWNNvMJmJG5WoTQoBefysU6rS7EPaQ@mail.gmail.com>
 <20200703105754.GW4800@hirez.programming.kicks-ass.net>
 <20200703114559.05a0777d@oasis.local.home>
 <20200703165011.GF4781@hirez.programming.kicks-ass.net>
 <F9EA6942-7CF5-4D7D-A978-521FA0C8AA03@fb.com>
 <CAHk-=wjyyZxDUr8c_V+Pa9NEM4jvJa0Joy32ss7-Kb0W=rZyjA@mail.gmail.com>
 <CAMwyc-RVsOwbO93WLKB++KAwF5WasfiPkqSjkn3oPNZUMnWOcA@mail.gmail.com>
 <20200704204849.q7lfqbahtdxway44@wittgenstein>
 <20200704205140.3sztf4avevm635rt@wittgenstein>
 <20200706192733.zxulcyyzugugooze@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200706192733.zxulcyyzugugooze@chatter.i7.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 06, 2020 at 03:27:33PM -0400, Konstantin Ryabitsev wrote:
> On Sat, Jul 04, 2020 at 10:51:40PM +0200, Christian Brauner wrote:
> > On Sat, Jul 04, 2020 at 10:48:50PM +0200, Christian Brauner wrote:
> > > Hey Konstantin,
> 
> Please remember to cc tools@linux.kernel.org as well.
> 
> > > 
> > > I'm running:
> > > 
> > > brauner@wittgenstein|~
> > > > b4 --version
> > > 0.5.1
> > > 
> > > and it fails to grab two patches from a series I sent:
> > > 
> > > Looking up https://lore.kernel.org/r/20200622234326.906346-1-christian.brauner%40ubuntu.com
> > > Grabbing thread from lore.kernel.org/lkml
> > > Checking for newer revisions on https://lore.kernel.org/lkml/
> > > Analyzing 20 messages in the thread
> > > ---
> > > Thread incomplete, attempting to backfill
> > > ---
> > > Writing ./20200623_christian_brauner_arch_remove_do_fork_and_have_copy_thread_tls.mbx
> > >   [PATCH 01/17] fork: fold legacy_clone_args_valid() into _do_fork()
> > >   [PATCH 02/17] sparc64: enable HAVE_COPY_THREAD_TLS
> > >   [PATCH 03/17] sparc: share process creation helpers between sparc and sparc64
> > >   [PATCH 04/17] sparc: unconditionally enable HAVE_COPY_THREAD_TLS
> > >   [PATCH 05/17] ia64: enable HAVE_COPY_THREAD_TLS, switch to kernel_clone_args
> > >   [PATCH 06/17] nios2: enable HAVE_COPY_THREAD_TLS, switch to kernel_clone_args
> > >   [PATCH 07/17] h8300: select HAVE_COPY_THREAD_TLS, switch to kernel_clone_args
> > >   [PATCH 08/17] fork: remove do_fork()
> > >   [PATCH 09/17] alpha: switch to copy_thread_tls()
> > >   [PATCH 10/17] c6x: switch to copy_thread_tls()
> > >   [PATCH 11/17] hexagon: switch to copy_thread_tls()
> > >     + Acked-by: Brian Cain <bcain@codeaurora.org>
> > >   [PATCH 12/17] microblaze: switch to copy_thread_tls()
> > >   [PATCH 13/17] nds32: switch to copy_thread_tls()
> > >   [PATCH 14/17] sh: switch to copy_thread_tls()
> > >   [PATCH 15/17] unicore: switch to copy_thread_tls()
> > >   ERROR: missing [16/17]!
> > >   ERROR: missing [17/17]!
> > > 
> > > Just in case you need to fix something.
> 
> Well, they are actually not on LKML as far as I can tell -- very likely 
> due to vger having hiccups on the day you sent them. E.g. the following 
> links return 404:
> 
> https://lore.kernel.org/lkml/20200622234326.906346-17-christian.brauner@ubuntu.com/
> https://lore.kernel.org/lkml/20200622234326.906346-18-christian.brauner@ubuntu.com/
> 
> They do exist on linuxppc-dev, but not the rest of the series.  
> Unfortunately, we are currently only able to backfill based on cc 
> information present on the cover letter, so we don't try to backfill 
> from linuxppc-dev because the cover letter doesn't have that list cc'd.

Ah, ok. Since I've received Acks on the missing patches I assumed that
they must've made it somewhere.

> 
> I don't want to do clever workaround fixes for this, as eventually 
> public-inbox will gain ability to collate threads from all of the lists 
> it is tracking, so this category of problems should go away entirely 
> without needing to work in clever hacks.
> 
> > Looking up 
> > https://lore.kernel.org/r/20200622234326.906346-18-christian.brauner%40ubuntu.com
> > Grabbing thread from lore.kernel.org/linuxppc-dev
> > Traceback (most recent call last):
> >   File "/home/brauner/.local/bin//b4", line 8, in <module>
> >     sys.exit(cmd())
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 222, in cmd
> >     cmdargs.func(cmdargs)
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 40, in cmd_am
> >     b4.mbox.main(cmdargs)
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 491, in main
> >     get_extra_series(threadmbox, direction=1)
> >   File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 369, in get_extra_series
> >     lsub = b4.LoreSubject(base_msg['Subject'])
> > TypeError: 'NoneType' object is not subscriptable
> > Press any key to continue...
> 
> Got it -- the fix should be landing in master and stable-0.5.y soon.

I've had another crash today. It might be related but I'm posting in
case it is a separate bug:

Press any key to continue...
Looking up https://lore.kernel.org/r/20200706201720.3482959-1-keescook%40chromium.org
Grabbing thread from lore.kernel.org/linux-api
Checking for newer revisions on https://lore.kernel.org/linux-api/
Analyzing 10 messages in the thread
---
Writing ./v6_20200706_keescook_add_seccomp_notifier_ioctl_that_enables_adding_fds.mbx
  [✓] [PATCH v6 1/7] net/scm: Regularize compat handling of scm_detach_fds()
    + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
  [✗[0m] [PATCH v6 2/7] fs: Move __scm_install_fd() to __receive_fd()
    + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
  [✗[0m] [PATCH v6 3/7] fs: Add receive_fd() wrapper for __receive_fd()
    + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
  [✗[0m] [PATCH v6 4/7] pidfd: Replace open-coded partial receive_fd()
    + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
  [✗[0m] [PATCH v6 5/7] fs: Expand __receive_fd() to accept existing fd
    + Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
  [✗[0m] [PATCH v6 6/7] seccomp: Introduce addfd ioctl to seccomp user notifier
Traceback (most recent call last):
  File "/home/brauner/.local/bin//b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 222, in cmd
    cmdargs.func(cmdargs)
  File "/home/brauner/.local/lib/python3.8/site-packages/b4/command.py", line 40, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 494, in main
    mbox_to_am(threadmbox, cmdargs)
  File "/home/brauner/.local/lib/python3.8/site-packages/b4/mbox.py", line 110, in mbox_to_am
    am_mbx = lser.save_am_mbox(mbx, noaddtrailers=cmdargs.noaddtrailers,
  File "/home/brauner/.local/lib/python3.8/site-packages/b4/__init__.py", line 532, in save_am_mbox
    failed.remove('commit metadata')
ValueError: list.remove(x): x not in list
Press any key to continue...
Closing connection to imap.gmail.com...

Christian
