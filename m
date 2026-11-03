Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736345;
	b=qqOvL1G0jjEOFW2MdNmV6nDhuR1UcNnFz5OOtrIeLnYnUhZ0IDhFWV/4wKuPwHPZdR/n
	 rWaoN6+upEOd32RN9M+AyZviD+BqFY7vaAY9iw0jFcFS6FJ1cjlV7gLWyThl7Qh1TNKEd
	 Ur6AcY/rbYuq94aJI8Jp841F19rcZfku/YdeheqaA5MAQ6kYDLs3tOCFf5MqypsmTiXeG
	 PA8CHFuddH4t4381Ki/t3qn08eqGJwy2LMGLCk+HVB9QK4DqQiodkT5bA8n1CRAXjc4r2
	 e8dUMHFT5e0bAy5CHu2djAr9G91wPSVYGlXHR3Ca4z67NdC7KTA8tzqH0FE2MfmXjeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736345;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YjzbmbX+GGO4LAtoQ8ycTNrU8N4aOzQ0gDUFC6e7/SM=;
	b=BYi7s6wBBpLbosbzvUuYowc5sye7NOFBARcmjhvBw8yXhVWUb955dR0GLMfdv6uId76C
	 26Px3lW3o8yEBleg5GNTbPP74bFekcq6+XXXqSwfb88rKHMRNp3DQnsaeAjT19/D5Gjl7
	 AK2ivmgHw8ZMIp9wuSWK45czhH1lTtBUFjbf56cbLZ3RIqi4giV514rmVtVpkwBJ5NRYV
	 GbrjqiRQrbVgk/xLiG0pEWsT+Fz4n+FRpQSDU0yyGBAVqKjSpHiFkv57/TciLLWKjxvuR
	 qug9vi8gaMRuyDpDXxvcv+9pESv7AWvJ75VJt7RIM9fqj7mDU0dxrUj96CaDdSf9fog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv80PO5R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D6606A31B
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv80PO5R
Received: by smtp.kernel.org (Postfix)
	id 431F41F0093A; Tue,  3 Nov 2026 20:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD401F000C1;
	Tue,  3 Nov 2026 20:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736345;
	bh=YjzbmbX+GGO4LAtoQ8ycTNrU8N4aOzQ0gDUFC6e7/SM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Rv80PO5RfMS2jk4OaIf6LWVQ9I9uvfmmBqWbuN+PqgkF6zdNRP6YQ933drsaKMP05
	 6ECwu6PVzFdowk6HCYSaW22vlP2qTB+V3jfdj6GK78c6f9bJNT3b9E0lACmDPTk47+
	 kPjGjeBejie5CVjzg6NwQbVORD6j4ZbR4BjO6fP18pNXjP+kPsKXG3kP5FR+gMUnrg
	 RCm0g8sEdQHi6MaBdSKxTb2IxA5LxDDgGJce1wAHN9YnzxjoVwfI2j2DZtGlHG5vZf
	 zc7TSy6yJSFqs4wxr+dYi/pMSKj7gZWcpBEE7vI7YSYvLG3gTR6s0DOQ9uO2nXNWXy
	 4hfsk6uUvON9A==
From: Brian Masney <masneyb@kernel.org>
Date: Tue, 03 Nov 2026 15:05:34 -0500
Subject: [PATCH b4 1/2] review: add support for b4.send-me-too
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
Message-Id: <20261103-review-send-me-too-v1-1-0d23443820b7@kernel.org>
References: <20261103-review-send-me-too-v1-0-0d23443820b7@kernel.org>
In-Reply-To: <20261103-review-send-me-too-v1-0-0d23443820b7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-17634
X-Developer-Signature: v=1; a=openpgp-sha256; l=6925; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=71RZu/TRjAwrn4wwjsOPY9946FdeCsQuygxGzzybGWc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJe2U25o2W8cVcZR9XNLT2OJuUNDpMjPnTyzXOtWVx/J
 U/FaVpiRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5toeR4ZjOtajv26tPJzFt
 SYixelDkrNfEv/Jkp8qXguUZdvxFJYwM2zf4Rr2WDV7bat95SXr9owQOlZ2ShS/vysSzJ/1t9RJ
 mBAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The contributor side of b4 already has support for the configuration
option b4.send-me-too to make sure to include your email address on any
outbound emails. Let's go ahead and extend this to also work with the
review side of b4.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 docs/config.rst                    |  5 ++++-
 docs/releases.rst                  |  5 +++--
 src/b4/__init__.py                 | 30 ++++++++++++++++++++++++++++++
 src/b4/ez.py                       |  3 +--
 src/b4/review/_review.py           |  1 +
 src/b4/review_tui/_lite_app.py     |  1 +
 src/b4/review_tui/_modals.py       |  1 +
 src/b4/review_tui/_review_app.py   |  1 +
 src/b4/review_tui/_tracking_app.py |  2 +-
 9 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 593129e8ae70..78aaf6e5c427 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -1150,7 +1150,10 @@ Contributor-oriented settings
 
    :term:`b4.send-me-too`
      Instructs b4 to include your own address when sending. Set by default,
