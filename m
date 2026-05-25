Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AE823C4FF
	for <tools@linux.kernel.org>; Mon, 25 May 2026 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779682474; cv=pass; b=VkfPLNWyqwrNwDzVuVfX7XzvlmF7SW9q3fsatGnQmAH+h+RqowTqfs5G9D43Eyz3uPn69cFLiDjVNQfXTV2nlaqsyxKydDqxphX37HUEi75jaaHMF0HP7Ocbsnh1kwx/tM/3JQk5Fz/kodSxT12FSh3dNwCqR91AfHSCEzNa0yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779682474; c=relaxed/simple;
	bh=7nfRawGKUavDg7vJ3WPDypchOJut4hS7Z2bZKZjbpB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RpmF1kvVKn2K7oV8suf2IqQblDjlkP6UN0Fe63QRzp/ppm8p46C/2dYdjOo6/uU8vcBnT7ZL0vIFkTA39D/xfUXBVwtIdIMJNMTk6nWFSdZj06uy+bXj975HCnCFrLRD6hffcWWvvRO1a5TvUgHwW3CNW7dOo0MdWby/1KW7vn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiL1zh8H; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiL1zh8H"
Received: by smtp.kernel.org (Postfix)
	id 949091F00A3A; Mon, 25 May 2026 04:14:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779682472;
	b=0Yhkdc+HKe3TVAEiq+UX9SA4X20VOvU1T31Y1Haw/SL8uD/HB7pkKbgFa3yljaFuQybe
	 N6SExNNXVkZRafiEXW3fopHteO4QIq5vUIMWURMPsqEHRuvRZNMi6Ld7aoNmzqyjOve2j
	 YbuMU5i1XpY9Rq3Qw9nvpFgpkmB4eripPvuKCelpTpmbQKetiFu5KRg0dh+ozWohWYg9y
	 ansgyqivrc3i/EXeyomjLiV4wJCynzDNQvamtnuA1yG14Qqi5R5d/1uZMx8k31sMrCy1o
	 8/aiBrON5n1uZQGzgE7H/n6v+lG2EWi7YIG+1Zob2Npz65Kf1OUE6+ycP2/ItL3HzMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779682472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VhwOgL71rFfiAZmRJ8um14U9Jhfr/AqpnhbKEsTQLP8=;
	b=rpLpiXq92cGEtDQnU4PDD+SBnMT5xgehLetD/2WNxvOM+Rr2tgKpT9yEGgFq/H9VbXKB
	 T9ERmQK896kGTvZJvKxcENwrcqYTkpm/UTNK9bgiCgz7qdiQv/cFyroUr7IUfOyaq4wm4
	 ptmgbe/y1sMgcApbXUR2wp1hbSe9yhUsXV+hPlF/cHOBxwS3Sb7I2K+wElsSmKV014RkC
	 j4EhKCUcEJeXNf0tqhgGTBF4ifLic62e3yqXp1u40IsWVpGbU1Cyi+9KlXtDC4mDTA3ez
	 cox6r2nDQ1mO7/8enXzpozMpn5ePssFHuJUxkU8Y0Mp4MCxXBXqskbloLChiTfVDKdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oiL1zh8H;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01B241F000E9
	for <tools@kernel.org>; Mon, 25 May 2026 04:14:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oiL1zh8H
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 01B241F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30246cfd41aso6012604eec.1
        for <tools@kernel.org>; Sun, 24 May 2026 21:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779682471; x=1780287271; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VhwOgL71rFfiAZmRJ8um14U9Jhfr/AqpnhbKEsTQLP8=;
        b=oiL1zh8HtXg+9jjXfXnDOzlZwCSXF31o9PWdil/ZFRDYW1VkYmZcA44K5kdh9T2WrB
         6VzS1AOmTfiNY9AiwotE6PMaALIkB1jkV1kovPI0VUhOkJFEUBA1ApwF0DBHG3myxHH0
         Eo5BcNGxSPrxXveXlGeAzRxGZpNhyJglU2e3o/MYxcU80ad/+db4D3z4OCIMokAjZlEE
         7bRnSJQ6tK2U6m9q+Gzz8Hm+WsKZWMFixozng+NKEZFsRzV5tHRlNKW2r0K+fyh91iu8
         5YWNLh57oXr+V/dXotMiTx/C/3KAJkp7655Ad4R74PH5ie5fvtl62cDVMeSiZfbMelvy
         /hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779682471; x=1780287271;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhwOgL71rFfiAZmRJ8um14U9Jhfr/AqpnhbKEsTQLP8=;
        b=KIAZudOH0q4F5GlufSxVdKlJsibK5d9NJNRERsgKXPRV2rkRpEspc2cc3a1Ax4QNsq
         80BPSSmIjOS1I7/F/TeC0bUcQY1J/b41dxLJebtbbxfp4QCxzbLMM6YRaCUxHtGuauwb
         ZtK+AtkdgDqBC/gCOSylacAZ1b1YylbpmVK2KHYQq4n3EkTFWhH+iiV7FABzV1fXzGU/
         ysWJ+H4R0rmMRuuIa63JHbPPSlOaoSAf5kUbzGsSlbYeKVa6kmqv+qf9We877eXV5JUU
         wbrOGqEn3r7YLIDEk+hyyAzl8qPdyFvtEiC0natOsbhldt4at0ujgJpW6Ft7c2AjIzOw
         QYqA==
