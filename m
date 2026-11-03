Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716190;
	b=nGCYgIXQ0J4uSOw13dyylqGXkinDp7Us0Ht5wiCCXj3St6EXS8B8gSZUiqUi/m90fJkn
	 oHygBtNKNbzMmBREk0Km2EyaJxtQ6RQDuieuITYObLxlvh9MMFg5FEwx1MRe7hlKLYJ7a
	 3FbKQxw6R7ru2o2SPdSN/AT5IQvP5wDdhFMdpaqwkQENPYvdFiwEd0ENWNqxvGrTH/tkt
	 rri2iUTLRkdOHDOsliEs7grF085rv/hodyzKjz4bBxVYEDcgrzhDV72Se03nQBQhJRtyN
	 3XLp5UhM5YfJ6Snr/c9XgPiDpPniStcjSpgWqysh+AS1PtoOuJKfQiXKeRzwwCQgK1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716190;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/XTVW+QspNBUo8ftt3fK5+ngUwmq3JjZpipDWuzoaXk=;
	b=BcJTLqBCzcdgqwMzAq4ox3/l46cIc2BP4CpESOb7jweRCkklZDE9PWVGXb3HS88z8pFJ
	 MwAkbgm4eXJoiRC4iMpNs9M0RYPSB0tf/gFHyyQVAxb+TMoMl7FqJ9o31MzhSS97KXLt1
	 ez6X/N7BargNe109pCpK7hsobXpb5IVgY+bQvh6xmiTOl+Xyux26Pyv5kkWbCMY7KzIAA
	 E+Q8uWYi49AqOn3WqO0zFAWIVh+wSPp+OZ6p+uEfkVhVBpKLhDcp0bUHwOoZahBAuuHu1
	 4Er2U4eQJrrMyzTKOiJNK+B+e1kjq8uUnJctp6wL2h53VdSeoezYjPxo0nPgU2VQGzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUSKjLin;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07813606A326
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUSKjLin
Received: by smtp.kernel.org (Postfix)
	id EDC6A1F00919; Tue,  3 Nov 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793716189;
	b=KwMPYPEepeo/nJwNmtUeH81GGoXwVCRBiPh4M5vDvXzSlvg6NjZjUxPR8axAMqkuxu4P
	 PeRPJbC0/E8cJEZq++3gr2Z2hmPPxkJ8E/PDVwFo+rLxZH1TcB10tzeaY/FCv0dN6gVp0
	 7Q3tw+XVLJzPYsWb7bUdWpBuYhmNXQTBOzVZwU8qBpJuIrcsId0Nf/N26Cu289aND8zaA
	 7jB+HqwXagX8xJEPatgjaXtYwfLfdHfFMQ6ffnNVXpCQPPUyUvGhwwwy6bwcedg9aP9p7
	 TigTapPyIBaEcmyl7EC/4Sr2ttYN4Cw12Gjo7xQMtPUDWxrs7AHpaL9aQpHTOHIfMZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793716189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/XTVW+QspNBUo8ftt3fK5+ngUwmq3JjZpipDWuzoaXk=;
	b=Kq/BNldYmmToCA0h4Amp3XQK4rnRtDpJfTngBX336X3G36MotsdRjpK53B7xLkahNW16
	 TlWLmO+u+SN1bZKVzhZSdh/WzhRalfddF+Gv4ozuj4fz9kwxvkaC/lUgQ/xn3CRfamQ6a
	 FHRCnfYlbrLEp3p2nZfXIyTr7gLJRV69ti5XXiQsZEffNNPRaHoXC/GGsSRABWxBBHrI4
	 4IYy9b2tVWPbJ90Tud46eoQg+LpBG0xDfTc/pxGN3YybmRuRkutKev8ZN9NdzhFBWmlvL
	 QdxWXnlZpAO80H466g456sCwpa4SWNV84eQmC4BJgs3Wq8AiUx0GO/LLQtIACTlojHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUSKjLin;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 232BE1F00A1C
	for <tools@kernel.org>; Tue,  3 Nov 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUSKjLin
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 232BE1F00A1C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so43155785e9.0
        for <tools@kernel.org>; Tue, 03 Nov 2026 06:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716187; x=1794320987; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XTVW+QspNBUo8ftt3fK5+ngUwmq3JjZpipDWuzoaXk=;
        b=sUSKjLinGS3lYWDPBP3eTObb47PPyQ+rUIMyDHwwVvxmeg2s11XTOog35KjqEqaRag
         SvQf6V1mwZE+7C9pjOxkKfsKjqWDcGLiB45noA4Hbr4vHrl5wz/3Ee7NwdCuIITALpUW
         TBbt0tTI2T6CyL3+h4WTGk4C+4OwaB76ZMkoCP0PJaCOmiUTk3wWtsOGF1qBeq4W3sYc
         YEXSqZ+BwrYo7xS7bHnn/0gUFN5pdZdg8i7du7gXEuOUNZ9qco3EUng4sdXMlSQLZxV/
         pcxz6yNxuPzelBpG04pmewBOZhVJa8pXEsTM25WUfHHw70t5FZEvqV7N4PXR/QVCWTZ7
         /WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716187; x=1794320987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XTVW+QspNBUo8ftt3fK5+ngUwmq3JjZpipDWuzoaXk=;
        b=vg9+/3Zpw7jT8CDiXRdjcTxt6kb6qXInvB3pXdhmjHFCn1QY13sAcy1w2A7kF2xu6p
         7RlqmZYNkPCkBJiV3oSa9S6Jte8W/irC+nR8RSyR06gZ1OKt8NaoJxBWyNJ46gcmCrUp
         bhkqY8LDofN3EpUy3soN/J8rf+sW8y6CNnpNDv6eBvQW0V4HNLEbv7ONGZll+c5twLDz
         IpFc+JHYYQIusMqSb5bGuPkcuIh0OUbQDBukyClilgU9OmCNaJWd59v+LTurSmx0mgQH
         KZDVvyjNcXD4lCe4STtTvOH3VFdMpuYxcqTP5uyUVQGnRChH0MUvB/s5h69K5wYJi7r5
         aERA==