-     use ``no`` to suppress sending to yourself.
+     use ``no`` to suppress sending to yourself. This applies to patches
+     sent with ``b4 send`` and to replies and thank-you notes sent from
+     ``b4 review``. Review replies whose recipients you edited by hand are
+     sent to exactly those recipients.
 
      Default: ``yes``
 
diff --git a/docs/releases.rst b/docs/releases.rst
index 2b16efb72d7a..acd9b0d46808 100644
--- a/docs/releases.rst
+++ b/docs/releases.rst
@@ -350,8 +350,9 @@ New configuration options
 
 ``b4.send-me-too``
   Set to ``no`` to suppress including your own address in the ``Cc``
-  when sending patches with ``b4 send``. Defaults to ``yes`` (include
-  yourself).
+  when sending patches with ``b4 send``, and when sending review
+  replies, follow-up replies and thank-you notes from ``b4 review``.
+  Defaults to ``yes`` (include yourself).
 
 **In-tree ``.b4-config`` changes**
 
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 704ddec9b5c6..0985b0deaa08 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6684,6 +6684,36 @@ def get_excluded_addrs() -> Set[str]:
     return excludes
 
 
+def get_send_me_too() -> bool:
+    """Whether b4.send-me-too asks us to include ourselves as a recipient."""
+    config = get_main_config()
+    conf_me_too = str(config.get('send-me-too', 'yes')).lower()
+    return conf_me_too not in {'no', 'n', 'false', '0'}
+
+
+def add_me_too(msg: EmailMessage) -> None:
+    """Cc ourselves on *msg* when b4.send-me-too is enabled.
+
+    Nothing is added if we are already among the To or Cc recipients.
+    """
+    if not get_send_me_too():
+        return
+    usercfg = get_user_config()
+    myname = str(usercfg.get('name', ''))
+    myemail = str(usercfg.get('email', ''))
+    if not myemail:
+        return
+    recipients = email.utils.getaddresses(
+        [str(x) for x in msg.get_all('to', []) + msg.get_all('cc', [])]
+    )
+    if myemail.lower() in {x[1].lower() for x in recipients}:
+        return
+    ccs = [str(x) for x in msg.get_all('cc', []) if str(x).strip()]
+    ccs.append(format_addrs([(myname, myemail)], clean=False))
+    del msg['Cc']
+    msg['Cc'] = ', '.join(ccs)
+
+
 def cleanup_email_addrs(
     addresses: List[Tuple[str, str]], excludes: Set[str], gitdir: Optional[str]
 ) -> List[Tuple[str, str]]:
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 2441badbb288..71d5e1cc5516 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -3334,8 +3334,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                 ccdests.append(btr.addr)
 
         excludes = b4.get_excluded_addrs()
-        conf_me_too = str(config.get('send-me-too', 'yes')).lower()
-        if cmdargs.not_me_too or conf_me_too in {'no', 'n', 'false', '0'}:
+        if cmdargs.not_me_too or not b4.get_send_me_too():
             excludes.add(myemail)
 
     tos: Set[str] = set()
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index b69a7f094bc7..55a042d8d1be 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3891,6 +3891,7 @@ def _build_review_email(
         msg['To'] = b4.format_addrs(deduped_to, clean=False)
         if deduped_cc:
             msg['Cc'] = b4.format_addrs(deduped_cc, clean=False)
+        b4.add_me_too(msg)
     if header_info.get('bcc'):
         msg['Bcc'] = header_info['bcc']
     msg['In-Reply-To'] = f'<{header_info["msgid"]}>'
diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 0926cbd471d1..b3132d7f3c43 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -958,6 +958,7 @@ class LiteThreadScreen(ModalScreen[None]):
         lmsg = node.lmsg
         text = prepare_followup_reply_body(text)
         msg = lmsg.make_reply(text)
+        b4.add_me_too(msg)
         try:
             with self.app.suspend():
                 smtp, fromaddr = b4.get_smtp(dryrun=self._email_dryrun)
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 0abf9b61a6f2..787d28b679a2 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -633,6 +633,7 @@ class FollowupReplyPreviewScreen(ModalScreen[Optional[str]]):
     def on_mount(self) -> None:
         body = prepare_followup_reply_body(self._reply_text)
         msg = self._entry['lmsg'].make_reply(body)
+        b4.add_me_too(msg)
         viewer = self.query_one('#followup-preview-viewer', RichLog)
         _render_email_to_viewer(viewer, msg, ts=resolve_styles(self.app))
 
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 1e70bc609778..fcb168d49208 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1897,6 +1897,7 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         """Build and immediately send a quick reply to a follow-up message."""
         reply_text = prepare_followup_reply_body(text)
         msg = entry['lmsg'].make_reply(reply_text)
+        b4.add_me_too(msg)
         try:
             with self.suspend():
                 smtp, fromaddr = b4.get_smtp(dryrun=self._email_dryrun)
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 714f215fc475..df20225f8fe2 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -5183,7 +5183,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         # Build a minimal cmdargs for ty.generate_am_thanks / make_reply
         cmdargs = argparse.Namespace()
-        cmdargs.metoo = False
+        cmdargs.metoo = b4.get_send_me_too()
         cmdargs.since = None
 
         try:

-- 
2.56.0

