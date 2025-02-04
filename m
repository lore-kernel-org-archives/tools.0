Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A42C181
	for <tools@linux.kernel.org>; Tue,  4 Feb 2025 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683098; cv=none; b=Qq3P992BpuigEXp6Mykp3fG+jhfkjC2rAv858WJFIm1lGkOhp2HDAUJhjIaPFoUgLKwVwiknkAEx0FrKFdipLBaT2SCkXFOoqZF8tPDIL0u0UJBPEI/NB+dosmprdWS1Q8vf9ofo1UMtyYRgmG8Fbb8Nq0tESaVMD0tWFo7iTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683098; c=relaxed/simple;
	bh=zoMjX4sQdbOouSr2Q3ZJBhktoh/PEHuEVrFzCQQS62o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Nf8OL2qEgm5QyWuoq8zX3VzyFMMXoQvXBXli07iQVdwlTNDo4jwElusKXH9f5zm0M0eSsc3qSKV0H2nH3rw85COG9QfWVjXiKn++45i2inXqAQ0fGsiKH0oHlfLd3/RuMMbJ9IKas8TAMEPJ3lmdpiS3xSJ8Q28OYO5nezoybPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyxBP9hc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyxBP9hc"
Received: by smtp.kernel.org (Postfix)
	id D8ABDC4CEE2; Tue,  4 Feb 2025 15:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F49C4CEDF;
	Tue,  4 Feb 2025 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738683097;
	bh=zoMjX4sQdbOouSr2Q3ZJBhktoh/PEHuEVrFzCQQS62o=;
	h=From:Date:Subject:To:Cc:From;
	b=nyxBP9hcehYK5kgk275U/heup2Pcz/5egHOk8qTLa/NxAsBHvdFLYVe6Kt4mVbMVs
	 PXmP9LAOI0pQSt+GBJ2DYOy/Tew2upO6SJ8cskYtsq9OvLHkj3jKPzWkYTAIL4ELKh
	 w6BVTiVre0mTvtRGIiQ+YxY+HH8NSs9JpAj164Sg8jmrnofO39AoNk4sqS/WX7vBLl
	 PBHUQF2UNUESr1/1xbKW9jADtBJOvfADSYrJybNCRxgnyi1mDkTDEX5YhXBEfpHGbL
	 OanlDLnvzhbPsL2z68bkLswPtw6WO9n//HasPc7G+Y4G8lo7pBc4BzdTP5HsiLlI+l
	 meqohXDMOSXpg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 04 Feb 2025 16:30:45 +0100
Subject: [PATCH b4 v2] ez: add subject prefix flag
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-prefix-v2-1-468f166eb9d5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKQyomcC/12MQQ7CIBBFr9LMWgyDVIwr72G6ADu2Ew1tBkM0D
 XeX4M7le//nbZBImBKcuw2EMideYgWz6+A2+ziR4rEyGG0sGqPVKnTntzq5EXuHjqy3UM8/3UJ
 XCBaG6mZOr0U+rZ2xLf+ZjAqVNkfvAulw6P3lQRLpuV9kgqGU8gWELgPEoQAAAA==
