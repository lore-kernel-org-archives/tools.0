Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6EA39D6DF
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674517; cv=none; b=TDMmlHnsWCA30j5kqTyoK5QSyOkiv7XBclF8XDtLTSYMGFtnZbwLB+DOD8/ZRBTio1xBFZINlxyUEwu/eqUFLkxIzotrVwnpGLJeoA5RCobpWo7rsOYysHvPsusgyIWC/4UwV1mZIgopDIxJisdiIXQxoR7++tJmVoR9ugBcLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674517; c=relaxed/simple;
	bh=3PTbYLymbEqn08cMQRwS1miJvdch5Vd3rsuu51Y2bko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SM1LFIUUJCL2RseS1SE4ysuqSNA9MAS6AnYbf0j+Nl4q5kAbU8CmyrIrcakSTsWJbZBxME5OOrfJ+BtQzQZLAgLrKTGmWfRAfD6iZwtkcD9CNGuIsWCsZCywez5mB1b/dTQFsjP2Ixv97bnONa+BkCEz8AZabPGh+eC1er8EYi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmRW0JU6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmRW0JU6"
Received: by smtp.kernel.org (Postfix)
	id 71315C2BC9E; Mon, 16 Mar 2026 15:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A6EC2BC87;
	Mon, 16 Mar 2026 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773674517;
	bh=3PTbYLymbEqn08cMQRwS1miJvdch5Vd3rsuu51Y2bko=;
	h=From:Date:Subject:To:Cc:From;
	b=MmRW0JU6Frk0gVvj/87N6Ao35Y+yW2ZK/M+j0p1nXVhlw8o/o+DMoBK9/ur3bIQNK
	 zuf+6wPrIqv3uw3Qp6GAlGeklGa0QCcjGkpufcaAw9M2jP2SBonx3odoqGbnAmO2ZL
	 urUdo6ZxGR45V8LvWSOPmkWWJoTWKikLCRBepbn/M/Py62JN+NZU4b+45pjj89gLmS
	 D3hQfe3mdsUKCf6EYPK3pfbD48Az8KRoADyzXWJbOfaY8xnnJUcEEwLg1rga6JXfIy
	 94Bk6OKP0XPJ5nTLZI8yqkSEsPSNdelAupQPpdU3a+jUZsbJo+ZtSaX+z96SvlmAF5
	 l2b4YYrnF7FLQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 11:21:55 -0400
Subject: [PATCH b4 v2] Centralize b4 Message-ID policy
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-review-reply-msgid-v2-1-cbecc70a5f53@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBREr0L+2hraIo2uvIdhQekHviKQFquE9
 O62uHc1mcmbmQ0cWkIHl2wDi54cTWM04pBB09djh4xM9CByUeaSlyxB+I4yDyt7uo4M08IoobV
 SbaEhFmeLLX320RvoAqpf5l76js2S1hLVk1smu+7Pnu/svxPPGWcKpTkZqVRdnq8PtCMOx8l2U
 IUQvjGQ173LAAAA
X-Change-ID: 20260316-review-reply-msgid-b2d72bb77f4b
To: "\"Kernel.org Tools\"" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7952; i=tamird@kernel.org;
 h=from:subject:message-id; bh=3PTbYLymbEqn08cMQRwS1miJvdch5Vd3rsuu51Y2bko=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJk7FEQyF2758nPhS/bdt77O/733wcpiz3OPn7HrXJnjN
 X3Se6N1NztKWRjEuBhkxRRZEkUP7U1Pvb1HNvPdcZg5rEwgQxi4OAVgIkLtjAw/BDcuei7whymo
 cIm+t9riS2vOFL88skBNo+b1SYubUXNiGf67iUzz/MmwJOvQmfOBe35eTD3YM29htW9ayHeZBs8
 5rVeZAQ==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Route b4-owned Message-ID generation through b4.make_msgid()
with a default domain of b4 so stdlib never derives the
domain from the local hostname.