X-Gm-Message-State: APuU4Z8SpU4yktQjam9CuVV9ybUw4mfEPoymSWqoaME8UqTVM2cdGDdv
	5fbzzu3Vf9NuSE06JSFp3mkO7rAP6HKdinP3F6KgfKLzD2Y+CZXye5KO2uVlgyAs
X-Gm-Gg: AYBFou1e1NA5+lY84NBNi4W84hD4mCOHsllmj0/VrHdGq8WJUwFia9eqT/aG5FwEw7F
	1rENsg3HX60W6ZIiiiHjNwAA8Glk20rhaFDagqCA7WtRyLg1OgEj3E/bm5pkT+YvfwsvG78kfIg
	hxu5G/7zZQMXArDZqoTY9rcNBwTTeVK04hPSl/1FpOsv7bs5/emcWTeuh5elD4rKn6yVmjWL+ma
	0z9CH+B6Da2p2QWAihocEusESaQiaxY0d88W5EXF2OVT/rNYrnT/wQ98S75kUso+p9ib2tz91G2
	Je/7lyFMFvV5nmGNoVgr9RF68snjZrzbGEqD+lIVFsysDbnWcu1VenKB6fN5KugGRTJq9UcQbDu
	X2M2h1upSa+Fd4qp4FP84HKoiwllcL5VoIzKNNravMoaBV4/mWLu4nEfg1auVn5mbdJvQUl1jOI
	w0LNPkP640HIKNt/ie0vF4EWFhfQ75zinTGRSF07a71HnVN3s0vzbVskVCTMyYWE1ohgGbhWcUY
	Us8kZH7GB6bSobK6dpVuOAIRIn7vvCNzG0DAbBkUNtHmeLXVRkeSXt+DXXocGTElk5rNOnGzzu2
	k1kHBiPr7/qqPsBCSdIeGdhsRXZ+ENReDALDKM+P+Jk5ttXvUdaabsNNiHYWOmSSXnk=
