Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E02F9B
	for <tools@linux.kernel.org>; Wed, 21 Apr 2021 23:40:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1619048038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FmJB06O95Ri5AdwIf+J6t8FBA9yTyiMb0iCwzEK3rzA=;
	b=c86EI3ltFNcMwkTZ5Wv9xg8007ZynZsJsvk5iqApL2+WcZKwwfB6+if3pCJ6YHO8QQ008v
	j4lhGrPdAKFPpsehRgUTeOuMADykHlEwvNymuhMSmuOqFD061TFUa5SCy/Z277eSaEMND9
	dF/7D5Z4wXtFeGUz3E6/U96okr3UsJXvJJhOwc1Z3jkAiKZQuHY5g4O/d7Q3felJ8p696Q
	4VUlnlbuDajjCQbFRkDMv+1YOFQb82VMQHFMsrOcRg0Pa8lOwW46ZV98SrNhNevfo3X4WA
	8sDlyY1q2u4Ek3BI6rzpu7hoShQqGtbiCV56EAK9oCAqqV73uF12eVreKiNG4A==
From: Kyle Meyer <kyle@kyleam.com>
To: Morten Linderud <foxboron@archlinux.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: Ensure we read threadfile for message-id
In-Reply-To: <20210421202942.1358011-1-foxboron@archlinux.org>
References: <20210421202942.1358011-1-foxboron@archlinux.org>
Date: Wed, 21 Apr 2021 19:33:55 -0400
Message-ID: <87im4fi55o.fsf@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

Morten Linderud writes:

> This fixes a bug where reading from `get_msgid_from_stdin` couldn't grab
> the message-id when we collect a thread from stdin.
>
> This is mainly because there is no good way to override `sys.stdin`
> (from what I can see) and it probably makes more sense to try fetch
> message-ids from files instead. This allows us to replace the default
> file "sys.stdin" with the thread file whenever we need.
>
> No patch:
>
>     $ curl -s "https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/raw" | b4 mbox
>     Looking up https://lore.kernel.org/r/20210421130105.1226686-1-gregkh%40linuxfoundation.org

So the message ID is successfully read from stdin here...

>     Grabbing thread from lore.kernel.org/lkml
>     272 messages in the thread
>     Unable to find a valid message-id in stdin.

... but then a subsequent call tries to read it from stdin again.

> With patch:
>
>     $ curl -s "https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/raw" | .4 mbox

typo: ".4"

>     Looking up https://lore.kernel.org/r/20210421130105.1226686-1-gregkh%40linuxfoundation.org
>     Grabbing thread from lore.kernel.org/lkml
>     272 messages in the thread
>     Saved ./20210421130105.1226686-1-gregkh@linuxfoundation.org.mbx
>
> Signed-off-by: Morten Linderud <foxboron@archlinux.org>

A similar error can still be triggered in the 'am --cherry-pick' code
path:

  curl -s "https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/raw" | b4 am -P _
  Looking up https://lore.kernel.org/r/20210421130105.1226686-1-gregkh%40linuxfoundation.org
  Grabbing thread from lore.kernel.org/lkml
  Analyzing 276 messages in the thread
  ---
  Unable to find a valid message-id in stdin.

I haven't tried, but it looks like you could update the get_msgid() call
in mbox_to_am() to use mboxfile.

Another approach would be to avoid collecting the msgid more than once
(something like below).


diff --git a/b4/mbox.py b/b4/mbox.py
index d3bde25..3783a56 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -27,7 +27,7 @@
 logger = b4.logger
 
 
-def mbox_to_am(mboxfile, cmdargs):
+def mbox_to_am(mboxfile, cmdargs, msgid):
     config = b4.get_main_config()
     outdir = cmdargs.outdir
     if outdir == '-':
@@ -81,7 +81,6 @@ def mbox_to_am(mboxfile, cmdargs):
     if cmdargs.cherrypick:
         cherrypick = list()
         if cmdargs.cherrypick == '_':
-            msgid = b4.get_msgid(cmdargs)
             # Only grab the exact msgid provided
             at = 0
             for lmsg in lser.patches[1:]:
@@ -500,16 +499,14 @@ def main(cmdargs):
 
     savefile = mkstemp('b4-mbox')[1]
 
+    msgid = b4.get_msgid(cmdargs)
     if not cmdargs.localmbox:
-        msgid = b4.get_msgid(cmdargs)
-
         threadfile = b4.get_pi_thread_by_msgid(msgid, savefile, useproject=cmdargs.useproject, nocache=cmdargs.nocache)
         if threadfile is None:
             os.unlink(savefile)
             return
     else:
         if os.path.exists(cmdargs.localmbox):
-            msgid = b4.get_msgid(cmdargs)
             if os.path.isdir(cmdargs.localmbox):
                 in_mbx = mailbox.Maildir(cmdargs.localmbox)
             else:
@@ -530,7 +527,7 @@ def main(cmdargs):
         get_extra_series(threadfile, direction=1)
 
     if cmdargs.subcmd == 'am':
-        mbox_to_am(threadfile, cmdargs)
+        mbox_to_am(threadfile, cmdargs, msgid)
         os.unlink(threadfile)
         return
 
@@ -566,7 +563,6 @@ def main(cmdargs):
     if cmdargs.wantname:
         savefile = os.path.join(cmdargs.outdir, cmdargs.wantname)
     else:
-        msgid = b4.get_msgid(cmdargs)
         savefile = os.path.join(cmdargs.outdir, '%s.mbx' % msgid)
 
     mbx.close()