X-Change-ID: 20241220-prefix-87d15717e4a4
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6804; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=zoMjX4sQdbOouSr2Q3ZJBhktoh/PEHuEVrFzCQQS62o=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnojKwitMUuN4H9JMjBkmCtp8f4tDANMijR0PIm
 R6A3Oq5YDuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6IysAAKCRDhuBo+eShj
 d1lXEACMzC8SNM/3z65lJrkn88nJOCGD93A5ZR81+3ZAr8giHaZfHXl+n7OoNlkQDzbtGGqTA35
 ePPaXKgx4QUmmCzkyzgvLUCaJpI+lMw4EKf9ELjmLuTZ7VcTQWBYvPmxoz61LZjrA5ce7/ETlJw
 1/O3dEki7tRBT+I396ggNX1QKefFUfgoPWyYXJ9yP5z4mJALPQWAdZkA8l+RgRsnIPBXgM4QGKK
 7MEp9BkQ8CdJjaK2Iq4auEtqlxOIMjru/4V8I35UeEK75Y9xGBsejadMbEQZFV+g4MRNwVQsHeS
 M1YJJSMyty7JJU9b9NDw/RuC54tg8W7c8wnr3n4Oc1DSzrgcyhjIkxrOfGy7rvF66lee+vkxztF
 JDcvlwR+W4F78hH3euTXcFg7G8RcfR+pBKxDh2Dq6qjbxKW5iAsZjOlrk3XyP4/BqrqpnHu1YLC
 3C+eJ1dYAG4V5HXJoXZWZuNxt1veGcnZ88IHgTvqtxpb13dtJotHct2zVDjGipRDmHtcvt7l8Wg
 F+MdSVQVlTrKfsBJL5es+LK9v7rEVaAYDtMsfsyZrYi1FLPh8UZSe6uPOV+WvwdxM7nwuLltO67
 5aDYgGk+os9dpGqpz3CAKG0hy/U0sU1PudaPOvzxCGSQDDw4oZ1ztVgB88MxaqVIOrUMDXBwGdc
 x/+n1jGApHJzR6w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a flag `-p PREFIX`/`--add-subject-prefix=PREFIX` to `am` and `shazam`
commands. This flag will add PREFIX to the subject line of each patch before
applying the patch.

One use case for this is when composing trees that consist of patches from many
different sources. Adding a prefix to the subject of each series makes it easy
to see the origin when scanning the commit log.

Another side effect is that git will not remove the `PREFIX: [PATCH vX x/y]`
prefix from the patch when applying it. This might similarly be desirable in
some situations.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Add prefix to dependencies when using `b4 shazam`
- Link to v1: https://patch.msgid.link/20241220-prefix-v1-1-026a7be0b35a@kernel.org
---
 src/b4/__init__.py | 14 ++++++++------
 src/b4/command.py  |  2 ++
 src/b4/mbox.py     |  4 ++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 4d234e01d9932fc600103bf62c1cb109b1eac201..083c81d96c5ab73e6f5eaaf194d23ee10b71363e 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -618,7 +618,7 @@ class LoreSeries:
 
     def get_am_ready(self, noaddtrailers: bool = False, addmysob: bool = False,
                      addlink: bool = False, cherrypick: Optional[List[int]] = None, copyccs: bool = False,
-                     allowbadchars: bool = False, showchecks: bool = False) -> List[email.message.EmailMessage]:
+                     allowbadchars: bool = False, showchecks: bool = False, addprefix: Optional[str] = None) -> List[email.message.EmailMessage]:
 
         usercfg = get_user_config()
         config = get_main_config()
@@ -752,7 +752,7 @@ class LoreSeries:
                 if noaddtrailers:
                     add_trailers = False
                 msg = lmsg.get_am_message(add_trailers=add_trailers, extras=extras, copyccs=copyccs,
-                                          addmysob=addmysob, allowbadchars=allowbadchars)
+                                          addmysob=addmysob, allowbadchars=allowbadchars, addprefix=addprefix)
                 if local_check_cmds:
                     lmsg.load_local_ci_status(local_check_cmds)
                 if lmsg.local_ci_status or lmsg.pw_ci_status in {'success', 'fail', 'warning'}:
@@ -2333,7 +2333,7 @@ class LoreMessage:
 
         self.body = LoreMessage.rebuild_message(bheaders, message, fixtrailers, basement, signature)
 
-    def get_am_subject(self, indicate_reroll: bool = True, use_subject: Optional[str] = None) -> str:
+    def get_am_subject(self, indicate_reroll: bool = True, use_subject: Optional[str] = None, prefix: Optional[str] = None) -> str:
         # Return a clean patch subject
         parts = ['PATCH']
         if self.lsubject.rfc:
