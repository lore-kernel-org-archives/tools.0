Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A804535837E
	for <tools@linux.kernel.org>; Fri, 22 May 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447481; cv=none; b=i2z9mQaMt+pAP7ntOLE2rBwQ6noBkvs+6KeRavV4ZF+GRtj3l7ZiOnCES/rtoCiXSM9CMnx8+JabgnjoOSWUCdJac1i2Jee8T9jkk7PeZUejt8Dqo+baMbzoWeE3WPsdhAT4wA/hCtEeSX7xdyAXFKTmC3o2L+CBYj70g+V75Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447481; c=relaxed/simple;
	bh=arE9CODRT3CZtGy4exhJPDDdVVCdFpoKh+Cz+l24tGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VeA4ZgXKKXrt8LI3ybyvVS7jRs2AXkdWbnQPvn4h+wfjKNuKN9rpP9xXPf5KqrDfAXPDogVIMXtxWG92vFCzcXOtPxnBEpRdVJJZQPNRJugtZizQNQKDe5OK10WOQFyJRimltQV8a/M59+Y1718S6vOWCnvcOXCWyCRgn0I8M0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmmXW6sv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmmXW6sv"
Received: by smtp.kernel.org (Postfix)
	id 653CB1F00A3D; Fri, 22 May 2026 10:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE351F000E9;
	Fri, 22 May 2026 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779447479;
	bh=s9i2Eec7pAev/btfO93KCQzcRVBjtGF7tXYzCWNVwG4=;
	h=From:Date:Subject:To:Cc;
	b=EmmXW6svfhal/aHEEMuhBTy4ak3f3nfIxiXZXPUKTZC/TPdaYm91oof9Si43kgMhb
	 1ZyN58bY/A+MgcwFOSwWLybAcMwRS5DyMytsBbPnaj2nutMqFK76tenmF4osTYlzRb
	 m+TgOBkEDv4LZym6ri3CLQe68hd7TUIk4NUDkLEtfegGVr9hV40TkqgN603k9ugDko
	 c1WOIUd+AujS5Bz3OZ99eYewQe0yDAA0qY/Ldm0kRiF4a5M8U2i8ksaRw/PjHuAICi
	 n8QCdB7xz8lJqsaIJLSIdOxZdE+vJNw2aspBPlTuJppXHAC5K4815zvID72jDTeTPG
	 SI2jkRa+6okoQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 22 May 2026 12:57:56 +0200
Subject: [PATCH b4] review: allow a custom Message-Id command for TUI
 replies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-review-msgid-cmd-v1-1-facc71f2e084@kernel.org>
X-B4-Tracking: v=1; b=H4sIALM2EGoC/yWMQQqDMBBFryKz7oCGKNirlC4myahTSFoy2hbEu
 zexy/d4/++gnIUVrs0Omd+i8kwFuksDfqE0M0ooDKY1Q9sbgzXiD0adJaCPAe04GhsG29uOoMx
 emSf5npc3cBbuf6ebe7Bf61etHCmjy5T8UlUkXTnDcfwATLjCu5EAAAA=
X-Change-ID: 20260522-review-msgid-cmd-49924d64541a
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-981da
X-Developer-Signature: v=1; a=openpgp-sha256; l=4075; i=brauner@kernel.org;
 h=from:subject:message-id; bh=arE9CODRT3CZtGy4exhJPDDdVVCdFpoKh+Cz+l24tGE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQJmG175b/u0eIcBYZUl2OKdzS+dlxnlJrmcTVpQfOCj
 KxZtzfO6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIgynDH86ve8O8D/idaN5l
 6JN8kGGmRqHMEvNv3/niKrol5ufY/WdkuC/fZGF14q6551UL/rbik7fWbLG/r61l9/auWLDNxL4
 uDgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The review TUI composes replies and sends them directly over SMTP via
send_mail(), bypassing git-send-email and therefore any sendemail-validate
hook that would normally rewrite the Message-Id. Review replies thus always
got a built-in <...@b4> id.

Add an opt-in b4.review-msgid-cmd option: when set, run it and use its
stdout as the Message-Id (angle brackets optional), falling back to the
built-in id when unset or on failure. Wire it into both the review-reply
builder and LoreMessage.make_reply() so follow-up replies are covered too.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
I love b4 review and I'm in the process of making it my default review
tool. 2026 and kernel review is officially better than Github. Didn't
expect to see that day tbh.

All my reviews come with specific message ids and I would like to be
able to continue using them so I would appreciate the ability to define
a message-id generation command in the [b4] .gitconfig section.

I've written the patch for this.

Thanks!
Christian
---
 src/b4/__init__.py       | 28 +++++++++++++++++++++++++++-
 src/b4/review/_review.py |  2 +-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 0530fec..ff056e2 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -177,6 +177,8 @@ DEFAULT_CONFIG: ConfigDictT = {
     'review-target-branch': None,
     # Do not patatt-sign outgoing review emails
     'review-no-patatt-sign': None,
+    # Command whose stdout is used as the Message-Id for review-TUI replies
+    'review-msgid-cmd': None,
 }
 
 # This is where we store actual config
@@ -2531,7 +2533,7 @@ class LoreMessage:
         references = LoreMessage.clean_header(self.msg.get('References', '') or '')
         msg['References'] = f'{references} <{self.msgid}>'.strip()
         msg['Date'] = email.utils.formatdate(localtime=True)
-        msg['Message-Id'] = make_msgid(idstring='b4-reply')
+        msg['Message-Id'] = make_msgid_with_cmd(idstring='b4-reply')
         return msg
 
     @staticmethod
@@ -5853,6 +5855,30 @@ def make_msgid(idstring: Optional[str] = None, domain: str = 'b4') -> str:
     return email.utils.make_msgid(idstring=idstring, domain=domain)
 
 
+def make_msgid_with_cmd(idstring: Optional[str] = None, domain: str = 'b4') -> str:
+    """Like make_msgid(), but use b4.review-msgid-cmd's output when set."""
+    config = get_main_config()
+    cmdstr = config.get('review-msgid-cmd')
+    if isinstance(cmdstr, (list, tuple)):
+        cmdstr = cmdstr[0] if cmdstr else None
+    if cmdstr:
+        sp = shlex.shlex(str(cmdstr), posix=True)
+        sp.whitespace_split = True
+        args = [os.path.expanduser(os.path.expandvars(a)) for a in sp]
+        try:
+            out = subprocess.check_output(args, text=True).strip()
+            if out:
+                if not out.startswith('<'):
+                    out = f'<{out}>'
+                return out
+            logger.warning('review-msgid-cmd %s produced no output', args)
+        except (OSError, subprocess.SubprocessError) as ex:
+            logger.warning(
+                'review-msgid-cmd failed (%s); using built-in message-id', ex
+            )
+    return make_msgid(idstring=idstring, domain=domain)
+
+
 def is_maildir(dest: str) -> bool:
     return (
         os.path.isdir(os.path.join(dest, 'new'))
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 47098c1..f874bb3 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2521,7 +2521,7 @@ def _build_review_email(
     else:
         msg['References'] = f'<{header_info["msgid"]}>'
     msg['Date'] = email.utils.formatdate(localtime=True)
-    msg['Message-Id'] = b4.make_msgid(idstring='b4-review')
+    msg['Message-Id'] = b4.make_msgid_with_cmd(idstring='b4-review')
 
     return msg
 

---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260522-review-msgid-cmd-49924d64541a