X-Received: by 2002:a05:600c:6087:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ac1765ce52mr293072815e9.20.1793716187251;
        Tue, 03 Nov 2026 06:29:47 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm65290805e9.11.2026.11.03.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:29:46 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 15:29:36 +0100
Subject: [PATCH b4 3/5] review: Add shared tracking using
 track_series_from_msgid()
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
Message-Id: <20261103-browse-and-track-series-v1-3-d9c9306f4033@gmail.com>
References: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
In-Reply-To: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793716179; l=6670;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=gV8UvDW+O5zaUdt6u1rAiRbdZwj4x+JDnNockiobT98=;
 b=JvO0CJLieNMPcXndlE88L1xVnq7NLFqkSKQ0MDnfqwXZQybslUBucY3o50Fo4c1YHY8FQcTto
 EMrY82J/89DD4+lahU/RraKLEQ0kWSibHiacVvwvv/u3UbLiduY8WQs
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Add track_series_from_msgid() to wrap track_series_from_mailbox()

Assisted-by: LLM [codegen, tests]
Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 src/b4/review/tracking.py         | 47 ++++++++++++++++++++++++++--
 src/tests/test_review_tracking.py | 66 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 61f7330..d4d2f51 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -686,13 +686,53 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
         sys.exit(1)
 
 
+def track_series_from_msgid(
+    identifier: str, message_id: str, topdir: Optional[str] = None
+) -> Dict[str, str]:
+    """Retrieve and track a series without installing command-line signal handlers."""
+    cmdargs = argparse.Namespace(
+        msgid=message_id,
+        no_stdin=True,
+        localmbox=None,
+        nocache=True,
+        noparent=False,
+        wantname=None,
+        wantver=None,
+    )
+    _, msgs = b4.retrieve_messages(cmdargs)
+    if not msgs:
+        raise LookupError(f'Could not retrieve series: {message_id}')
+
+    lmbx = b4.LoreMailbox()
+    for msg in msgs:
+        lmbx.add_message(msg)
+    if not lmbx.series:
+        raise LookupError('No series found in retrieved messages')
+    wanted_ver = max(lmbx.series)
+
+    if b4.can_network:
+        msgs = b4.mbox.get_extra_series(msgs, direction=1, nocache=True)
+        if wanted_ver > 1:
+            msgs = b4.mbox.get_extra_series(
+                msgs, direction=-1, wantvers=list(range(1, wanted_ver)), nocache=True
+            )
+        lmbx = b4.LoreMailbox()
+        for msg in msgs:
+            lmbx.add_message(msg)
+
+    return track_series_from_mailbox(
+        identifier, lmbx, wanted_ver, topdir, allow_existing=True
+    )
+
+
 def track_series_from_mailbox(
     identifier: str,
     lmbx: 'b4.LoreMailbox',
     wanted_ver: int,
     topdir: Optional[str] = None,
     was_rethreaded: bool = False,
-) -> None:
+    allow_existing: bool = False,
+) -> Dict[str, str]:
     """Track a series from a LoreMailbox, given the desired version and project identifier."""
     lser = lmbx.get_series(wanted_ver, sloppytrailers=False, codereview_trailers=False)
     if not lser:
