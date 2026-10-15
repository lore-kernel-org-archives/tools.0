Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93988547061
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 00:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022658; cv=none; b=GYecwM+7Cou+i9W7r/ewlqeg53XpMHTgW7ADfIVrEqkk2xchJB8o6OIbCXcJl/6CLorfM2DPKvuAcBLW1OZxsZJlhf6TS7lJF3sCy0bRPUcBiAA9FQzNoOAAx+2uMRj3PgBPhoejm1btVlPtjQ5qI6p70avgnoK/0n/6mHtunoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022658; c=relaxed/simple;
	bh=nDKHYjD5YJSxMjdLK5N1tvdSpH8wCZCO/4fT+ZorsK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvDs2dfop7Nug705blS4BKwN/eRRVXko8YGno8AXPAFWIGUXwfjddHq3Q/IgnhOdIsy5Z6ouA2k0dUOkiwIDQ1R9TaG1IzKUmFHMC5ddQ9cBqRa00v12m9aCRXfGuZ0Qk9CN7+lfxWBqqUGjSKatOPg7DwNsmzlTxYy1Nlx0H0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNuw4V5U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNuw4V5U"
Received: by smtp.kernel.org (Postfix)
	id 4674B1F000C6; Thu, 15 Oct 2026 00:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68C21F000C8;
	Thu, 15 Oct 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792022657;
	bh=Yl5j018/ufBtWx7qFv0/Pkb4fT/ibK4hN8PbOtgIFcc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jNuw4V5UmUq4qpji1GBI8bj+yOHpUoH3ZwS8j5e75KvJqJ2isjfW3vth8TdAmAuM+
	 xSRRLy0D6ZJaPVA5tLx6s+dyBGk0/uHlnpxt9+M6XVwc8aOyCZYdHfyq8ACOW/I7Ka
	 aBKL9XWwT8CVm38F8EJLHwe0mAjU9sH15MDBnCjWpADzKCJGbPrde5HF7Z2tLd36tQ
	 9e4WkhAh1OQ4f3/MgMSxnuyKXGt9jZeB5LazEyRbLxPDCt7Lshof918tYTQNe/Vy3f
	 KoZjJqQ4xS4do6YyUCihGyaYCb1faokOBvVgYb+Kig5a9Je1RYyKEQSL5UewNQq6+g
	 +G6HBOFJmEZag==
From: Brian Masney <masneyb@kernel.org>
Date: Wed, 14 Oct 2026 20:03:39 -0400
Subject: [PATCH b4 2/4] review-tui: let ApplyStateModal update other patch
 fields
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pw-delegate-v1-2-a393ae92152a@kernel.org>
References: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
In-Reply-To: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=nDKHYjD5YJSxMjdLK5N1tvdSpH8wCZCO/4fT+ZorsK8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIuSNQ089T38u39eP2m6q++J4dkdI5um/Z9e+WJSgsNU
 b7tj+c0dZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRdDZGhl/Lolf4H5qaxWJi
 /HLl3TD+jBbW1/munyZdVvso8kq1tp7hf9kS7zU7tztz/F0YuNc2RyW/bE4nn9CEgq2y39nkDx/
 bwQ4A
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

ApplyStateModal is the progress dialog for PATCHing Patchwork patches
one at a time, with Esc to stop and a result that says which patches
were done. The only thing tying it to state changes is the title and
the fields it sends. Move those into _title() and _payload(), so a
subclass can reuse the rest to change a different field, such as the
delegate. There is no change in behavior.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/b4/review_tui/_modals.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index d1b878870b92..bcdbba2250cc 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -2758,6 +2758,9 @@ class ApplyStateModal(ModalScreen[ApplyStateResult]):
     Esc stops the run after the request that is in flight. The result
     lists the patch ids that were updated, so the caller can tell which
     series were finished and which were not.
+
+    Subclasses can change other patch fields by overriding :meth:`_title`
+    and :meth:`_payload`.
     """
 
     BINDINGS = [
@@ -2813,9 +2816,15 @@ class ApplyStateModal(ModalScreen[ApplyStateResult]):
         self._error = ''
         self._cancelled = False
 
+    def _title(self) -> str:
+        return f'Setting state to: {self._new_state}'
+
+    def _payload(self) -> Dict[str, Any]:
+        return {'state': self._new_state, 'archived': self._archived}
+
     def compose(self) -> ComposeResult:
         with Vertical(id='apply-dialog'):
-            yield Label(f'Setting state to: {self._new_state}', id='apply-title')
+            yield Label(self._title(), id='apply-title', markup=False)
             yield Label(self._series_name, id='apply-series', markup=False)
             yield Label(
                 f'Processing 0/{len(self._patch_ids)} patches...', id='apply-status'
@@ -2858,10 +2867,7 @@ class ApplyStateModal(ModalScreen[ApplyStateResult]):
                 if self._cancelled or worker_cancelled():
                     break
                 patchid_url = '/'.join((patches_url, str(patch_id), ''))
-                data = {
-                    'state': self._new_state,
-                    'archived': self._archived,
-                }
+                data = self._payload()
                 try:
                     rsp = pses.patch(
                         patchid_url,

-- 
2.55.0

