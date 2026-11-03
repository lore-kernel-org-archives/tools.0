Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716188;
	b=sM0er8Wmz8UXduHIFEDlCBMtgsf96O+aWNXQi7Ev6iM+G7QILh96n1SAfQXF3E8HKbr5
	 SHnL7/Ag0VHBeM2GgU6z1+so7KmMkvfUug9JA3ljrxnS9NtfT1rsPRjeBSSTcw4vC6eva
	 g35b+EuZcXERAKFkj/dg+62BjgBFhPI/c0OWvap70Njw7Dykelxgr0bCQJoh3AAeVOFmK
	 v0UpVQI+AxSAEtI82zCrDwIsCivmifCUdp8aAez8vVBSmwtZObguF2H0XNxvs/9DRb6ii
	 ThEn38Wq1PMGuvK8VWdR25cOGxNtEfxi2Mk5owHLFon6dtV2/teyR10Nh64o1aAsUaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716188;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jJXKwlc7suG1N+zM7/VYxOg/ThcS7TOXh7hk7Jgebew=;
	b=Oyaoq8aXEKkB8xxrgPKpY989y1C1c4bfRXdRQOC2FnX2r0w6zLuiOT44Zb4cQGEhellU
	 EZbaM97JNzzBHrPcrNmtSYSc0vSqBa8CSabDpKt3krKCiEgWFfbApeVem+3Ln5c+UcSS7
	 hMJwmWBR/5Ak6q8Gc94e80tKkIsNqgU/tAyEvIlzmNdQezercmk44kOVnokXnme7m7H3T
	 Py1hooh89Y82CZFjw1nk52cxWsrT7JWDpu7Q1biZxNHUxT9dpzUQyTB+9x12QONJLBw3t
	 /rsIRh54LIN7jSFl3K1C9Je7FlJL2zpYrynLTMlnlZFc2aokPyZ+FTilrCnPSVJeRzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQdSa+Ox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75330606A33E
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQdSa+Ox
Received: by smtp.kernel.org (Postfix)
	id 67F791F00919; Tue,  3 Nov 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793716188;
	b=bbUy0w0clO4LDQ+jdTHgGJB1cGAyBSYkwmwHZ/Eoum4kOFSqqzpINHoMWzcjP2J1FrM+
	 C0JqvBVfUPKkcCTvroxBrvmzgpxfGE5/08KnS6GpTeKAe1e/LyJgPxASflRkdykZRWlTg
	 8SbMWKZl24iSNRfZT5YkTs/aDhKvy5EFpOuUEV78eFl3fl+Uj5XEmLRmgRXI6y3FloAY3
	 Cdi5e8y1u7nbiggHUZG7FXRqWA+34BlO307rvTzJxKizhaosAku39EnynRK7LalamMVxS
	 hzT+0VIfDcSlasRzUnpnt6Xxote3oeRqnMf7N+F/mDUSfhpvPsjC/yirv0t3M3PrSSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793716188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jJXKwlc7suG1N+zM7/VYxOg/ThcS7TOXh7hk7Jgebew=;
	b=kMpXjnCAFC38d6wLTl/2Al1mU64VWc6VP2lBsqoTyr8gO+sZB5T9i3ncIczEyl61Iz8+
	 cn7L8yxysJl4JDWYnWrY8IGh1hsVbqu8EGXrmNkEVRETyGQhh+6ZjOeaRmWXrIhgGHSzp
	 lwpTtw3tulAWhw5Y+XZjxjm2ASUEhhCxkFixgy/oxkUyLvCATW8v3djCD0A5KrlIxdJnv
	 NRNb9q8dROnsp+wXkT0l+gbPj1WfhYwsdzvbW4qN1jOwe2093FGbEDQaowxqdLZSAblCr
	 JeAYzmCxIa42G6EmkniArNs2GRpMEE/mxtg+IGoufkY2hhBoBh6cGnZWjr7KNp2bI+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQdSa+Ox;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7C651F00A1A
	for <tools@kernel.org>; Tue,  3 Nov 2026 14:29:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQdSa+Ox
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C7C651F00A1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so28789595e9.0
        for <tools@kernel.org>; Tue, 03 Nov 2026 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716186; x=1794320986; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJXKwlc7suG1N+zM7/VYxOg/ThcS7TOXh7hk7Jgebew=;
        b=tQdSa+Oxvvr3XFmzc2i7SbYjcF7e4mCT1aEZtPV9yY88HHGM/L4OgAuOxlq7VXByk+
         AKgUOIfSTJxFHDrqmR6AvfRL/JTGCV1jFBo+7WaeZ3+f4y54w1ALQ5ziVbvOGbFExkMb
         IDMaKZycfZwUe3ZYXwwkBPln/5yBg3E+H8K2cZwE2Crvf6S/dFYl49HJkU9Xs6KHqJIb
         0UcOefcNGk08mwV3GNWgskR7Dih1C81TfXnOjexXiTOtjBCK+vrOMB74blL5gNGKgrTK
         4NqRrGtHZaTx6vCQ8s0Ic0leJ3AR0ivgxTHwloU4cDjU2NeDj+JzK0K7gG0+mwQQG0Y1
         x5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716186; x=1794320986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJXKwlc7suG1N+zM7/VYxOg/ThcS7TOXh7hk7Jgebew=;
        b=wiIS120R7oRFkdeAYukbWSpJkcCRmmK/HKeqlqMNJHDQ0itupmzYO/AN8MtmXhPSBc
         xLKTooK2/RUyOJLx0Z5BnihtzHjsgvqLpzldyWmBlDO1YpN+RyRoIogIuQcEVZ2vj1TA
         EsU+I62D7gyTru4Y7ktKGRnk7WM0MDYnsJMkbzXQg1Vs3nfvxiMqVdZpU9f7eHEQJ3q0
         jBPRbLwR77rgSD4BmMaSekXKivGHoKYjD84jwsdEzgY+Z77F4nel8sGyzh72EeQXt+MT
         5whdooQOCrTi9BiU5khskbdXWqf32ElgwYhqXHBQuePB0ws7MxR4FBpDcVpJgtSHQcS2
         9nPg==