X-Gm-Message-State: AOJu0Yxfeaososi5gLToVJF2YU1M3ozyhHYM1Y0FaiR4BC2KLbYNrtqv
	FMeF1qT8FzTcw9OVKzGquwW7FqnMJ5Y27G0ke4sq4blYQsbSbAsamLflDR9OVQ==
X-Gm-Gg: Acq92OHnoZRHyceW2urkzPutH18qMSEZrOSpN6QS+sBvj7vksMfBIfdWU4rptzPuw2C
	1RFlIoQZ+QvOcfQS35u/2DC0ZD3iUMqDv6XDyB7V6s788BywAj3csVHUi1iq1Uu6sQp4jCBswS0
	826iHCYnOg8V+Gu3bMqBV9vHp16LQWnzxfNaAduSe2wLSyHOPnoJRzCMbKl3rkYyGANCfD6tIXO
	sYGE90DFG64JLX8EiUqetgWB2gT1DIeEwIflagONkAfIg7DnwALdOrxOB3vB6LxwCkyTO0IB7Zj
	Y2wzCC7fsQpe3pUlsS1QzlS+BMPEMAi0jlPFJfxjh4ZCEHKL5VDhONTqsJGE5+ZAEzk7aE9NxhF
	iriCTTLM8rJiplGK7xQEyl6KkwUGwyP9Gn+grLjmHNli3fFHTdDmsX8BDvG8p22bPMl/p1fyfMJ
	7tTMP8IgFPfQ4xSSnw4n3ncKhmo56yDwGBjhvMBX5qWi31rB4Fgzu63unLzhj6UU2sHEltuX+Dh
	g==
X-Received: by 2002:a05:7301:9bc8:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-30449024d21mr6464751eec.4.1779682470889;
        Sun, 24 May 2026 21:14:30 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f1fe3esm11378854eec.7.2026.05.24.21.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 21:14:30 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 25 May 2026 01:14:23 -0300
Subject: [PATCH b4] ez: avoid duplicate signatures on resend
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260525-resend-signature-fix-v1-1-09fd09faf34f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQrCQAwFf6XkbKCujVB/RTxsd19rPKyStEUo/
 XdXPc7AzEYOUzhdmo0Mq7o+S4XjoaF0j2UCa65MoQ3nVoKwwVEyu04lzouBR31zj7GTU8xJpKe
 avgxV/7ZXGjq6/Z0vwwNp/v5o3z9v/p+VfAAAAA==