@@ -2354,11 +2354,13 @@ class LoreMessage:
         if not use_subject:
             use_subject = self.lsubject.subject
 
-        return '[%s] %s' % (' '.join(parts), use_subject)
+        prefix = "" if prefix is None else prefix
+
+        return '%s: [%s] %s' % (prefix, ' '.join(parts), use_subject)
 
     def get_am_message(self, add_trailers: bool = True, addmysob: bool = False,
                        extras: Optional[List['LoreTrailer']] = None, copyccs: bool = False,
-                       allowbadchars: bool = False) -> email.message.EmailMessage:
+                       allowbadchars: bool = False, addprefix: Optional[str] = None) -> email.message.EmailMessage:
         # Look through the body to make sure there aren't any suspicious unicode control flow chars
         # First, encode into ascii and compare for a quick utf8 presence test
         if not allowbadchars and self.body.encode('ascii', errors='replace') != self.body.encode():
@@ -2403,7 +2405,7 @@ class LoreMessage:
 
         am_msg = email.message.EmailMessage()
         hfrom = format_addrs([(i.get('Author', ''), i.get('Email'))])
-        am_msg.add_header('Subject', self.get_am_subject(indicate_reroll=False, use_subject=i.get('Subject')))
+        am_msg.add_header('Subject', self.get_am_subject(indicate_reroll=False, use_subject=i.get('Subject'), prefix=addprefix))
         am_msg.add_header('From', hfrom)
         am_msg.add_header('Date', i.get('Date'))
         am_msg.add_header('Message-Id', f'<{self.msgid}>')
diff --git a/src/b4/command.py b/src/b4/command.py
index 2bdd785d90004bc0be9c839fe50938dc9cbbe207..910e6461679e6a11af69ad2d6a908b28a78a32ee 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -61,6 +61,8 @@ def cmd_am_common_opts(sp):
                     help='Break thread at the msgid specified and ignore any parent messages')
     sp.add_argument('--allow-unicode-control-chars', dest='allowbadchars', action='store_true', default=False,
                     help='Allow unicode control characters (very rarely legitimate)')
+    sp.add_argument('-p', '--add-subject-prefix', dest='addprefix', default=None,
+                      help='Add a PREFIX: to every patch subject line')
     sa_g = sp.add_mutually_exclusive_group()
     sa_g.add_argument('-l', '--add-link', dest='addlink', action='store_true', default=False,
                       help='Add a Link: trailer with message-id lookup URL to every patch')
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 7061d1493be3e0d116ec504c9a1638be34b65a9a..171da7d8d445052babc335b7f11e9c60e3f518f7 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -159,7 +159,7 @@ def make_am(msgs: List[email.message.EmailMessage], cmdargs: argparse.Namespace,
 
     am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers, addmysob=cmdargs.addmysob, addlink=cmdargs.addlink,
                                 cherrypick=cherrypick, copyccs=cmdargs.copyccs, allowbadchars=cmdargs.allowbadchars,
-                                showchecks=cmdargs.check)
+                                showchecks=cmdargs.check, addprefix=cmdargs.addprefix)
     logger.info('---')
 
     if cherrypick is None:
@@ -325,7 +325,7 @@ def make_am(msgs: List[email.message.EmailMessage], cmdargs: argparse.Namespace,
             for ppid in lser.prereq_patch_ids:
                 if ppid in pmap:
                     logger.info(' Deps: Applying prerequisite patch: %s', pmap[ppid].full_subject)
-                    pam_msg = pmap[ppid].get_am_message(add_trailers=False)
+                    pam_msg = pmap[ppid].get_am_message(add_trailers=False, addprefix=cmdargs.addprefix )
                     b4.save_mboxrd_mbox([pam_msg], ifh)
 
         b4.save_git_am_mbox(am_msgs, ifh)

---
base-commit: d23a9a2d5684369710bd2e416e41159193df3756
change-id: 20241220-prefix-87d15717e4a4

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


