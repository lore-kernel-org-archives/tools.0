Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792638;
	b=FPLkNUwnqgyPP/9XxxhFtYSP77uSdafR0AuFzQkgx/Q78ZRBQTGndgrJjF7j8duk/dE0
	 OMXK+CqLQKBC1+QX/FJZNf4KTDWzFvXmQu1iNgSr+GEuqzXbF8VoREgNsVx/6uOPwZ49o
	 VY7t1MYXD030885AcAUMV2Jco92buqD4mZW3AMqmySLmO6OqSC9j1IzldgrIVu1VYJwLw
	 BDJv3P3ReN+3mth0x6LVZO5sSuuHpjTcYzAhUb/9cwjngA6EAEeFUGH3fjz1TSZEtHp2o
	 zNzeitYJF60wsGmc1am3KZY+549WmBplA4sCfmLYBP54vayp3+vj/D4hacEos98HFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792638;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=85m5N7/TAndEellNRDyYEN26J2QDpIusnRBrOPmw2z8=;
	b=0Z8xOSqFQO7cBgiie6ie1tuwKVV+wSjn/JR6dwO4675Z9ayDEeQy/Tve4vpGE21xZ30N
	 pNEdBe8C+XgdEaSI45wyREGZ5gg3WyQrTpMjjB++nWiqz7ZT7pMyYGnTBVU9CtAbaQrgF
	 wLF01jQ2ZiuanSx5XEJwvTyx1CFM9NJXn1itnwDWeZexcijEawpXViUWKaeuZPABEloRY
	 QOazfECXbvG7wlCvzs+oaqrBv+6hAYlTYc6YoWIfhzh/4SDFfE9wd3xmDDYhD/C5k+cOz
	 N989nJzrLNYgCk3Uy3MyzJNf/y3bufAfuLJ7xUOC7keoXGHmErXYzqr3DRVJK5k3H0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M+fv+I/D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83F4606A321
	for <tools@linux.kernel.org>; Fri, 27 Nov 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+fv+I/D
Received: by smtp.kernel.org (Postfix)
	id 38CAF1F00898; Fri, 27 Nov 2026 15:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A2A1F008A0;
	Fri, 27 Nov 2026 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792637;
	bh=85m5N7/TAndEellNRDyYEN26J2QDpIusnRBrOPmw2z8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M+fv+I/DcxGPnqHXoffpAktOQD6OAp2Y3uijIVY6Vtf9jCvAmHZ14eDT+zJHKMoAk
	 6o8f98SmfJ3CFUTHNrorN/SsHLUKM6Y/zXN6g0VZ+v4V23dPo0CO6zWVnX3HlEocUE
	 jJYtNSUp+uC6SdBWMQGxxpxMv17hF8cxvfnt4N3WUHXTFZ/NhT3LjowfVADxuRu0DM
	 Yit9J27LWAhYVMuS6fKNQpRYb+6vgIn4G+yxTkdhYS+QS908EKEaZty7mkgTr5ISOM
	 Ailu2KbEQKJ9gbD2P2xBwzJfJEZkxN8Ms+1NK88vrPoKdeZbKtDAb540siXjydE3RG
	 uom9Y5fv5FHGg==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Fri, 27 Nov 2026 16:17:04 +0100
Subject: [PATCH b4 2/2] trailers: keep comments below our own Signed-off-by
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-multiline-trailer-comments-v1-2-ae8360525615@kernel.org>
References: <20261127-multiline-trailer-comments-v1-0-ae8360525615@kernel.org>
In-Reply-To: <20261127-multiline-trailer-comments-v1-0-ae8360525615@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5209; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=AyBHq4ISlqoKgZOpQF+4sIgvHkCexVtkFQWqWviRtbM=;
 b=kA0DAAoWfCLwwvNHCpcByyZiAGsJnvqhDYxEIF66xb6sjLbGMNhgDj8KVSFw5xQdQDbyaobC+
 4h1BAAWCgAdFiEEG4ZZb5nneg10Sk44fCLwwvNHCpcFAmsJnvoACgkQfCLwwvNHCpe5YwD+JakS
 +oxJDz2WmsrPl4XDUGmZL6yEKNrj4HANwFu9swsBAJJnzquIemWFHerNNZ0QsKzjs4aZt5Wd/kP
 VYNqyzBEL
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

'b4 am', 'b4 shazam' and 'b4 trailers -u' drop a [ ... ] comment placed
below the user's own Signed-off-by.