X-Change-ID: 20260525-resend-signature-fix-9ef453adc559
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3497;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=7nfRawGKUavDg7vJ3WPDypchOJut4hS7Z2bZKZjbpB4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnCZ5bI791xQvHYlxubT28/+ziyfaWPKN+jiwYr7xTNY
 f/zbc7rHx2lLAxiXAyyYoosq5MWWe7penC1Pm6FB8wcViaQIQxcnAIwkV8ujAzzOpXPNRwtrWn4
 N1u/2MXorkbWAqEDiqzGUXP/mEt0G0ky/PfjveIQeMR9SSL3F9Wlr49qsPM8j9HV+VE/w3rJRu8
 bm3kA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

'b4 send --resend' rebuilds messages from the historical sent tag and
appends the current email signature to the cover text. If the stored
cover already ends in a signature block, the regenerated resend can carry
two footer blocks, as we can see here[1].

Strip an existing trailing cover signature before adding the current one.
Recognize both the standard "-- " delimiter and the bare "--" delimiter
observed in archived mail.

[1] https://lore.kernel.org/all/20260511-alsa-hda-cs35l41-fw-work-teardown-v1-1-1184e9bc4f25@gmail.com/

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 src/b4/ez.py         | 15 +++++++++++----
 src/tests/test_ez.py | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 3e81138..4f55f0f 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1734,6 +1734,15 @@ def get_cover_subject_body(cover: str) -> Tuple[b4.LoreSubject, str]:
     return lsubject, cbody
 
 
+def strip_cover_signature(cbody: str) -> str:
+    body = cbody.replace('\r', '').rstrip('\n')
+    sigpos = max(body.rfind('\n-- \n'), body.rfind('\n--\n'))
+    if sigpos >= 0:
+        return body[:sigpos].rstrip('\n')
+
+    return body
+
+
 def rethread(patches: List[Tuple[str, EmailMessage]]) -> None:
     refto = patches[0][1].get('message-id')
     if refto is not None:
@@ -1992,7 +2001,7 @@ def get_sent_tag_as_patches(
     cover, base_commit, change_id = get_base_changeid_from_tag(tagname)
 
     csubject, cbody = get_cover_subject_body(cover)
-    cbody = cbody.strip() + '\n-- \n' + b4.get_email_signature()
+    cbody = strip_cover_signature(cbody) + '\n-- \n' + b4.get_email_signature()
     prefixes = ['RESEND'] + csubject.get_extra_prefixes(exclude=['RESEND'])
     msgid_tpt = make_msgid_tpt(change_id, revision)
     seriests = int(time.time())
@@ -2659,9 +2668,7 @@ def reroll(
     mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PREFIX
 ) -> None:
     # Remove signature
-    chunks = tag_msg.rsplit('\n-- \n')
-    if len(chunks) > 1:
-        tag_msg = chunks[0] + '\n'
+    tag_msg = strip_cover_signature(tag_msg) + '\n'
 
     cover, tracking = load_cover(strip_comments=True)
     revision = tracking['series']['revision']
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 3d05ef9..5abfea2 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -408,3 +408,24 @@ def test_store_cover_preserves_series_notes(prepdir_commit: str) -> None:
     ecode, backup_oid = b4.git_run_command(None, ['rev-parse', f'refs/original/{cb}'])
     assert ecode == 0
     assert backup_oid.strip() == pre_head
+
+
+@pytest.mark.parametrize('sigmarker', ['-- ', '--'])
+def test_strip_cover_signature(sigmarker: str) -> None:
+    cbody = (
+        'Cover text.\n\n'
+        '---\n'
+        'base-commit: abc123\n'
+        'change-id: 20260101-test-change-id\n\n'
+        'Best regards,\n'
+        f'{sigmarker}\n'
+        'Test User <test@example.com>\n'
+    )
+
+    assert b4.ez.strip_cover_signature(cbody) == (
+        'Cover text.\n\n'
+        '---\n'
+        'base-commit: abc123\n'
+        'change-id: 20260101-test-change-id\n\n'
+        'Best regards,'
+    )

---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260525-resend-signature-fix-9ef453adc559

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

