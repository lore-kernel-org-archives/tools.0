Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D539CD1B
	for <tools@linux.kernel.org>; Mon, 12 Oct 2026 05:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784725; cv=pass; b=py/0qwOWVbCP57bP3nD1sIeG4nZBBH++IjrR1IAAbsE/+6aBj3MYaw7Gi6VQQCCR7UThf2Qgj6q6rsVQyyEXhR6iDHpoteQFQRxtI6Hluxosns4DZtWpsIQ/ZKXODaExjc3NO5R5iazHajPovpqxxUN3JCvZ6+ij9N803ROcCtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784725; c=relaxed/simple;
	bh=67EDo6uG1OK09tnHtlEPRcr2a4j5SIJGz35Sh7p6erk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSUqPAXXnW3wy1WPvrss8+MQ3Quiuag+t6/ZRjphtRWwLhviyvdfszdGCDpnN+Hj8ua1GhAoMyigT/tOFrFpU2xiOnhU4uVbgt396LjmsuabUHvX7TlW5yM7TL3b+fuhCKw68OpH1Uy7Epcg9o+mlbkpIe4hLZldsWaeGcPlo5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSy7nUMn; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSy7nUMn"
Received: by smtp.kernel.org (Postfix)
	id 3CA321F0089D; Mon, 12 Oct 2026 05:58:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791784724;
	b=ZQHudqPEoldQm//0RKq4SxsbiHZw9raPdS3aZlO2YezBuGTpY28Vl4PE75u203DRwFco
	 +PAX/LduG4P0XTLD4dHQIK858IWH2rwPMiUrsXzIfFmDN2X/cq6nwWSK3wYBe5QM2gIcg
	 OVBwjLwwgzOwD0qkWE6CA9HE/Ci4UC3YzRYLALUz6QOOdcu0pn0A6EibkKmhlGownTbw5
	 coP5CR3OcKWqQCcwPOReyGNul5Yb5zMl10nu1zsDXVUPMO1L3+4qjpSK2SZDGUHIx6iBJ
	 26wTg/Z4MqFJjQnA7rbBeqIpJd80ah2G6cuJzAahgiAHS6vQW/pgPJbgFDuoClJcuaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791784724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ER6i/RNgSdkh/+bfDeZBuBFVivziUePc+xaxZCnVpgI=;
	b=1XaLoJBRjxo2duKM59PeaxNYJjM+yoO6vT1gGXmfFud7jPyq1+ZrJAvgoF6JgOJ6/ULd
	 GWZ4ioZC6LHztwzbAxXNO8FikXNMgCV9oeQ/pgwlsegvsBCj7GLhd4cLh40eRnTTCkuXD
	 jQUInPK2pdk2jMR8ehaHpVvSjT3WEHaE6U8STmIv/6SZUIsCteLG2iCyuo/p7Bnlvav+f
	 78I37T4v8ploVmSxaTx2WaMnJInCUE5RR7aQfeWWaB2Iq7sRW4h+RNoq/fQBGyX+LqSpu
	 qTnxQrkjyCJb5DJj+Gc2rU2trc9iQ29n9M/g6fYEEijoabup8CQ0AIVCilHt3Uiuf8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FSy7nUMn;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EC481F0089B
	for <tools@kernel.org>; Mon, 12 Oct 2026 05:58:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FSy7nUMn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8EC481F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2577511eec.0
        for <tools@kernel.org>; Sun, 11 Oct 2026 22:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784723; x=1792389523; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ER6i/RNgSdkh/+bfDeZBuBFVivziUePc+xaxZCnVpgI=;
        b=FSy7nUMn19HhFAbtoLSNEv9ObimJYbi1scE3EO7KxeU3r4pnC1CzQzpIVx2dJ2xru9
         zveC/4ES5TFsUmHfyLPs5nRRqSqO2/b31TscWUSEkUNtnH8XqK5pPGxkD5QxX1pg6w3I
         nm6ciPpDBUqoKY/Aba8AKAaYKiqaFXYhgcXU5Vsv6pY3r6+Ggh2wTBqa33V9MY5JcNme
         42i7si6rS178F2XL1Y6mHrSNT6NkGsD/pGCzcJUhnVUC//2IouQfWUy009V3iGy1JUYP
         r1Un2D27fCx5vnWQzL272EawttohrrHo+8YnY+dOcazB5WDFLEDU2N6vGa/PX3kFNlWE
         gZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784723; x=1792389523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ER6i/RNgSdkh/+bfDeZBuBFVivziUePc+xaxZCnVpgI=;
        b=t+Dq0qljt0c9Q7UDrM6QYtwrF6wom8j1p0JeVjKz4JtPEPetcnwYMSQ9yUH3zG0X2e
         DkFYlRgtApgnDPkE9yskUityqV3UuPCdDB2owOyDsKM/D1K5ITL9fS5VHdu9KgD9IYSE
         Mszwn55tm7cSWShRdayAn503m41j16Ejil+FvFFPAZmSC6Wi6DSNK/LvkGuUOukMY6Fh
         WoclI2CFg/3eSgPyJtjKFmo+RmXF9pUaF98LKunuEFzQi93svY62zOhWiLH8dqI7H/K9
         f/+guTsgRqPkKgRLpdv3uO7fzGKPsIkZEIW92hRDTar0GylXYIgLFkhozRlQd+5q1qoj
         gNwQ==