@@ -803,7 +843,9 @@ def track_series_from_mailbox(
                 logger.info(
                     '  Upgrade the series in the review TUI to the new version.'
                 )
-            return
+            return {'status': 'updated', 'change_id': existing_change_id}
+        if allow_existing:
+            return {'status': 'already-tracked', 'change_id': existing_change_id}
         raise LookupError(
             f'This series is already tracked (status: {status_str}, v{cur_rev})'
             f' as {existing_change_id}.\n'
@@ -859,6 +901,7 @@ def track_series_from_mailbox(
             num_patches,
             ', '.join(missing),
         )
+    return {'status': 'tracked', 'change_id': change_id}
 
 
 def cmd_forget(cmdargs: argparse.Namespace) -> None:
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 349b89d..ab1f3d3 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -685,6 +685,52 @@ class TestCmdTrack:
         assert row[column] == expected
         assert row['revision'] == 1
 
+    @mock.patch('b4.retrieve_messages')
+    @mock.patch('b4.LoreMailbox')
+    def test_track_series_from_msgid_uses_shared_tracking_logic(
+        self,
+        mock_mailbox_class: mock.Mock,
+        mock_retrieve: mock.Mock,
+        gitdir: str,
+        monkeypatch: pytest.MonkeyPatch,
+    ) -> None:
+        """Verify track_series_from_msgid() provides shared tracking logic."""
+        cmdargs_enroll = argparse.Namespace(
+            repo_path=gitdir, identifier='track-msgid-test'
+        )
+        review_tracking.cmd_enroll(cmdargs_enroll)
+        monkeypatch.setattr(b4, 'can_network', False)
+        mock_retrieve.return_value = ('cover@example.com', [mock.Mock()])
+
+        lser = self._make_mock_lore_series(
+            expected=1,
+            all_patches_present=True,
+            cover_msgid='cover@example.com',
+            first_patch_msgid='patch@example.com',
+        )
+        mailbox = mock.Mock()
+        mailbox.series = {1: lser}
+        mailbox.get_series.return_value = lser
+        mock_mailbox_class.return_value = mailbox
+
+        result = review_tracking.track_series_from_msgid(
+            'track-msgid-test', 'cover@example.com', gitdir
+        )
+
+        assert result['status'] == 'tracked'
+        assert result['change_id'] == 'test-change-id'
+        retrieve_args = mock_retrieve.call_args.args[0]
+        assert retrieve_args.msgid == 'cover@example.com'
+        conn = review_tracking.get_db('track-msgid-test')
+        row = conn.execute('SELECT message_id, revision FROM series').fetchone()
+        conn.close()
+        assert row['message_id'] == 'cover@example.com'
+        assert row['revision'] == 1
+        again = review_tracking.track_series_from_msgid(
+            'track-msgid-test', 'cover@example.com', gitdir
+        )
+        assert again == {'status': 'already-tracked', 'change_id': 'test-change-id'}
+
     @pytest.mark.parametrize(
         'all_present,expect_warning',
         [
@@ -829,6 +875,26 @@ class TestCmdTrack:
         conn.close()
         assert revs == {2, 3}, f'expected v2+v3 under one change-id, got {revs}'
 
+        v4 = self._make_mock_lore_series(
+            revision=4, change_id=None, cover_msgid='v4-cover@example.com'
+        )
+        v4.fingerprint = 'c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3'
+        mbx_v4 = mock.Mock()
+        mbx_v4.series = {2: v2, 3: v3, 4: v4}
+        mbx_v4.get_series.return_value = v4
+        mock_mailbox_class.return_value = mbx_v4
+
+        result = review_tracking.track_series_from_msgid(
+            'upgrade-test', 'v4-cover@example.com', gitdir
+        )
+        assert result == {'status': 'updated', 'change_id': change_id}
+        conn = review_tracking.get_db('upgrade-test')
+        revs = {
+            row['revision'] for row in review_tracking.get_revisions(conn, change_id)
+        }
+        conn.close()
+        assert revs == {2, 3, 4}
+
     def _track(self, series_id: str, identifier: str) -> None:
         review_tracking.cmd_track(
             argparse.Namespace(

-- 
2.43.0

