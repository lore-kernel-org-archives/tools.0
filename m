Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11B2BE7A7
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614413; cv=none; b=g0WnceR2mEamVSompsUteXDv/10zNykX5EeHNw6hJvCRmUyBkIksQKwk+XYUynaepfxwW2FN6tPRwnPNsEqsxD8pGvqCwBzFeQmhFV9mrdFSNFMGtnFjMAjBaFulx6+VfHs//Ub/vBjPw6XYhpPuqdGcx3STwl+2a6IbUuTR7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614413; c=relaxed/simple;
	bh=16FKpcdGqRnmhDai1UG5vkZ4tRfoNfsni9f0XxMYKP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5hrTtwz5IOWNGHCqRcbEfLuWO+HVOEHhT8jTh9HCeRK/zkONSrmHEPLQ/ITefdR2+OOY4SWKN//bbTosfIATM6it7CWm0Viwhs8DR0giFWWvTYWQ4SoVHgrxwA/D5yTXNxK1MOdfhGXiv5roxcXtMMIsmmgqC2AgcP7vg6x68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0y6f8O0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0y6f8O0"
Received: by smtp.kernel.org (Postfix)
	id 60644C2BCC9; Sun, 19 Apr 2026 16:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05834C2BCAF;
	Sun, 19 Apr 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614413;
	bh=16FKpcdGqRnmhDai1UG5vkZ4tRfoNfsni9f0XxMYKP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F0y6f8O0BULg24BiDWGuVVjUknmswU/44qwqIZAQxDmJ78+PZCm4QVXZJzgNWb/1C
	 hNV76NrXKKhcLKuoYxVvtpY2X8joL35eMHgEOCrykeJOpTxFEU9VbfRG6JMpbIPntZ
	 5RT3Tfc9E/oMrgHzv3b1elMd50FljNtyIadDBc0cQPo692Qat/TZU/SxBXIchk4VQH
	 qYKWZKJyTf3mKDmE9Vm5MzhuHaMQ77clIGsE8BCI8hbQyrQ8bT7ytia0sTbCGjBnWI
	 dNpt9XLPEXgTOaetlyHqlK8AE5YnbGL3xmAWp7HBD77AzLbagtvEjHNIsLhCuYHCJ3
	 IrUrAOU3O1VsA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 12:00:06 -0400
Subject: [PATCH b4 v2 11/11] Enable pyright strict mode
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-ruff-check-v2-11-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7537; i=tamird@kernel.org;
 h=from:subject:message-id; bh=16FKpcdGqRnmhDai1UG5vkZ4tRfoNfsni9f0XxMYKP8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/rBeCSnj3b3rWZpjVfQRUxddmfspUsfPMvw8HfFiI
 ntJe9qnjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFNt8pXhv88Nj9TjH7VfyXmrxGv/VDMVl72vpCv6kFm+30b0xaP8aQz/04/+bJV
 qWzVDpSxu6tn9ByYodHtXiXguW72cOTjlpcFuNgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This catches a few impossible type assertions.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 misc/review-ci-example.py |  6 +++---
 pyproject.toml            | 15 +++++++++++++--
 src/b4/__init__.py        |  9 +++++----
 src/b4/ez.py              | 29 +++++++++++++++--------------
 src/b4/review/tracking.py | 16 +++++++++-------
 src/b4/ty.py              |  6 +++---
 6 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/misc/review-ci-example.py b/misc/review-ci-example.py
index dee0a5d..b2170a7 100755
--- a/misc/review-ci-example.py
+++ b/misc/review-ci-example.py
@@ -43,7 +43,7 @@ import sys
 
 def main() -> None:
     msg = email.message_from_binary_file(sys.stdin.buffer)
-    subject = msg.get('subject', '(no subject)')  # noqa: F841
+    subject = msg.get('subject', '(no subject)')  # noqa: F841  # pyright: ignore[reportUnusedVariable]
     msgid = msg.get('message-id', '').strip('<> ')
 
     # Example: read tracking data for commit-based CI lookups
@@ -51,9 +51,9 @@ def main() -> None:
     if tracking_file:
         with open(tracking_file) as fp:
             tracking = json.load(fp)
-        branch_tips = tracking.get('series', {}).get('branch-tips', [])
+        branch_tips = tracking.get('series', {}).get('branch-tips', [])  # pyright: ignore[reportUnusedVariable]
     else:
-        branch_tips = []  # noqa: F841
+        branch_tips = []  # noqa: F841  # pyright: ignore[reportUnusedVariable]
 
     # Seed the RNG with the message-id so results are stable across
     # repeated runs of the same message (simulates cached CI results).
diff --git a/pyproject.toml b/pyproject.toml
index bde64bf..b905090 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -134,8 +134,19 @@ warn_unreachable = true
 # once we specify `exclude`, we're on our own. See
 # https://github.com/microsoft/pyright/issues/9057#issuecomment-2366938099.
 exclude = [".venv", "ezgb", "liblore", "patatt"]
