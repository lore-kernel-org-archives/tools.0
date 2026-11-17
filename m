Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933892;
	b=1LstI3iRH2hXuwO5Q5MH6IpvkbM5epcySC7SUTv+nvxMV5+hcvPpJLV310JbnrqNrz6g
	 M6+3l9mKgiOIlJpEYQkGZvq8G0uDl6kR4pw5ikOpkRVa1Su4J5lzrcmHIl4OZs0ICuMxS
	 54zXuQGeMiZ5aooxnw8qw5gjUQIHNw0uuOoC38lhQGGYh6xQ3o8xRXIIkqTwQ1nn4CcpL
	 HsWObDmS78cGWmz9EuKD8UPCfYErUcS4sOhpjpBC9xSyldFylPkXxDdHBLtqooVgVtZ9m
	 O1ucqnDfx7Ll1IxPuVdIuAbAE77FiZofjXDnPIybiI3dWpvlbKNpmeu0naTiPQnnuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933892;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=m364OQsmPaGEETXW3OLgcP3Aj4AVuJGcNzmiAQKT7BY=;
	b=vnjtNXaOFpGYmqF4r7KLNnohw8KXkwVv4PFRUt/OhplSKi7JNEZXFXM2oqhJq/z2zOKf
	 /Iu3uzMrStBeDfHlBQoSDfHnSzY7o6BZFKeOTeeJXmFzVoQ2mEloC16puAAG7SqCvBw9N
	 RC3bNNsUw5T19JzBpYxZ9O67GNWrXK+GqmK5xFM6b1ZSmx1assqxy7+FeCaiayIZwQjX0
	 d3adAiE/F7HGvzMY0FiMcnSmxTcTvdRuOtx12kbkQRcIOnNhBoxVwOU7Fd94+XhOFmT87
	 TYCvuWu1PqhQtBxW3IlmlfOAEjzvj6cNM0FhtZGF2+ltdmyrUVMXKIRVGHRXPYM15Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mi+XEh5A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAAD606A31C
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 16:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mi+XEh5A
Received: by smtp.kernel.org (Postfix)
	id 8D0BA1F000CC; Tue, 17 Nov 2026 16:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3531F000C6;
	Tue, 17 Nov 2026 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933892;
	bh=m364OQsmPaGEETXW3OLgcP3Aj4AVuJGcNzmiAQKT7BY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Mi+XEh5ADYA2PVGVzb51H5W0AzGg3QbkVVXaZXyZ8UBLTMierzTPcgyr8q4o7vvo/
	 +wumB8hiq2JmV8Hf+qiPcXxLV4JDskdYfNTAuB6HzPnx4/tMWBEPOJn/KACAKWYTQ9
	 A03AOCXdfZHvMqRsOgAMlP8UYsXE0eO9YUMJvafNuHd5hrfTD4EnTfJjTEdUOuEUgG
	 ewMqSliS0aOEKOMreEqBbRt93VGIEHoZjno+M6+NGh0CYjNJhMBq6XZhgSUFxtYj3Q
	 KvrxVXr+eAFPTUaa27utsMSAxopZB+fTkmQEQTzBpn9TjFXJDYzis3cBorUa+T1qnS
	 vYZOTMH5dWuMg==
From: Brian Masney <masneyb@kernel.org>
Date: Tue, 17 Nov 2026 11:44:40 -0500
Subject: [PATCH b4 1/2] correctly walk a series when a message is missing
 from the lore archive
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
Message-Id: <20261117-lore-missing-msg-id-fix-v1-1-a5d13a11eb10@kernel.org>
References: <20261117-lore-missing-msg-id-fix-v1-0-a5d13a11eb10@kernel.org>
In-Reply-To: <20261117-lore-missing-msg-id-fix-v1-0-a5d13a11eb10@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-f88af
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=2mb8Th74BYo43/ksD7kLTncqvmScwjVp0cL52Xq5Oj4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+tNRv3PntjdzFdbXzBYXj7cMu1h4yTOEOdBSxTl0mt
 mqx8OySjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZybAojw/rWszs3tp56Ieiw
 fdKCWWymIu/f9j4Q0GSMYd0vKTtBUJeRofnb7YLWD+deHhI0F/zw6GvxjsdL+k478+zec3jflmT
 WBCYA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

