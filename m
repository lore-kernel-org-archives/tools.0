Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792488534;
	b=WhQJAm918c08IC6wy44hYhAXRIexHCdSxQfWvgr2KM/ZrDPlOmS+00BQU8dTfMVsIDQG
	 XylnfJEUe0D2s0EZtg6UiZJGdEKcD152V9SebsD8w6mrc7vtOIPQt7assCPEwx4YmsxNb
	 H+ShKRfA92iqQmPz0xNbaJbEVo5MjuBnrchmOgrFJmdXzUsw1PSMphMo+j/CdacZX455I
	 6re+H0+zYTiDAgO6iLbm+wCrmikW5wXAN2Y+QPhDAETpZw7P+AJ49cv3XdxeigZ99ZoVj
	 NtZOloZUnaI2YETPtBhVOj8RRrceFwzlviuhb+AFpqUz2FxGKAgClBctfn4ijIshyFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488534;
	h=Received:Delivered-To:Received:DMARC-Filter:X-Envelope-To:
	 DKIM-Signature:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Flow:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D55GOAldVYu3XOZq/zg9jwLI5SEsXpwoU4XEaiWG1es=;
	b=yA5HwKaH4f6NI845+btAfLVWvHY+O57tEwb2n/I6FJrPyZtLdgrOJA8WDvf8yoovWkjP
	 4DN8FfJ6dmVJF6PGSaNlsePYiY6nEvr/L2k3n34tqDRZx8nFbOmTAwMFJC+YK38LvR9HJ
	 jIaEHONSM63wdTmVQUbzPTXDJhGQB/AOjVu5/JyhrkSWcysqA18xnCspAbdols0UtpA4G
	 eSuGSzGpnqwxgdCCao0eoiBNrVX/gxnUcpcxu1/KEmW3nanSmKYOQVYryzFf08HXsFend
	 lih+eh44OA0O4qTh95EnlD9Lp18BZ+abEmOONk576rLlDWyc4RbQSLqf1YzrdNKC8rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=puCOW8xK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A085C606A319
	for <tools@linux.kernel.org>; Tue, 20 Oct 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=puCOW8xK
Received: by smtp.kernel.org (Postfix)
	id 647501F000D0; Tue, 20 Oct 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.103
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792488533;
	b=RG/nWG4xeKwzP8Pk73ZenH/5SO5RDXOfnhzqpeWmnqXbTZBZmh665FmxphZvhrjrTSBN
	 HWi2b782Slah/SlGCLHtamSxC/CbTsblpvg5W+U9X0UY9x9OUpCnfAf3irNq0qXTJ8GLX
	 0iXm8R5Uh8AU9BAnu+imsaVucu4+YukGoxqTxBujjGoBCeXDc66havuMAFlS+yTA3nYyj
	 v3VqIlVZqEZ2tothIvKN5O3DWtr9NZlOUNauWofdbRHTXf+wenSe/lbcGtWkmEp3vqsli
	 MWLOxb6syn28lTx6AVGNMjU5lAunaAmriFLvLyaRRAnxq+F7peWm4kAQSjk9ElNB8pA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792488533;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=D55GOAldVYu3XOZq/zg9jwLI5SEsXpwoU4XEaiWG1es=;
	b=Ttj6Ml+rSC5VWUyaMc2YveaORtxDZiy80Gau/LNiYJZ7Pad3kCIlu2nkiHUmn9fVUPew
	 U3ynLolv0Lv9+9/iChpknheXGPxXRey032IB8lTd+MpZXJgXonIazRGmpmlaJlyBzqZsJ
	 kY4KeE69CggWDRPGGJ6Y8CpT+UDqaDT/yyLlQ8BPEJcNpm4dgi+hZoQAQabpz7bq+PZg+
	 UUQZdmV/4Afc8tJBOqutMbEX0+5pnUgnHQFRjw8wv4uTwvFxfgKDFGcT/4oT0IwcrWLAy
	 NBr2FLJqLee3HsSMiZH/hyTOI5IlTTCCbZNtz8IxwhpsSb5RDeTLgQYnmDVjq/kbaZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=puCOW8xK;
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.103
Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 843231F000CF
	for <tools@kernel.org>; Tue, 20 Oct 2026 09:28:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=puCOW8xK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 843231F000CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=8zg1vDkZdk89vKtdzWqYNNBlnWYAQIzT6BYiqXtwtvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792488530; v=1; x=1793093330;
 b=puCOW8xKmUIqjXNO+lNbMAKv88BKb65p9MhOHgFUO1CPQjGz/sYk67FFNbbTIWEwSX6SU2wd
 FI+XYCE5auzf58QbYR/y0J0PagocyH84l4MF3Mz92oMusnr1JHOoTlhgtP8SEDKDvPcOGerpg/1
 DvnxRjIGGZQHIQkZT0fXqXr4=