-typeCheckingMode = "standard"
-reportUnusedImport = true
+typeCheckingMode = "strict"
+
+# Overly strict rules.
+reportConstantRedefinition = false
+reportUnknownArgumentType = false
+reportUnknownLambdaType = false
+reportUnknownMemberType = false
+reportUnknownVariableType = false
+
+# False positives caused by underscore-prefixed functions used across files.
+# Might be good to clean this up.
+reportPrivateUsage = false
+reportUnusedFunction = false
 
 [tool.ty.src]
 exclude = ["ezgb/", "liblore/", "patatt/"]
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 739e1af..e3452b0 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -62,7 +62,7 @@ ConfigDictT = Dict[str, Union[str, List[str], None]]
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
-emlpolicy = email.policy.EmailPolicy(
+emlpolicy: email.policy.EmailPolicy[EmailMessage] = email.policy.EmailPolicy(
     utf8=True, cte_type='8bit', max_line_length=None, message_factory=EmailMessage
 )
 
@@ -4399,7 +4399,9 @@ def git_range_to_patches(
         msg.set_charset('utf-8')
         # Clean From to remove any 7bit-safe encoding
         origfrom = LoreMessage.clean_header(msg.get('From'))
-        lsubject = LoreSubject(msg.get('Subject'), presubject=presubject)
+        lsubject = LoreSubject(
+            LoreMessage.clean_header(msg.get('Subject')), presubject=presubject
+        )
         lsubject.counter = counter + 1
         lsubject.expected = expected
         if revision is not None:
@@ -5820,8 +5822,7 @@ def get_git_bool(gitbool: str) -> bool:
 
 def mailbox_email_factory(fh: BinaryIO) -> EmailMessage:
     """Factory function to create EmailMessage objects"""
-    msg = email.parser.BytesParser(policy=emlpolicy, _class=EmailMessage).parse(fh)  # type: EmailMessage
-    return msg
+    return email.parser.BytesParser(policy=emlpolicy, _class=EmailMessage).parse(fh)
 
 
 def get_msgs_from_mailbox_or_maildir(mbmd: str) -> List[EmailMessage]:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index be3d2fe..cd8a10c 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2679,20 +2679,21 @@ def get_sent_tagname(
     tagbase: str, tagprefix: str, revstr: Union[str, int]
 ) -> Tuple[str, Optional[int]]:
     revision = None
-    if isinstance(revstr, int):
-        revision = revstr
-    elif isinstance(revstr, str):
-        try:
-            revision = int(revstr)
-        except ValueError:
-            matches = re.search(r'^v(\d+)$', revstr)
-            if not matches:
-                # assume we got a full tag name, so try to find the revision there
-                matches = re.search(r'v(\d+)$', revstr)
-                if matches:
-                    revision = int(matches.groups()[0])
-                return revstr.replace('refs/tags/', ''), revision
-            revision = int(matches.groups()[0])
+    match revstr:
+        case int():
+            revision = revstr
+        case str():
+            try:
+                revision = int(revstr)
+            except ValueError:
+                matches = re.search(r'^v(\d+)$', revstr)
+                if not matches:
+                    # assume we got a full tag name, so try to find the revision there
+                    matches = re.search(r'v(\d+)$', revstr)
+                    if matches:
+                        revision = int(matches.groups()[0])
+                    return revstr.replace('refs/tags/', ''), revision
+                revision = int(matches.groups()[0])
 
     if tagbase.startswith('b4/'):
         return f'{tagprefix}{tagbase[3:]}-v{revision}', revision
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index fb41bf0..1adb99a 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1057,13 +1057,15 @@ def get_review_target_branches() -> list[str]:
     """Return all configured review-target-branch values."""
     config = b4.get_main_config()
     val = config.get('review-target-branch')
-    if val is None:
-        return []
-    if isinstance(val, list):
-        return [str(v) for v in val if v]
-    if isinstance(val, str) and val:
-        return [val]
-    return []
+    match val:
+        case None:
+            return []
+        case list():
+            return [v for v in val if v]
+        case str():
+            if val:
+                return [val]
+            return []
 
 
 def get_review_target_branch_default() -> Optional[str]:
diff --git a/src/b4/ty.py b/src/b4/ty.py
index ba7f646..4e096af 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -530,8 +530,8 @@ def send_messages(
 
         outgoing += 1
         if send_email:
-            if not fromaddr and isinstance(jsondata['myemail'], str):
-                fromaddr = jsondata['myemail']
+            if not fromaddr:
+                fromaddr = user_email
             logger.info(
                 '  Sending: %s', b4.LoreMessage.clean_header(msg.get('subject'))
             )
@@ -959,7 +959,7 @@ def get_branch_info(gitdir: Optional[str], branch: str) -> Dict[str, str]:
     BRANCH_INFO = dict()
 
     remotecfg = b4.get_config_from_git('branch\\.%s\\..*' % branch)
-    if remotecfg is None or 'remote' not in remotecfg:
+    if 'remote' not in remotecfg:
         # Did not find a matching branch entry, so look at remotes
         gitargs = ['remote', 'show']
         lines = b4.git_get_command_lines(gitdir, gitargs)

-- 
2.53.0