X-Gm-Message-State: APuU4Z+geR9jdcjkKPiPLMEA7m+WTgR/0NWfH9tb9497pWISsSTaLlLf
	kLIZmKNUNYHgEa0xXvAcqroU7OVo6EKAyY/bAQF69J7+pH/kpXi5AcFNq0Nnntag
X-Gm-Gg: AYBFou3c/Dsl5n0iVwUpD/GJM2NVjFhvGfJpdNPzIpgxquKi/Yo7exyh9nF7p8dB735
	/+LeVMmA/5AgvkOB3XRt6Zku7HSLW5kSXL/Nm0ZqrASmh/AmYnX8X4nA7nlZsNNNy7Dx9RisDM0
	8HA2OpB7+8VOnwVsKO6faLjcddAHRffEZ8YHPh9LMyxFRj2J9B3qVl8ZTfOVN4jnLGJe32qACMY
	1XZpRfMLaOPQ648l37vqi5oPKGNKQ9CCRSyAJ5RAuj5mX1DdjH3FyE6z/zkQPh7ECq2Qf2mufGJ
	KrNVmJmTiGacArjQOYhBhord7iEeaZHRhrC6PB+wqGJNWfEaNX9SVx/UHCkRv33MlnU0uXSOEVF
	98NxNGSzopEIdRs+BLFQWQBOlQfLmbTcF6WJkl/ma+k43VnVjVmvRdhtZlIrpVvFEVMzB4B9Nw8
	cAemEr3Bg6C4ftI9MhPLX5AUdfrxd/nh/HhtB5JGWLok/oCTz+qF+FPlSTIBaL9e15Lm/O3u8sA
	8gkk7ptsK+Y9xr7hqQ4pYAHOvjAzQXP0byCAoxssNYPO+J7QShaQ5dQ51N/jsu6qyj/1YXii82u
	/BeKOBKcCqTWiw04d0gttpLiUEom62074rZlmOUMF0Z2rQ==
X-Received: by 2002:a05:600c:a4e:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4ac187a766bmr301480565e9.21.1793716186125;
        Tue, 03 Nov 2026 06:29:46 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm65290805e9.11.2026.11.03.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:29:45 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 15:29:35 +0100
Subject: [PATCH b4 2/5] review: Convert track_series_from_mailbox() to use
 LookupError()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-browse-and-track-series-v1-2-d9c9306f4033@gmail.com>
References: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
In-Reply-To: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793716179; l=2670;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=6Thci7oVmb6fiuDKk3xEwvtjJ4VjYQ4C91r38dCiab4=;
 b=+z2xTQElrJ5uOJudkzheKF03pM8YeO2/Sn0TFMbeVZbCx9TmvahyAoRqOYV5/x9+65j39SlQ2
 JT0wfVGDUAoDBm6RZUT5T3QxLbRmMWlQ45TwndZkJUOHwt+G1Nai46N
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Raise errors from track_series_from_mailbox() instead of exiting
and catch the raised exception in cmd_track() to log it and exit.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 src/b4/review/tracking.py | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 891891d..61f7330 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -679,7 +679,11 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
     finally:
         signal.signal(signal.SIGINT, _old_sigint)
 
-    track_series_from_mailbox(identifier, lmbx, wanted_ver, topdir, was_rethreaded)
+    try:
+        track_series_from_mailbox(identifier, lmbx, wanted_ver, topdir, was_rethreaded)
+    except LookupError as ex:
+        logger.critical('%s', ex)
+        sys.exit(1)
 
 
 def track_series_from_mailbox(
@@ -692,8 +696,7 @@ def track_series_from_mailbox(
     """Track a series from a LoreMailbox, given the desired version and project identifier."""
     lser = lmbx.get_series(wanted_ver, sloppytrailers=False, codereview_trailers=False)
     if not lser:
-        logger.critical('Could not find series version %d', wanted_ver)
-        sys.exit(1)
+        raise LookupError(f'Could not find series version {wanted_ver}')
 
     # Extract series metadata
     revision = lser.revision
@@ -719,8 +722,7 @@ def track_series_from_mailbox(
             ref_msg = lser.patches[1]
 
     if ref_msg is None:
-        logger.critical('Could not find cover letter or first patch')
-        sys.exit(1)
+        raise LookupError('Could not find cover letter or first patch')
 
     message_id = ref_msg.msgid
 
@@ -802,15 +804,11 @@ def track_series_from_mailbox(
                     '  Upgrade the series in the review TUI to the new version.'
                 )
             return
-        logger.critical(
-            'This series is already tracked (status: %s, v%d)', status_str, cur_rev
-        )
-        logger.critical('Change-ID: %s', existing_change_id)
-        logger.critical(
-            'Use "b4 review forget %s" to erase it and track afresh.',
-            existing_change_id,
+        raise LookupError(
+            f'This series is already tracked (status: {status_str}, v{cur_rev})'
+            f' as {existing_change_id}.\n'
+            f'Use "b4 review forget {existing_change_id}" to erase it and track afresh.'
         )
-        sys.exit(1)
 
     # Not tracked yet — create a new series and record its revisions.
     sent_at: Optional[str] = None

-- 
2.43.0