Commit 7ae850f409eb72ad25e55ea0fa283bfc5efa5492 did not
solve the problem because it only changed the review email
builder. TUI follow-up replies still went through
LoreMessage.make_reply(), which continued to call bare
email.utils.make_msgid() and therefore still produced
hostname-derived Message-IDs.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: Codex gpt-5.4
---
Changes in v2:
- Use Assisted-by trailer.
- Link to v1: https://patch.msgid.link/20260316-review-reply-msgid-v1-1-7e3d5d377a69@kernel.org
---
 src/b4/__init__.py         |  7 ++++++-
 src/b4/ez.py               |  6 +++---
 src/b4/pr.py               |  5 ++++-
 src/b4/review/_review.py   |  6 +-----
 src/b4/ty.py               |  3 +--
 src/tests/test___init__.py | 14 ++++++++++++++
 src/tests/test_review.py   | 12 ------------
 7 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 848b9d4..9b9f3df 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2134,7 +2134,7 @@ class LoreMessage:
         references = LoreMessage.clean_header(self.msg.get('References', '') or '')
         msg['References'] = f'{references} <{self.msgid}>'.strip()
         msg['Date'] = email.utils.formatdate(localtime=True)
-        msg['Message-Id'] = email.utils.make_msgid()
+        msg['Message-Id'] = make_msgid(idstring='b4-reply')
         return msg
 
     @staticmethod
@@ -5048,6 +5048,11 @@ def get_mailfrom() -> Tuple[str, str]:
     return str(usercfg.get('name', '')), str(usercfg.get('email', ''))
 
 