X-Gm-Message-State: AFq9FYKXTm6CQ8dmg6L3PCgjfOBj6ieUtEoTZKtWiEDk8TtAn5N2f6+D
	5pj1XFN+/umPtPnBYylSPGRxFZA24DEPO/yY8n7f8JZX7RepHPvYTXF9
X-Gm-Gg: AYBFou30ERMNy3OCawG0ZrYu4YMPbOB0VLZ488gsnpHAJRyYaYWWApoT5fTXz6W+MRk
	Gc31PEtpcgKGDNDnMpEd1ELHwppOaZAg13lEAkzP4FSus1iv2+4Yarxd6oSEhmSzzHOlPC9jj9+
	Y+fug5Zb6WWOZxNsE4Uh2EuuArZWU8ZWSfTSDzhKipVnsmw1Abtkaf06iG97TvDNOQH2GWfmTvo
	RSHuqIIFE6T+8A9Rr+LxbCVHA1p6WglM8YAyFgjMGdSm2GY8nE89Ni8GqCFItZ8ML9UT09Y1keU
	/NEDkvV4+1Y834/KtfSmLyxW/zcKX6D0BEYYVthbeXa6odXTEtUTZO4ajztl3cNjSaf8qVnrFZv
	c9QTOZZPJ8leiF2i84WSCl43gyG0lO1mo43eoF04jQ1Ws4H56V+knYNabyHZuY5eB4DOaI//8KE
	leW9GcMC2/aFKmD3kaaKBjEmsqnOftQ0TCQnYE0k0fRVrE4jLokloXQ+LOAMVR63bNT0TYLDWb7
	B8LIgX83VjQywnIltS08SsmO0+ydAzRxrqzlg74sAK3wZY55sfBQ3KABsti1D8=
X-Received: by 2002:a05:7300:d209:b0:35a:47ed:c39a with SMTP id 5a478bee46e88-35a47edc590mr3574026eec.37.1791784722302;
        Sun, 11 Oct 2026 22:58:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm3101612eec.24.2026.10.11.22.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:58:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 11 Oct 2026 22:58:28 -0700
Subject: [PATCH b4 v2 3/5] b4: handle per-message Bcc headers in send_mail
 and TUIs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-send-series-bcc-v2-3-cd17584c40fb@gmail.com>
References: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
In-Reply-To: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-36fec

Interactive TUI workflows (b4 review and b4 bugs) allow setting
per-message Bcc: headers via ToCcScreen. However, send_mail() did not
extract Bcc: headers into the envelope recipient list or strip the
header from the MIME message before signing and sending, which both
failed to deliver to those Bcc recipients (unless destaddrs was passed)
and exposed the blind addresses to all recipients.

Extract any Bcc: headers in send_mail(), add their addresses to the
per-message envelope recipients, and strip the Bcc: header before
message serialization and patatt signing. Reject per-message Bcc:
headers when submitting via the web endpoint, which only supports a
series-wide Bcc list.

