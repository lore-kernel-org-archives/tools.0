Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864158;
	b=Nxwo02ZrGjO73tXjo9YDvx87s7eEGYuydDoe5CDD5OFY+SeE5KcLDScFbrNQx7qAJF1M
	 /skJskQ/lI9Z6CmuESOjgYptizD162+uqRoBmBLvW4PQodt6KMFKpozHe7poaBHouKOU9
	 xf1STNsPQxU7D8TpGyfnQkBscqfdAU6hazMcVKmHyWnH88ZUGABRZLxT9tw72OLPwIjdB
	 XDCQ1m9dLEk/Yepyf2GIKhBBoOjbPdoy6EgSA1jvta2ok6rI9I94U822DrdOg4I6EKrS1
	 iYo5QZzU4subU215Iov0iZyILgLW+21e5CdtnJ4+idwJe8tuP25PKqixDHX8m0oty7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864158;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cCIYUOSo5xqjwiqwkxkwMjbOgH0Ex98Wr6+S1208l68=;
	b=zWdKDOhdbv4lh+U80PEFgDC4UOi1s2id6fHv0NWo7j6XLqAdhSnE6gndVAG8e+6FF7IK
	 glIsNNtU0ltQaMAfSs5ugR8UAe5dNF/XrcBr1avgvnNUTIMHzzhoejCrjC5yNtYvYRUUp
	 ghJu/HbSMhQLlIFP6qzTkYCBsS7CXwM2z+oJB3uHHU5iq4nUrdaiPElurqeKYdlKGHrXV
	 9sLWK9tcuRGwBxgSs4zAX1i55+jCssYZu59++ZIR6+NCetw0GeiHrqAww9lz8TG6xErPg
	 v8H2iLns7qj6oXjVRhKjYWtCLeDCUH528A0M2Rtkgn+o6xsuULhRwp1cV+xtNf13XUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VB9Q4Lfp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E16606A323
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VB9Q4Lfp
Received: by smtp.kernel.org (Postfix)
	id A44261F000CE; Mon, 16 Nov 2026 21:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC911F000C4;
	Mon, 16 Nov 2026 21:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864158;
	bh=cCIYUOSo5xqjwiqwkxkwMjbOgH0Ex98Wr6+S1208l68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VB9Q4Lfp6FyINV6D8SDwAdeHfGeds16Gzs7E5WNLCYC0hLey/FthD1HAZRRmmkpUw
	 Si3AJMgoQwZv8xZugP8FqTNGcw8tpzhi1D8zcZrjPc/Vd6COeWRcKmQRKxbJLpCLwa
	 Zd/0Z1SNLwJDHOxVT45c0j4nLHKU7dxkDyNNr52o0MDcanbv2bilOL3fUhkpQHkwwk
	 4HOAsyKtSQLzvB4Mcrdq3ZyKFKrvHLale/evG+79+eWJJD5lPcnUc/YFXDe3rolLL/
	 SOPIvzGJhe+FsytPcSfzy4sYHl7KnUgcwSR4zxnwaKIS4ZCqIljr2UKzSER0S26EnC
	 lKsJ6TfeG4iHg==
From: Brian Masney <masneyb@kernel.org>
Date: Mon, 16 Nov 2026 16:22:27 -0500
Subject: [PATCH b4 v2 1/2] review / ty: add support for b4.send-me-too
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
Message-Id: <20261116-review-send-me-too-v2-1-3e1e305e3272@kernel.org>
References: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
In-Reply-To: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-de01b
X-Developer-Signature: v=1; a=openpgp-sha256; l=8229; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=WOsF9hQ5hXo0+WUjF0qn+x+oLlDM3k/KyO/10h9iYyg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+l0ik56tultm0QMIn+kRzyJvV967+n1BtfNHn2P2Y2
 bG6Z1KyOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI12qGf/YZm9KEczPlg/95
 /9+805hbIrzrz/QAp5Vbry9P441wucrw37/7UFLaUeGvvMLuZgFCazJm/vDObC1ZMcH+x14Jj6f
 WzAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The contributor side of b4 already has support for the configuration