When a parent message does not make it's way into the lore archive, walk
the references to look for the closet ancestor that is available to
allow parsing what all is available.

A practical effect of this bug is that it can cause a trailer that
someone left will not be picked up. For example, look at the thread
linked below and it shows the message from Brian with ID
avXhA9mJL0EIcm_0@x1g10 is missing from the lore archive. This causes
the Reviewed-by from Jerome that is in the archive to not be picked
up when 'git am' is used. With this change, the trailer is picked up
as expected.

Let's also add a test case for this scenario.

Link: https://lore.kernel.org/linux-clk/20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com/
Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/b4/__init__.py         | 15 +++++++++++++++
 src/tests/test___init__.py | 31 +++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 1ea899c35fa9..e2c1b617a609 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -643,6 +643,21 @@ class LoreMailbox:
                         break
             elif (pmsg := self.msgid_map.get(fmsg.in_reply_to)) is not None:
                 logger.debug('Found in-reply-to %s in msgid_map', fmsg.in_reply_to)
+            else:
+                # The parent never made it into the thread (e.g. it is
+                # missing from the archive), so use the closest ancestor
+                # from References that we do have
+                for refid in reversed(fmsg.references):
+                    if (
+                        refid not in (fmsg.msgid, fmsg.in_reply_to)
+                        and (pmsg := self.msgid_map.get(refid)) is not None
+                    ):
+                        logger.debug(
+                            'Missing in-reply-to %s, using references entry %s',
+                            fmsg.in_reply_to,
+                            refid,
+                        )
+                        break
             if pmsg is None:
                 # Can't find the message we're replying to here
                 continue
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 8b041340e9e5..50ba2928e64e 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -539,6 +539,37 @@ def test_get_series_twice_adds_no_duplicate_trailers(
     assert _followup_trailer_keys(again) == before
 
 
+def test_followup_with_missing_parent_uses_references(sampledir: str) -> None:
+    """A reply whose In-Reply-To parent is absent from the thread still
+    has its trailers attached via the closest known References entry."""
+    lmbx = b4.LoreMailbox()
+    for msg in b4.get_msgs_from_mailbox_or_maildir(
+        f'{sampledir}/trailers-followup-with-cover.mbox'
+    ):
+        lmbx.add_message(msg)
+    reply = email.message.EmailMessage()
+    reply['From'] = 'Missing Parent <missing.parent@example.com>'
+    reply['Subject'] = 'Re: [PATCH v2 2/2] Simple test 2'
+    reply['Date'] = 'Tue, 30 Aug 2022 11:19:07 -0400'
+    reply['Message-Id'] = '<late-reply@example.com>'
+    reply['In-Reply-To'] = '<not-in-archive@example.com>'
+    reply['References'] = (
+        '<cover-message@example.com> <patch-2-message@example.com> '
+        '<not-in-archive@example.com>'
+    )
+    reply.set_content(
+        'Agreed.\n\nReviewed-by: Missing Parent <missing.parent@example.com>\n'
+    )
+    lmbx.add_message(reply)
+    lser = lmbx.get_series()
+    assert lser is not None
+    patch2 = lser.patches[2]
+    assert patch2 is not None
+    assert ('Reviewed-by', 'Missing Parent <missing.parent@example.com>') in [
+        (t.name, t.value) for t in patch2.followup_trailers
+    ]
+
+
 def test_same_trailer_in_two_replies_is_kept_twice(sampledir: str) -> None:
     """Only a repeat from the same message is a duplicate, not a second reply."""
     msgs = b4.get_msgs_from_mailbox_or_maildir(

-- 
2.56.1

