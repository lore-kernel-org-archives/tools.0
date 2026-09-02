Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF04385D61
	for <tools@linux.kernel.org>; Wed,  2 Sep 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358117; cv=pass; b=rPTt5J2vbNWgJxR6gMKx3CNYbXS9NR7usz411QtWuXw9iicH6SY0BujUjWfPd6mdgelYbmsEECcWivW2IGkjfVvom0Ad9uQHwudnFZZr3E013R07mUgYU4MvEEVDegc4Q21nWxBu9vHN34N/rtSCeJoNm94AAfMwxp1vYHXLGaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358117; c=relaxed/simple;
	bh=+tEgsfdSntuGB9bq/X96qMEZyoZMqnxE8OQKkZ0dRBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/cZ8M62MJkwx1la4XsVLHn5YZB6oi19r4uhdA5FZC/gEejHP3uRy5uXUQ6uITO7u3sEMIX1Smlz708JB8Jq7R1K6NVf+JImSttuvyD2nmErhPkYESpyJr2cQdQ/PXmLvQmsH9PFofeIJ7yS0gYQ/KCMwkMs/3QmNJ/4avyxsLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msmAmMOd; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msmAmMOd"
Received: by smtp.kernel.org (Postfix)
	id 6BC7E1F00A3A; Wed,  2 Sep 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788358116;
	b=Qo+XaoNI5SL6VhcL+URMHXC12T/HaY9G4oW2p18U6z/q10K0v35td2RVuKfs9dAnp+Wj
	 2s1dxr6NgdS9zKUOIfl1LXZe312opNf09+DYL20djmIK+Q7y4UK1PNfoESdFoBLDWxLl+
	 Qaj0q6M7rkCcz91/FCtzxpRhVZw8bBn4xhBITvHaBkPkJAPL1p0t7HcmL3EsYtaAlNM7H
	 HZnrZozYoWzO6mIBkOn2U4knsCRXMXVIY8dF20DVbE0L0LXUmlCPO4QEXc3c2GSHi09wD
	 nv3rQZl8XxpzkiPDG3NFhjlfZNybkruc1uctvp9/6K3SBU2Hd+NEtMI7xPxc/pbM4Xg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788358116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sXCmy2yUhB7U2YIx/EfX2j1pRtEtWuod/wm/kizWVg4=;
	b=GuClgJSSd2DyB/awKUchUV7r3Zt9cYzNBiqXXF2XoCF10gov+8Xc4VMGfI0jKOBNkSwb
	 q1k73isnp5AqX/KqSxEP1kkLIJOjshGQr8ZiiHuJEg2vDCy+19TRDGGo0+1jgL64WTtw0
	 CLpeJ0geTF0o8Bxuq4wqNfw6BgXVRO+90UNHLkn4uoSuXejnnjxg3472/tz6ORDV677w8
	 O1G8eTqp1M76RIHxQRMP6bV4NzxHNrd0XjaUgFDY4K1N4zCh0FOS88/ka+nxg5VPoEYnA
	 K22+UKwIXGOx8CnoV0mu7NpTwmVemREPoIJYcyUR3Y0FMYhoyYeiG2cwJLOecP7tt2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=msmAmMOd;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE20F1F000E9
	for <tools@kernel.org>; Wed,  2 Sep 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=msmAmMOd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DE20F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso8091895e9.2
        for <tools@kernel.org>; Wed, 02 Sep 2026 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358114; x=1788962914; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXCmy2yUhB7U2YIx/EfX2j1pRtEtWuod/wm/kizWVg4=;
        b=msmAmMOdurGmApisEjO3oVmcPBZTAIlnkpTXeXBV4kkiKGWpdbbaRuoz36w+VBb+mK
         /WDKZ1edYy/Cc9rlBzwr+EhahuDYjppvxrWIp3xizvpBcxH/mvyU0b6f2ym0XEI5gOkl
         oUpLkr5ApCLiLBq5fJoRaqv9VJ1Vg3JI14sdLwE70cSi8eQx3wDwlrcZP+AAfQKfrxZx
         w1RUiIhXhr71pyPpcASSSspqmhfzIfLKd3d7Hcxbw2XGM2cefuTYlS89HZnZtArGzAoe
         Ge+cbFvHzhI6dQFVn8fIYuvsdz+tpfh+w6Tx2wmpToEhnHSe90VJinP06sWqgbkm5fSP
         F4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358114; x=1788962914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXCmy2yUhB7U2YIx/EfX2j1pRtEtWuod/wm/kizWVg4=;
        b=N+m3fC0v37WPyQyYz7DhMnJ8KiqGnxqSHC5VgITWWwFOSjAUGP47197rum4abtZsRm
         TlWyOmt/xXF0w93gT+V4Jr4SjWQzZINV1Dij70vfBPHmjYM94zHAXRS+KT7pjnifpGfQ
         m+elYWs4VMhHi+6y2Hl3OpC7j9Bt2rKNuWBDHx/Vk4m2+hTvOsAZNRI57ZvCzwToBJlr
         AmgWk8luvJw133Vz8U+TJRh01bP/ocX+KBDyp/9zUUBZVs9QNz7ja7p8Q7DTmv1Y8JMM
         opC3pfIX+R8gev87Z7C/0OFJ19+iV9muiqHYjcofwyacBQYNVXKhJQF7c0EBtAL6sYXQ
         Oygw==