X-Envelope-To: tools@kernel.org
Received: by mta12.migadu.com with ESMTPS id 6cccb140262aad9f;
	Tue, 20 Oct 2026 09:28:50 +0000
X-Mizu-Trace-ID: 6cccb140262aad9f
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 20 Oct 2026 17:28:32 +0800
Subject: [PATCH b4 2/2] ez: exit cleanly when prep tracking data is missing
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
Message-Id: <20261020-b4_mailmap-v1-2-55965f9201bd@kylinos.cn>
References: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
In-Reply-To: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

get_prep_branch_as_patches() indexed tracking['series'] without
checking that any tracking was loaded at all, so every caller arriving
without a cover letter died with a bare KeyError traceback. The most
visible path is `b4 prep --auto-to-cc` on a branch b4 does not manage.

Let is_prep_branch(mustbe=True) deliver that diagnosis before the
series is assembled, and exit with a clear message if the branch is
managed but its tracking is unusable anyway.

To reproduce this issue: on a branch that was never set up with
`b4 prep -n`, run:

  b4 prep --auto-to-cc

Without this change it dies with:

  Traceback (most recent call last):
    ...
    prefixes.extend(tracking['series'].get('prefixes', list()))
  KeyError: 'series'

With this change it exits with:

  CRITICAL: This is not a prep-managed branch or it was created by someone else.

Assisted-by: LLM [analysis, codegen, tests]
Fixes: 940469727b11 ("ez: refactor single-patch-series code")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 src/b4/ez.py         |  7 +++++++
 src/tests/test_ez.py | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index c1e964b2a013..7929234f8b3d 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2826,6 +2826,13 @@ def get_prep_branch_as_patches(
 ]:
     cover, tracking = load_cover(strip_comments=True, usebranch=usebranch)
 
+    if 'series' not in tracking:
+        # No tracking at all means the cover letter could not be found; let
+        # is_prep_branch() exit with the real diagnosis instead of a KeyError.
+        is_prep_branch(mustbe=True, usebranch=usebranch)
+        logger.critical('CRITICAL: No usable b4 prep tracking data found.')
+        sys.exit(1)
+
     if prefixes is None:
         prefixes = list()
     prefixes.extend(tracking['series'].get('prefixes', list()))
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 71dd71637448..b2ddb8569d5e 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1404,6 +1404,17 @@ def test_claim_under_mailmap_recognizes_own_commits(
     assert b4.git_revparse_obj('HEAD') == head
 
 
+def test_auto_to_cc_unmanaged_branch_exits_cleanly(
+    gitdir: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    """auto-to-cc on a branch with no cover letter must exit with the
+    not-a-prep-managed-branch diagnostic instead of a KeyError traceback."""
+    with caplog.at_level(logging.CRITICAL, logger='b4'):
+        with pytest.raises(SystemExit):
+            _run_prep('--auto-to-cc')
+    assert 'not a prep-managed branch' in caplog.text
+
+
 def test_claim_branch_description_restamps_series(prepdir: str) -> None:
     """branch-description keeps no cover commit, but --claim still re-stamps
     the series patches (fork-point..HEAD) under the current identity."""

-- 
2.55.0