option b4.send-me-too to make sure to include your email address on any
outbound emails. Let's go ahead and extend this to also work with the
review and ty sides of b4.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 docs/config.rst                    |  4 +++-
 docs/releases.rst                  |  3 ++-
 src/b4/__init__.py                 | 40 ++++++++++++++++++++++++++++++++++++++
 src/b4/ez.py                       |  3 +--
 src/b4/review/_review.py           |  1 +
 src/b4/review_tui/_lite_app.py     |  1 +
 src/b4/review_tui/_modals.py       |  1 +
 src/b4/review_tui/_review_app.py   |  1 +
 src/b4/review_tui/_tracking_app.py |  2 +-
 src/b4/ty.py                       |  8 +++++++-
 10 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 593129e8ae70..182ca9353c01 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -1150,7 +1150,9 @@ Contributor-oriented settings
 
    :term:`b4.send-me-too`
      Instructs b4 to include your own address when sending. Set by default,
-     use ``no`` to suppress sending to yourself.
+     use ``no`` to suppress sending to yourself. This applies to patches
+     sent with ``b4 send``, to thank-you notes sent with ``b4 ty``, and to
+     replies from ``b4 review``.
 
      Default: ``yes``
 
diff --git a/docs/releases.rst b/docs/releases.rst
index 2b16efb72d7a..14606804d1ea 100644
--- a/docs/releases.rst
+++ b/docs/releases.rst
@@ -350,7 +350,8 @@ New configuration options
 
 ``b4.send-me-too``
   Set to ``no`` to suppress including your own address in the ``Cc``
-  when sending patches with ``b4 send``. Defaults to ``yes`` (include
+  when sending patches with ``b4 send``, thank-you notes with ``b4 ty``,
+  and to replies from ``b4 review``.  Defaults to ``yes`` (include
   yourself).
 
 **In-tree ``.b4-config`` changes**
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 704ddec9b5c6..2a2247eb6ad0 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6684,6 +6684,46 @@ def get_excluded_addrs() -> Set[str]:
     return excludes
 
 
+def get_send_me_too() -> bool:
+    """Whether b4.send-me-too asks us to include ourselves as a recipient."""
+    config = get_main_config()
+    conf_me_too = str(config.get('send-me-too', 'yes')).lower()
+    return conf_me_too not in {'no', 'n', 'false', '0'}
+
+
+def add_me_too(
+    msg: EmailMessage,
+    enabled: Optional[bool] = None,
+    me: Optional[Tuple[str, str]] = None,
+) -> None:
+    """Cc ourselves on *msg* when b4.send-me-too is enabled.
+
+    *enabled* overrides the b4.send-me-too setting when not None, e.g. for
+    an explicit command-line flag. *me* is the (name, email) to Cc, and
+    defaults to the user's configured identity. Nothing is added if we are
+    already among the To or Cc recipients.
+    """
+    if enabled is None:
+        enabled = get_send_me_too()
+    if not enabled:
+        return
+    if me is None:
+        usercfg = get_user_config()
+        me = (str(usercfg.get('name', '')), str(usercfg.get('email', '')))
+    myname, myemail = me
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
diff --git a/src/b4/ty.py b/src/b4/ty.py
index ec5b226b494f..4da074f00c84 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -105,7 +105,8 @@ def make_reply(
     )
 
     # Exclude ourselves and original sender from allto or allcc
-    if not cmdargs.metoo:
+    metoo = cmdargs.metoo or b4.get_send_me_too()
+    if not metoo:
         excludes.add(jsondata['myemail'])
     excludes.add(jsondata['fromemail'])
     allto = b4.cleanup_email_addrs(
@@ -121,6 +122,11 @@ def make_reply(
     msg.add_header('To', b4.format_addrs(allto))
     if allcc:
         msg.add_header('Cc', b4.format_addrs(allcc))
+    b4.add_me_too(
+        msg,
+        enabled=metoo,
+        me=(str(jsondata['myname']), jsondata['myemail']),
+    )
     msg['In-Reply-To'] = '<%s>' % jsondata['msgid']
     if isinstance(jsondata['references'], list) and len(jsondata['references']):
         msg['References'] = '%s <%s>' % (jsondata['references'], jsondata['msgid'])

-- 
2.56.1