X-Gm-Message-State: AFuF++mPS+pAVlqTdGH1/z3xwY7r/o8AbrO+hWKPSL1FL7+w7ZMu4u4C
	Qkz9Dvvg7t1xQpsYdvmnWYY7ZZ3OlSCq8IUhknIiafeNKpU7ttaF2NJ0TWc3RiCevoc=
X-Gm-Gg: AR+sD10Ro5AmNw9LZfPVHFQIyJxp1RnWjV47iEaM4Qa5rHkNghAfz8lwtV8TCtA1WU6
	FvjL7okqXv/Xi7snYYrNdjXqk0OD92oKk8O4/n+cjLa0WChVrIizE2iWY3OJhWKuCDEk7+qdcgt
	3iYrtpJE2BqRoeq2zRbyPASx80LwCqkAE79gE2W1kt4gFTTya0h8Q1IJHaVQpjqAo6yzpkYtpZc
	R6oUCfDLvztmVsAlrhJwwHZN8svWJJMMVdxpkvBpZwJ1HVHRs1dtXes4D6Gh6pjPmKGscqTJUYY
	tz7Tk/X7yD6cHLnllnjtWWQZiObHMxKDGeVEDekC88Yy7LuQtKPMT6sIAcwWJPfKCCp2bQ89K6m
	6RI8LAjkT5ire+B/t4OwaQVzLQXNuRVKT5Hp1Zw8/JJyUWm3NJxBS5rZtNx+7pnw1+kpbx2EFp3
	TfzRDZ+AsqVN/+7MDdvVfzkX5dmotNkgKWFiTjDaRi/bR6KgCKg9ji+EJJo1RLzfTAWQE9fvKuw
	r+Qr89cQMm590RmWPz0NaUK/fbjZrFg+ozhBFQ6vYAHAQ8t4ADFuueyCJ4ebw==
X-Received: by 2002:a05:600c:4e87:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49ce580a50cmr68916305e9.3.1788358106206;
        Wed, 02 Sep 2026 07:08:26 -0700 (PDT)
Received: from valmpani.valmpani (athedsl-11462.home.otenet.gr. [87.202.45.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm38317335e9.2.2026.09.02.07.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:08:24 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Wed, 02 Sep 2026 16:08:19 +0200
Subject: [PATCH b4 1/2] b4: factor the signature append into a helper
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-followup-reply-signature-v1-1-394a5a4394cd@gmail.com>
References: <20260902-followup-reply-signature-v1-0-394a5a4394cd@gmail.com>
In-Reply-To: <20260902-followup-reply-signature-v1-0-394a5a4394cd@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788358102; l=2605;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=+tEgsfdSntuGB9bq/X96qMEZyoZMqnxE8OQKkZ0dRBo=;
 b=BFMlr1hrlesUhOwpLycvBL1dFL4pxnaALglUncWlBQV7s7cHQtaTvsraS9pVEPJGXgcER3WAC
 fEFPpNkpeBfCqC6D78gPLb4qfPCzE0wnK7rNz5wK/wcoGftvAo4rRNS
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

The "append the signature unless the body already has one" code is
duplicated in both _build_review_email() and in
FollowupReplyPreviewScreen.on_mount().
Move it into b4.append_email_signature() and convert both.

No functional change.

Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
 src/b4/__init__.py           | 12 ++++++++++++
 src/b4/review/_review.py     |  4 +---
 src/b4/review_tui/_modals.py |  5 +----
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d140757..4c7d3d5 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5536,6 +5536,18 @@ def cleanup_email_addrs(
     return signature
 
 
+def append_email_signature(body: str) -> str:
+    """Appends the user's email signature to the end of body.
+
+    Does nothing if body already contains a "-- " delimiter, so a signature
+    inherited from an editor buffer or a quoted reply is not duplicated.
+    """
+    if '\n-- \n' in body:
+        return body
+
+    return body.rstrip('\n') + '\n\n-- \n' + get_email_signature()
+
+
 def discover_rethread_series(msgid: str, nocache: bool = False) -> List[str]:
     """Auto-discover sibling patches for a single msgid by querying lore.
 
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index a375332..ac5b297 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3579,9 +3579,7 @@ def _build_review_email(
     body = _apply_reply_template(body, series, header_info, orig_subject)
 
     # Append signature if not already present
-    if '\n-- \n' not in body:
-        signature = b4.get_email_signature()
-        body = body.rstrip('\n') + '\n\n-- \n' + signature
+    body = b4.append_email_signature(body)
 
     # Construct the EmailMessage
     user_name, user_email = b4.get_mailfrom()
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 82471ed..4f6b228 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -580,10 +580,7 @@ PW_HELP_LINES = [
             )
 
     def on_mount(self) -> None:
-        body = self._reply_text
-        if '\n-- \n' not in body:
-            sig = b4.get_email_signature()
-            body = body.rstrip('\n') + '\n\n-- \n' + sig
+        body = b4.append_email_signature(self._reply_text)
         msg = self._entry['lmsg'].make_reply(body)
         viewer = self.query_one('#followup-preview-viewer', RichLog)
         _render_email_to_viewer(viewer, msg, ts=resolve_styles(self.app))

-- 
2.47.3