Complete per-message Bcc: handling in the TUIs by counting per-message
Bcc: headers alongside send-series-bcc in the review SendScreen
confirmation dialog, rendering Bcc: in the review and thank-you email
previews, and displaying and persisting Bcc: edits in the b4 bugs
ReplyPreviewScreen.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 src/b4/__init__.py           | 19 +++++++++++++++
 src/b4/bugs/_tui.py          |  8 +++++--
 src/b4/review_tui/_common.py |  4 ++--
 src/b4/review_tui/_modals.py | 12 ++++++++--
 src/tests/test___init__.py   | 55 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2c0d3f1..8974867 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5858,6 +5858,23 @@ def send_mail(
         logger.info('Signing %s messages with patatt', len(msgs))
 
     for msg in msgs:
+        msg_bcc_hdrs = msg.get_all('bcc', [])
+        msg_bcc: Set[str] = set()
+        if msg_bcc_hdrs:
+            if web_endpoint:
+                raise RuntimeError(
+                    'Per-patch Bcc headers are not supported with the web endpoint.'
+                )
+            msg_bcc = {
+                x[1]
+                for x in cleanup_email_addrs(
+                    email.utils.getaddresses([str(x) for x in msg_bcc_hdrs]),
+                    set(),
+                    None,
+                )
+            }
+            del msg['Bcc']
+
         if not destaddrs:
             alldests = email.utils.getaddresses([str(x) for x in msg.get_all('to', [])])
             alldests += email.utils.getaddresses([str(x) for x in msg.get_all('cc', [])])
@@ -5867,6 +5884,8 @@ def send_mail(
 
         if bcc_set:
             myaddrs.update(bcc_set)
+        if msg_bcc:
+            myaddrs.update(msg_bcc)
 
         if not msg.get('X-Mailer'):
             msg.add_header('X-Mailer', f'b4 {__VERSION__}')
diff --git a/src/b4/bugs/_tui.py b/src/b4/bugs/_tui.py
index bf8dda7..aa979c7 100644
--- a/src/b4/bugs/_tui.py
+++ b/src/b4/bugs/_tui.py
@@ -1257,7 +1257,7 @@ class ReplyPreviewScreen(ModalScreen[Optional[str]]):
         if isinstance(app, BugListApp):
             ts = app._ts
         # Render email headers
-        for hdr in ('From', 'To', 'Cc', 'Subject', 'In-Reply-To'):
+        for hdr in ('From', 'To', 'Cc', 'Bcc', 'Subject', 'In-Reply-To'):
             val = self._msg.get(hdr)
             if val:
                 hdr_text = Text()
@@ -1285,17 +1285,21 @@ class ReplyPreviewScreen(ModalScreen[Optional[str]]):
 
         to_val = b4.LoreMessage.clean_header(self._msg.get('To', ''))
         cc_val = b4.LoreMessage.clean_header(self._msg.get('Cc', ''))
-        screen = ToCcScreen(to_val, cc_val, '', show_apply_all=False)
+        bcc_val = b4.LoreMessage.clean_header(self._msg.get('Bcc', ''))
+        screen = ToCcScreen(to_val, cc_val, bcc_val, show_apply_all=False)
 
         def _on_result(saved: bool | None) -> None:
             if not saved:
                 return
             del self._msg['To']
             del self._msg['Cc']
+            del self._msg['Bcc']
             if screen.to_result:
                 self._msg['To'] = screen.to_result
             if screen.cc_result:
                 self._msg['Cc'] = screen.cc_result
+            if screen.bcc_result:
+                self._msg['Bcc'] = screen.bcc_result
             self._rerender()
 
         self.app.push_screen(screen, callback=_on_result)
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 43db8c9..e1647d3 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -896,12 +896,12 @@ def _render_email_to_viewer(
     separator lines (---) are dim.
     *ts* is a resolved theme styles dict from :func:`resolve_styles`.
     """
-    for hdr in ('From', 'Subject', 'To', 'Cc'):
+    for hdr in ('From', 'Subject', 'To', 'Cc', 'Bcc'):
         val = msg[hdr]
         if not val:
             continue
         val = str(val)
-        if hdr.lower() in ('to', 'cc'):
+        if hdr.lower() in ('to', 'cc', 'bcc'):
             wrapped = b4.LoreMessage.wrap_header((hdr, val), transform='decode').decode(
                 errors='replace'
             )
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 13e3464..ea5011a 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -654,7 +654,6 @@ class SendScreen(ModalScreen[bool]):
             if isinstance(cfg_bcc, str) and cfg_bcc
             else set()
         )
-        bcc_count = len(series_bcc)
         text = Text()
         text.append(f'Send {len(self._msgs)} review email(s)?', style='bold')
         text.append('\n')
@@ -665,6 +664,15 @@ class SendScreen(ModalScreen[bool]):
             text.append(f' {subj}')
             to_count = len(email.utils.getaddresses([msg['To']])) if msg['To'] else 0
             cc_count = len(email.utils.getaddresses([msg['Cc']])) if msg['Cc'] else 0
+            msg_bcc = {
+                x[1]
+                for x in b4.cleanup_email_addrs(
+                    email.utils.getaddresses([str(x) for x in msg.get_all('bcc', [])]),
+                    set(),
+                    None,
+                )
+            }
+            bcc_count = len(series_bcc | msg_bcc)
             recip_parts: List[str] = []
             if to_count:
                 recip_parts.append(f'{to_count} To')
@@ -1381,7 +1389,7 @@ class ThankScreen(ModalScreen[Optional[str]]):
 
     def on_mount(self) -> None:
         viewer = self.query_one('#thank-viewer', RichLog)
-        for hdr in ('From', 'To', 'Cc', 'Subject', 'In-Reply-To'):
+        for hdr in ('From', 'To', 'Cc', 'Bcc', 'Subject', 'In-Reply-To'):
             val = self._msg.get(hdr)
             if val:
                 viewer.write(f'{hdr}: {val}')
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 85d580c..d7d0250 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2454,6 +2454,61 @@ class TestSendMailBcc:
         }
         assert b'Bcc:' not in seen_bodies[0]
 
+    def test_send_mail_per_message_bcc_header(self) -> None:
+        seen_dests: List[List[str]] = []
+        seen_bodies: List[bytes] = []
+
+        class _RecordingSMTP:
+            def sendmail(self, fromaddr: str, destaddrs: List[str], bdata: bytes) -> None:
+                seen_dests.append(list(destaddrs))
+                seen_bodies.append(bdata)
+
+        def _connect() -> Any:
+            return _RecordingSMTP()
+
+        msg = email.message.EmailMessage()
+        msg['From'] = 'alice@example.org'
+        msg['To'] = 'bob@example.org'
+        msg['Bcc'] = 'Secret Reviewer <secret@example.org>'
+        msg['Subject'] = 'Re: [PATCH] Test patch'
+        msg.set_content('Review reply')
+
+        sent = b4.send_mail(
+            b4.SMTPConnector(_connect),
+            [msg],
+            fromaddr='alice@example.org',
+            bccaddrs=['dave@example.org'],
+        )
+        assert sent == 1
+        assert len(seen_dests) == 1
+        assert set(seen_dests[0]) == {
+            'bob@example.org',
+            'dave@example.org',
+            'secret@example.org',
+        }
+        assert msg.get_all('bcc') is None
+        assert b'Bcc:' not in seen_bodies[0]
+        assert b'secret@example.org' not in seen_bodies[0]
+
+    def test_send_mail_per_message_bcc_web_endpoint_rejected(self) -> None:
+        msg = email.message.EmailMessage()
+        msg['From'] = 'alice@example.org'
+        msg['To'] = 'bob@example.org'
+        msg['Bcc'] = 'secret@example.org'
+        msg['Subject'] = '[PATCH] Test patch'
+        msg.set_content('Diff content')
+
+        with pytest.raises(
+            RuntimeError,
+            match='Per-patch Bcc headers are not supported with the web endpoint',
+        ):
+            b4.send_mail(
+                None,
+                [msg],
+                fromaddr='alice@example.org',
+                web_endpoint='https://example.org/_submit',
+            )
+
 def _fake_editor(tmp_path: pathlib.Path, body: str) -> str:
     """A stand-in $EDITOR that runs *body* and leaves the buffer alone."""
     script = tmp_path / 'fake-editor.sh'

-- 
2.56.0.385.gd3acb90ef8-goog