b4 moves the user's Signed-off-by to the bottom of the trailers, and
recreates it without its comment. When other trailers follow, such a
comment typically describes changes made by the next signer, e.g. when
the original author applies a version modified by a maintainer:
dropping it, or moving it with the Signed-off-by, breaks the chain of
custody description. Keep this Signed-off-by in place in this case. When
it is the last trailer, it is still moved, but with its comment.

The new tests check that:

- a Signed-off-by followed by a comment and another signer stays in
  place, with or without adding a new Signed-off-by;
- the last Signed-off-by keeps its comment when moved below the new
  trailers.

Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 src/b4/__init__.py         | 14 +++++++---
 src/tests/test___init__.py | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index e3c0f33..39b9fe0 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3638,9 +3638,17 @@ class LoreMessage:
         sobtr = LoreTrailer()
         hasmysob = False
         if sobtr in btrailers:
-            # Our own signoff always moves to the bottom of all trailers
-            hasmysob = True
-            btrailers.remove(sobtr)
+            mysob = btrailers[btrailers.index(sobtr)]
+            # Our own signoff moves to the bottom of all trailers, unless it is
+            # followed by a comment describing the next signer's changes
+            if (
+                mysob is btrailers[-1]
+                or not mysob.extinfo
+                or mysob.extinfo.lstrip().startswith('#')
+            ):
+                hasmysob = True
+                btrailers.remove(mysob)
+                sobtr.extinfo = mysob.extinfo
 
         new_trailers = self.followup_trailers
         if extras:
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 8f4242a..f52c9ee 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -381,6 +381,70 @@ def test_multiline_extinfo(
     assert others == expected_others
 
 
+@pytest.mark.parametrize(
+    'trailers,addmysob,expected',
+    [
+        # Our signoff followed by a comment from the next signer stays in place
+        (
+            'Signed-off-by: Test Override <test-override@example.com>\n'
+            '[ Maint: reworked\n'
+            '  the foo bits ]\n'
+            'Signed-off-by: Maint <maint@example.com>\n',
+            False,
+            'Signed-off-by: Test Override <test-override@example.com>\n'
+            '[ Maint: reworked\n'
+            '  the foo bits ]\n'
+            'Signed-off-by: Maint <maint@example.com>\n'
+            'Reviewed-by: Rev <rev@example.com>\n',
+        ),
+        (
+            'Signed-off-by: Test Override <test-override@example.com>\n'
+            '[ Maint: reworked\n'
+            '  the foo bits ]\n'
+            'Signed-off-by: Maint <maint@example.com>\n',
+            True,
+            'Signed-off-by: Test Override <test-override@example.com>\n'
+            '[ Maint: reworked\n'
+            '  the foo bits ]\n'
+            'Signed-off-by: Maint <maint@example.com>\n'
+            'Reviewed-by: Rev <rev@example.com>\n'
+            'Signed-off-by: Test Override <test-override@example.com>\n',
+        ),
+        # Our last signoff moves to the bottom with its comment
+        (
+            'Signed-off-by: Maint <maint@example.com>\n'
+            'Signed-off-by: Test Override <test-override@example.com>\n'
+            '[ Test Override: resolved\n'
+            '  conflicts ]\n',
+            True,
+            'Signed-off-by: Maint <maint@example.com>\n'
+            'Reviewed-by: Rev <rev@example.com>\n'
+            'Signed-off-by: Test Override <test-override@example.com>\n'
+            '[ Test Override: resolved\n'
+            '  conflicts ]\n',
+        ),
+    ],
+)
+def test_fix_trailers_keeps_comments(
+    trailers: str, addmysob: bool, expected: str
+) -> None:
+    raw = (
+        'From: Test Author <test@example.com>\n'
+        'Subject: [PATCH] test comments\n'
+        'Date: Mon, 1 Jan 2024 00:00:00 +0000\n'
+        'Message-Id: <20240101-test-v1-1-abc123@example.com>\n'
+        '\n'
+        'Commit body here.\n'
+        '\n'
+        f'{trailers}'
+    )
+    msg = email.message_from_string(raw, policy=email.policy.EmailPolicy(utf8=True))
+    lmsg = b4.LoreMessage(msg)
+    extra = b4.LoreTrailer(name='Reviewed-by', value='Rev <rev@example.com>')
+    lmsg.fix_trailers(extras=[extra], addmysob=addmysob)
+    assert lmsg.body == f'Commit body here.\n\n{expected}'
+
+
 @pytest.mark.parametrize('wrap', ['\n', ' \n', ' \n    ', '\t\n\t'])
 def test_wrapped_fixes_trailer_matches_original(wrap: str) -> None:
     original = 'Fixes: 239b7c5705a4 ("vfio/pci: close display console during unrealize, not finalize")'

-- 
2.55.0

