Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594E238D32
	for <tools@linux.kernel.org>; Mon, 14 Jul 2025 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752527859; cv=none; b=VRr2Eko3BXA+gnLhtVWYl47xvIpmZLV9tNzdH+PNCGPL6pxd2nWv7NhMyxkNKLBAmLn2o1DaLAMb5E5+P3k7LF17zY4NBmHSu9n5scIX8Qroo8hMyVgbZEg2GQ0Qta2iquAxHtIqqm+p4u4LCbhU5sVhS2MfEnatde0SwEo15Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752527859; c=relaxed/simple;
	bh=OKGjNOhdLjVFjIW17gdK+PzyBdp8TLFmfcrlWQVJ0EY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=i81uBK+w/F2pB52nScEz3PjTNIdgn0tThwicWDRBXlwr0pQ2FdaXPXra0B/a2mX9SwTL6xJYl/hCmu1svYSO7oLtTd9hTjQBms3oHCcPQcFLZDA/wBfsB+b+1B9tOlrOLQVVJC/HBvItUqNsXcB9xGODbVH6d5edb2At0NSUTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5F/6MU2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5F/6MU2"
Received: by smtp.kernel.org (Postfix)
	id E2659C4CEF6; Mon, 14 Jul 2025 21:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1040C4CEED;
	Mon, 14 Jul 2025 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752527856;
	bh=OKGjNOhdLjVFjIW17gdK+PzyBdp8TLFmfcrlWQVJ0EY=;
	h=From:To:Subject:Date:From;
	b=X5F/6MU2j8jwUUhgrLsvcrkfeaaNBNe3aFS+3r0WM3S/QgFGfhNBAYHHiL240ZX6Y
	 ZcEPpuykFdBjX0WstLoYKNRD5xQ04jDpdnst55gGXL/MgjL7uBRTkvdeA8MEgrRkNb
	 E5CqX2NTtr7pJ0XALGS4QBvA61W8nPRR1fptc/lfnA0qyGvbwg3ZFV0z/sJ3ybtgUP
	 NEovDxtnsbUruwyF+2qa+iKOWBJ5jDXZfVP/ewSC94waOB6oA4f47tVx9qWBRpPjQ4
	 f2s7f7cUBjzqEuCDaQBT1QMwKJAS0DoNay2g+st+tuBHrhcLXY9kDT80rssQQkJMqD
	 cneUYK2CdQGaA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: tools@kernel.org
Subject: [PATCH] mbox: Fix splat in get_series()
Date: Mon, 14 Jul 2025 16:17:26 -0500
Message-ID: <20250714211726.3151132-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 0c7bd8a7ec09 ("mbox: fix backtrace when we can't find the
in-reply-to message"), attempting to apply a retrieve a specific patch
and check for newer revisions results in a splat:

$ b4 am -c -P_ 20250711035730.17507-2-iuncuim@gmail.com
Looking up https://lore.kernel.org/20250711035730.17507-2-iuncuim@gmail.com
Grabbing thread from lore.kernel.org/all/20250711035730.17507-2-iuncuim@gmail.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 4 messages in the thread
Analyzing 3 code-review messages
Traceback (most recent call last):
  File "/home/rob/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/home/rob/proj/b4/src/b4/command.py", line 435, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/home/rob/proj/b4/src/b4/command.py", line 105, in cmd_shazam
    b4.mbox.main(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/home/rob/proj/b4/src/b4/mbox.py", line 843, in main
    make_am(msgs, cmdargs, msgid)
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "/home/rob/proj/b4/src/b4/mbox.py", line 113, in make_am
    lser = lmbx.get_series(revision=wantver, sloppytrailers=cmdargs.sloppytrailers, reroll=reroll,
                           codereview_trailers=load_codereview)
  File "/home/rob/proj/b4/src/b4/__init__.py", line 362, in get_series
    if pmsg is None:
       ^^^^
UnboundLocalError: cannot access local variable 'pmsg' where it is not associated with a value

Fixes: 0c7bd8a7ec09 ("mbox: fix backtrace when we can't find the in-reply-to message")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 139f94181234..daf17a9631ef 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -348,9 +348,9 @@ class LoreMailbox:
             # we either run out of in-reply-tos, or we find a patch in
             # one of our series
             logger.debug('fmsg.in_reply_to=%s', fmsg.in_reply_to)
+            pmsg = None
             if fmsg.in_reply_to is None:
                 # Check if there's something matching in References
-                pmsg = None
                 for refid in fmsg.references:
                     if refid in self.msgid_map and refid != fmsg.msgid:
                         pmsg = self.msgid_map[refid]
-- 
2.47.2

