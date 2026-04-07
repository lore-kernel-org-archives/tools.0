Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8723C6A56
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580528; cv=none; b=nwtb8LNV8fHQljW1CicghFWYLtZXLF4ttEbfl8c4DIAdGhiHZBb2Aa+5QCLM1GCF5BaSAY2MUJ5fORi5PDYXFAWgvEvxu+hCTrblg820nIqvs2r/j+wvIJALQ3TFe+SQr02KmU376dA0/Q2YIZDIc5sEGnp1Gv/sj4iBxAFdOV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580528; c=relaxed/simple;
	bh=UEG5p02HBv7SWj7SgbVaDNElrutJNOqAVlNrRcv3wRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTswLqgUobr77IybR8bqcYo58V81zqBE3pQlKd63bCgVmLpUxrO1FPYwoAzBzuaJh0Cv1k8xKkMEpVFtKoEmAWf60AY26P17ZBzGmostDSOh4gpqETFpv1tExh64rzIV0WknF++37bDhMYQ19RdHLgicZDbw5Te/Ui0UjDK3X2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTcsYTuw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTcsYTuw"
Received: by smtp.kernel.org (Postfix)
	id 0AEF3C2BCB5; Tue,  7 Apr 2026 16:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E509C116C6;
	Tue,  7 Apr 2026 16:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580527;
	bh=UEG5p02HBv7SWj7SgbVaDNElrutJNOqAVlNrRcv3wRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NTcsYTuwHtmFFQwAUFDGvYLDM14maGXAqviukQnsQdy7escGbbKt6gbzky9/179FN
	 XnpnHx6ejBE48QkJlmdoBQgS0Wzggm6wugwtCu3mbc1Gxve/jjR+ijSTbx70KTFHCW
	 lVi4vcM5Ey0DBTm81pTBPgjmRPMj/tk2XhYdr++zTpZRH06AOKA3kyQpEWsfnlm4he
	 ALRpvU5lvo8//dqPyaqMLRLVvdA6/JpnMPBkrxunBbhbx/y49hXM+XC3IgPvjYJtOo
	 aUELX3J4t5bYzN0tEA22RnV9qdYpQpyPAIKJAWDblDK3kpIZ/nytCi2mwtszTJaOe0
	 IlY1WCQDB6dpA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:40 -0400
Subject: [PATCH b4 11/12] Enable pyright strict mode
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-11-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7755; i=tamird@kernel.org;
 h=from:subject:message-id; bh=UEG5p02HBv7SWj7SgbVaDNElrutJNOqAVlNrRcv3wRc=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTTMaAu7leJzQDY55V88WocF5hOFfsmby3LXxXPsq4
 78LPv/bMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKrtrzAyTHFcesuptFyfYd6VuNvCb3bKPKutZfv6lLd40f0ZR2aElzP8z5c61n1
 MZGmTx14P1bJrk19XyIZVmJZt7GY+cOPJjEOzuAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This catches a few impossible type assertions.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 misc/review-ci-example.py |  6 +++---
 pyproject.toml            | 15 +++++++++++++--
 src/b4/__init__.py        | 11 +++++++----
 src/b4/ez.py              | 29 +++++++++++++++--------------
 src/b4/review/tracking.py | 16 +++++++++-------
 src/b4/ty.py              |  6 +++---
 6 files changed, 50 insertions(+), 33 deletions(-)

diff --git a/misc/review-ci-example.py b/misc/review-ci-example.py
index cbac2ae..13a670e 100755
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
index 25338e7..b89c4d9 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -125,8 +125,19 @@ strict = true
 warn_unreachable = true
 
 [tool.pyright]
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
 
 [tool.ty.rules]
 all = "error"
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index c9b05d8..1711758 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -61,7 +61,9 @@ from email.message import EmailMessage, Message
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
-emlpolicy = email.policy.EmailPolicy(utf8=True, cte_type='8bit', max_line_length=None, message_factory=EmailMessage)
+emlpolicy: email.policy.EmailPolicy[EmailMessage] = email.policy.EmailPolicy(
+    utf8=True, cte_type='8bit', max_line_length=None, message_factory=EmailMessage
+)
 
 # Presence of these characters requires quoting of the name in the header
 # adapted from email._parseaddr
@@ -4086,7 +4088,9 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
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
@@ -5378,8 +5382,7 @@ def get_git_bool(gitbool: str) -> bool:
 
 def mailbox_email_factory(fh: BinaryIO) -> EmailMessage:
     """Factory function to create EmailMessage objects"""
-    msg = email.parser.BytesParser(policy=emlpolicy, _class=EmailMessage).parse(fh)  # type: EmailMessage
-    return msg
+    return email.parser.BytesParser(policy=emlpolicy, _class=EmailMessage).parse(fh)
 
 
 def get_msgs_from_mailbox_or_maildir(mbmd: str) -> List[EmailMessage]:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 9f55bc9..4e38c38 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2346,20 +2346,21 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
 
 def get_sent_tagname(tagbase: str, tagprefix: str, revstr: Union[str, int]) -> Tuple[str, Optional[int]]:
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
index 9c5d33f..16e62cb 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -933,13 +933,15 @@ def get_review_target_branches() -> list[str]:
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
index f88b53f..4ef9c33 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -469,8 +469,8 @@ def send_messages(listing: List[JsonDictT], branch: str, cmdargs: argparse.Names
 
         outgoing += 1
         if send_email:
-            if not fromaddr and isinstance(jsondata['myemail'], str):
-                fromaddr = jsondata['myemail']
+            if not fromaddr:
+                fromaddr = user_email
             logger.info('  Sending: %s', b4.LoreMessage.clean_header(msg.get('subject')))
             b4.send_mail(smtp, [msg], fromaddr, dryrun=cmdargs.dryrun)
         else:
@@ -878,7 +878,7 @@ def get_branch_info(gitdir: Optional[str], branch: str) -> Dict[str, str]:
     BRANCH_INFO = dict()
 
     remotecfg = b4.get_config_from_git('branch\\.%s\\..*' % branch)
-    if remotecfg is None or 'remote' not in remotecfg:
+    if 'remote' not in remotecfg:
         # Did not find a matching branch entry, so look at remotes
         gitargs = ['remote', 'show']
         lines = b4.git_get_command_lines(gitdir, gitargs)

-- 
2.53.0

