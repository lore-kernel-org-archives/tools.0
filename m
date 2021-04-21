Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D6A2F81
	for <tools@linux.kernel.org>; Wed, 21 Apr 2021 20:35:33 +0000 (UTC)
From: Morten Linderud <foxboron@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1619036991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hOy07RSzxQGF1R08ZbEHASAfq4DZd5fRjX5HhJQjijg=;
	b=d8Fb0FNVDGp7DxDoTPQyn2g+O2XGCT6j/t1cKBbr80dUJr0QGmViIi/mDtObAoILdCXJhB
	RZESjDyZg6KbQNGd+ifBPyMyTTlMPHWkK3T9wwZtY2v89IH+tCH48LG5fW/rWECj5B/I3j
	smLXWaF2DoVPYzMU9WJxYLKFBO4J3Ue7qpdhFenx2Wvm2QKArJTXy+exb/EAX3X6Gv5t0l
	vugVcLRwt8JahENBYmdN/WNgqvZzT/QCxRntXtteTLxx5d6NiqOzckC356PfnrxASW3pNN
	K/IQECQbmmA85dmnVkeaA4O4NeBfxodbBczAZ6d1auRHWmhF9wXo1TQp1+KBOoYTCprad1
	8qLuE62ojzja8rI1BPjP6/Uw5e6FSRJ7fbjeR6Ckmx1wq+6U559fAAuBTuFYeuQ15z+9oK
	d6aSQqAz0JCJKkqAFwq3D1QOOxsJ+jkt0fDaBRC6B+0nH4Yst5qsyQehqP1xASyvN8NJVf
	1y3icY9+YssRD2z466MY1BNOd/SXzs3lxacSWpSLIzTOCb1XgB35deAswtUoE8j8N3N01f
	aOHeZzxJJ00mbAJZTuLb1N2/Rz6o51JYuD1KRoFcLkjZEV6UNKp1j8gN28I78bB1NU+Lr2
	N40+qolaEa2C7jqqRxHlSiOijZTyk22ckqKf1FmSQXYgZZpoC4MM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1619036992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hOy07RSzxQGF1R08ZbEHASAfq4DZd5fRjX5HhJQjijg=;
	b=D7rD5pmeUlJF3HILXZl+MX+KpqXMtBAgykBO5WForn/C1za5MgQQOadeQ74jHN0tdxfgsB
	u1bpgbNebcUyGACQ==
To: tools@linux.kernel.org
Cc: Morten Linderud <foxboron@archlinux.org>
Subject: b4: Ensure we read threadfile for message-id
Date: Wed, 21 Apr 2021 22:29:42 +0200
Message-Id: <20210421202942.1358011-1-foxboron@archlinux.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=foxboron smtp.mailfrom=foxboron@archlinux.org

This fixes a bug where reading from `get_msgid_from_stdin` couldn't grab
the message-id when we collect a thread from stdin.

This is mainly because there is no good way to override `sys.stdin`
(from what I can see) and it probably makes more sense to try fetch
message-ids from files instead. This allows us to replace the default
file "sys.stdin" with the thread file whenever we need.

No patch:

    $ curl -s "https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/raw" | b4 mbox
    Looking up https://lore.kernel.org/r/20210421130105.1226686-1-gregkh%40linuxfoundation.org
    Grabbing thread from lore.kernel.org/lkml
    272 messages in the thread
    Unable to find a valid message-id in stdin.

With patch:

    $ curl -s "https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/raw" | .4 mbox
    Looking up https://lore.kernel.org/r/20210421130105.1226686-1-gregkh%40linuxfoundation.org
    Grabbing thread from lore.kernel.org/lkml
    272 messages in the thread
    Saved ./20210421130105.1226686-1-gregkh@linuxfoundation.org.mbx

Signed-off-by: Morten Linderud <foxboron@archlinux.org>
---
 b4/__init__.py | 8 ++++----
 b4/mbox.py     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 32b5c02..e81d395 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2179,18 +2179,18 @@ def get_requests_session():
     return REQSESSION
 
 
-def get_msgid_from_stdin():
+def get_msgid_from_file(file):
     if not sys.stdin.isatty():
-        message = email.message_from_string(sys.stdin.read())
+        message = email.message_from_string(file.read())
         return message.get('Message-ID', None)
     logger.error('Error: pipe a message or pass msgid as parameter')
     sys.exit(1)
 
 
-def get_msgid(cmdargs):
+def get_msgid(cmdargs, file=sys.stdin):
     if not cmdargs.msgid:
         logger.debug('Getting Message-ID from stdin')
-        msgid = get_msgid_from_stdin()
+        msgid = get_msgid_from_file(file)
         if msgid is None:
             logger.error('Unable to find a valid message-id in stdin.')
             sys.exit(1)
diff --git a/b4/mbox.py b/b4/mbox.py
index d3bde25..791f545 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -566,7 +566,7 @@ def main(cmdargs):
     if cmdargs.wantname:
         savefile = os.path.join(cmdargs.outdir, cmdargs.wantname)
     else:
-        msgid = b4.get_msgid(cmdargs)
+        msgid = b4.get_msgid(cmdargs, file=open(threadfile))
         savefile = os.path.join(cmdargs.outdir, '%s.mbx' % msgid)
 
     mbx.close()
-- 
2.31.1