+def make_msgid(idstring: Optional[str] = None, domain: str = 'b4') -> str:
+    """Wraps email.utils.make_msgid() to avoid hostname-derived message-ids."""
+    return email.utils.make_msgid(idstring=idstring, domain=domain)
+
+
 def is_maildir(dest: str) -> bool:
     return (os.path.isdir(os.path.join(dest, 'new'))
             and os.path.isdir(os.path.join(dest, 'cur'))
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 87a6cfe..4bcb1ce 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -245,7 +245,7 @@ def auth_verify(cmdargs: argparse.Namespace) -> None:
     cmsg = EmailMessage()
     cmsg.add_header('From', myemail)
     cmsg.add_header('Subject', 'b4-send-verify')
-    cmsg.add_header('Message-ID', email.utils.make_msgid(domain='b4'))
+    cmsg.add_header('Message-ID', b4.make_msgid())
     cmsg.set_charset('utf-8')
     cmsg.set_payload(f'verify:{vstr}\n', charset='utf-8')
     bdata = cmsg.as_bytes(policy=b4.emlpolicy)
@@ -1186,7 +1186,7 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
         if cover:
             cmsg = EmailMessage()
             cmsg['Subject'] = f'[PATCH 0/{len(patches)}] cover'
-            cmsg['Message-Id'] = email.utils.make_msgid(domain='b4')
+            cmsg['Message-Id'] = b4.make_msgid()
             cmsg.set_payload('cover', 'us-ascii')
             patches.insert(0, ('', cmsg))
             rethread(patches)
@@ -2924,7 +2924,7 @@ def auto_to_cc() -> None:
     if extras:
         # Make it a LoreMessage, so we can run a fix_trailers on it
         cmsg = EmailMessage()
-        cmsg['Message-ID'] = email.utils.make_msgid(domain='b4')
+        cmsg['Message-ID'] = b4.make_msgid()
         cmsg['Subject'] = 'Cover letter'
         cmsg.set_payload(cover, charset='utf-8')
         clm = b4.LoreMessage(cmsg)
diff --git a/src/b4/pr.py b/src/b4/pr.py
index ea74c32..5969a0d 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -392,7 +392,10 @@ def get_pr_from_github(ghurl: str) -> Optional[b4.LoreMessage]:
     msg['From'] = f'{uname} <{uemail}>'
     title = prdata.get('title', '')
     msg['Subject'] = f'[GIT PULL] {title}'
-    msg['Message-Id'] = utils.make_msgid(idstring=f'{rproj}-{rrepo}-pr-{rpull}', domain='github.com')
+    msg['Message-Id'] = b4.make_msgid(
+        idstring=f'{rproj}-{rrepo}-pr-{rpull}',
+        domain='github.com',
+    )
     created_at = utils.format_datetime(datetime.strptime(prdata.get('created_at'), '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=timezone.utc))
     msg['Date'] = created_at
     msg.set_charset('utf-8')
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index f4937b5..5b026a5 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2359,11 +2359,7 @@ def _build_review_email(series: Dict[str, Any], patch_meta: Optional[Dict[str, A
     else:
         msg['References'] = f'<{header_info["msgid"]}>'
     msg['Date'] = email.utils.formatdate(localtime=True)
-    _, _, mid_domain = user_email.rpartition('@')
-    msg['Message-Id'] = email.utils.make_msgid(
-        idstring='b4-review',
-        domain=mid_domain or 'b4',
-    )
+    msg['Message-Id'] = b4.make_msgid(idstring='b4-review')
 
     return msg
 
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 098e241..533d0a4 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -118,8 +118,7 @@ def make_reply(reply_template: str, jsondata: JsonDictT, gitdir: Optional[str],
     else:
         msg.add_header('Subject', 'Re: ' + subject)
 
-    mydomain = jsondata['myemail'].split('@')[1]
-    msg['Message-Id'] = email.utils.make_msgid(idstring='b4-ty', domain=mydomain)
+    msg['Message-Id'] = b4.make_msgid(idstring='b4-ty')
     msg['Date'] = email.utils.formatdate(localtime=True)
     body = Template(reply_template).safe_substitute(jsondata)
     msg.set_payload(body, charset='utf-8')
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 64ad2f9..6275ece 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -5,6 +5,7 @@ import email
 import email.parser
 import io
 import pathlib
+import socket
 
 from typing import Any, Dict, List, Literal, Optional, Tuple
 
@@ -58,6 +59,19 @@ def test_save_git_am_mbox(sampledir: Optional[str], tmp_path: pathlib.Path, sour
     assert re.search(regex, res, flags=flags)
 
 
+def _msgid_domain(msgid: str) -> str:
+    return msgid.strip('<>').rsplit('@', maxsplit=1)[1]
+
+
+def test_make_msgid_avoids_host_domain_by_default() -> None:
+    stdlib_msgid = email.utils.make_msgid()
+    b4_msgid = b4.make_msgid(idstring='b4-test')
+
+    assert _msgid_domain(stdlib_msgid) == socket.getfqdn()
+    assert _msgid_domain(b4_msgid) == 'b4'
+    assert _msgid_domain(b4_msgid) != socket.getfqdn()
+
+
 @pytest.mark.parametrize('source,expected', [
     ('trailers-test-simple',
      [('person', 'Reported-by', '"Doe, Jane" <jane@example.com>', None),
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index f15b906..ffffb87 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -1302,18 +1302,6 @@ class TestBuildReviewEmailHeaders:
         assert 'reviewer@example.com' in msg['From']
         assert 'Reviewer' in msg['From']
 
-    @mock.patch('b4.get_email_signature', return_value='sig')
-    @mock.patch('b4.get_user_config', return_value={
-        'name': 'Reviewer', 'email': 'reviewer@example.com'})
-    def test_message_id_uses_reviewer_domain(self, _mock_cfg: mock.Mock,
-                                             _mock_sig: mock.Mock) -> None:
-        msg = review._build_review_email(
-            self._make_series(), None, self._make_review(), 'cover', '', None)
-        assert msg is not None
-        assert msg['Message-Id'].endswith('@example.com>')
-        assert '.ip6.arpa' not in msg['Message-Id']
-
-
 # -- Tests for _build_review_email() user-edited To/Cc -----------------------
 
 class TestBuildReviewEmailToCcEdited:

---
base-commit: ada9a7554864c5c21944f3d098c04862c54e3e7c
change-id: 20260316-review-reply-msgid-b2d72bb77f4b

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

