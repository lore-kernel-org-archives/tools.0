Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF9344D88
	for <tools@linux.kernel.org>; Wed,  2 Sep 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358112; cv=pass; b=gsXP5jcXYadest3sPLl9SA0H0VeWQasYG7uqatpraQh63mUa0bYlQE2tlOVXRP/dTT9g7Bjfv3LQyZd+Lt7sj2HiJ5tORPxEU+iS5qOiLCZY/Pp7Zx4QLhU6hTlZFmxmrmMAG+VfVzK6xboWZLFohWP1OtinO5PgurcIlPErpOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358112; c=relaxed/simple;
	bh=Ju4l9XXbKzEtXxzfJ/7ZlNTrAHJz8UTUEEzK9rxen28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AX1iLK7qmCSzhl2hWGnUB+lMco4FOudJtKwR2UGZU2wDWT4VSkWkZj/5cOqOQdSpg7QMg3FkiSrisg/Vnb9RTfIv/8WVv0ybgCEvfrcj870dQ2fza9mPm+gdNGG9Hu10ovgqJu0M1zaj1yoMP1MLkwxljNh2bD5f1SEQRUU+WyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpAwbM6I; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpAwbM6I"
Received: by smtp.kernel.org (Postfix)
	id 14F241F00A3A; Wed,  2 Sep 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788358111;
	b=nslDAlZxnjrxLdWjJm83N2viuGsDGfXmM0rUI18uqwxBsYhP/iuSVfjmg+CnvuSu6Zxj
	 8VzWJEp9ihMe+bWINmj2l99/f0jTSHhZ1lyG9RcBtXVTUUbExmlOjlUzFKZAQlqxt6Qkk
	 pc/NRuF8C+ucSXVOavnU7Pk9hPZ05eyX7hzxSdtHGZSczblrasRU5oTNHW+bwNnz/EH/t
	 I5LNRCMXnf1p+tBZpSNcArpD+wd1fJcfmhgPNFctc0AkCpmSx/hPKMvHJfl+ILa819K9A
	 XpEwXGBzLl0bm0MMmOXcwqBsCgsUdbWmhV4arYVL487DSwVx7HQkMsuw3NrohKk9soQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788358111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6VqbaQMmB2+7PkcmrGia3HITYS0TczyrFAMjY+KnXi0=;
	b=D48bFG1aO2vvw8v1+p1kyQ3bf3G5zn/3OdxDIcKKx7GRG9efA8VkSoRUg4y7Alf9dXK3
	 ve9GpeU9G9ZMA5uYxGNrdWlqM78thTQygjW3hcg0F6mONDwh3iWkYCZ41b9wtJN1GAEUA
	 6h7sEKVrsinH+crEC0KKfXNK/MUhXqDiT3VWYaxQoQgodjp4HqDj3uTbNb6AFnoVgKRhU
	 fPdH6yJonU5/8ZfkAAXk558+O5BQjEBMHiL3par2DoMOAcDjptNx8lyRk2YjwLD0wVl8G
	 tHkVRikZGXy/hnHT4J8DYsmcCsB7hQz7ZBK2g4cyGRk75pYWNQrLaYMEPOHXmKTxVRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NpAwbM6I;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EA711F000E9
	for <tools@kernel.org>; Wed,  2 Sep 2026 14:08:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NpAwbM6I
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8EA711F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so12191835e9.1
        for <tools@kernel.org>; Wed, 02 Sep 2026 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358109; x=1788962909; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VqbaQMmB2+7PkcmrGia3HITYS0TczyrFAMjY+KnXi0=;
        b=NpAwbM6IkSpRm/NxC9OxIsDj8r9MQHomtVtvFXd8h9HQxHl8EiFPIo2crjgJgmFODk
         xacyWpJQyu9gioStllXfPjmLrweyxxokJn6ZmsiOTXTuEk1+2xZLlMeVvtxp8pZP/mBa
         gvgLJz1zGnkhuHYg8pYPlpTgH9MS+MbznjkEhXagowFMHflTuO5LpS9XqFqz9/wctaHw
         oq+/SUSFLWirSuoibr9duUXSLtvyLKiK0SSZINjNIdLtNtCidMmIzQaXlSgD1TPYYD8G
         tw2z3MwYfWfyapFfPib5sDVdtlR4X6HEI8P3LJKNqRDgF/1onACnF8g3/jwd1eXBAYAD
         J47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358109; x=1788962909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VqbaQMmB2+7PkcmrGia3HITYS0TczyrFAMjY+KnXi0=;
        b=cE6PgII2rp8x8tvBxDRHm1kuzoKEiI3KyKguswAAj0kkRIVBqz1Huy31jpOJJn1TRr
         0kXV/eVl67nUig7oU2KDrfDmIb8HG9D8nodJUVfCagrQfpxeQ2cFi7CXsi9TMfzvwAsp
         o04N2wCocJ0devBv9sZ7uEAvy3kRVZ6CO3sGomLIFoKFF5wd2a16RzEShWXAPWaju5e8
         tDJt1gBYWku+FjuSA4wBw5iEqESv5L1PfcmIjIbQic3CBhdHva4nJzpp2hQOeDkcm4GX
         0Ew8BO0t55aAQG361b/vo9zqQzP+V4lmDx/AKi18MhhB5u/Zs2rNuGt87MDjkvfVia0S
         77XA==
X-Gm-Message-State: AFuF++kD6+/de8nBAt1aAd0gf1vTDixYXLhfgsNjB5U/MVK30f85ZvJh
	+oocUXGUgDkIk8fANXhcrDaqEFXIz7fk9xjtWcEjVQCX1pgbrEXC8u7Yf8cEUuN0xdk=
X-Gm-Gg: AR+sD12G8FyQCi7W1tOJDlS3P7DtteCUFJxFusjeiCSkMJlZjbNnqD/CHXJvuFfbh8/
	MNxtnhdoGFj38otpwsDujp4YmczliW3tgmWPwAowGTqTnG6ioZ5caewlq2VjgdXAYXlsH/3ItPR
	hDwlzRwbySHiZjdyvkG8qpOVwgavYT49Jt46r0/mXlDKL1jx5Vt45ZTEDNN8ILN+TBFRVPpBmRT
	m7DKT7VjgwKrkI8PVQ686yGwNFCOsjLoldG6jDiiKL6L6vb5kyP7aN/9rCxvoFn3evPHGpUBsvo
	ZAaVrOxASrTcMuG1vRcFMOMTKhNHMVGT+PnqwGczAs2GeLjaDeAOX3TyTiSblRVCO777ndKVYvQ
	60H2B2lFthuNqPzWkZdfAJkQHeazoJSwS1xMiFV6MIWduJJuLn9YaRF40puuNdNZt9pLbli7huG
	UBgD7w1X4I87CKEUfwVhh4kGUlcKoO5JtnX3wRwzwgwIbcLmhW9miyeyaIddq1u/siomxMm7qkj
	xbQVbClxEQnq7aBuUKEjCoVD57dHztXpc2D02KaNTURJ28f84GjYKJx9JFuiw==
X-Received: by 2002:a05:600c:3b18:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49ce583adbemr82141465e9.15.1788358108841;
        Wed, 02 Sep 2026 07:08:28 -0700 (PDT)
Received: from valmpani.valmpani (athedsl-11462.home.otenet.gr. [87.202.45.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm38317335e9.2.2026.09.02.07.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:08:27 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Wed, 02 Sep 2026 16:08:20 +0200
Subject: [PATCH b4 2/2] review-tui: sign followup replies that get sent
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-followup-reply-signature-v1-2-394a5a4394cd@gmail.com>
References: <20260902-followup-reply-signature-v1-0-394a5a4394cd@gmail.com>
In-Reply-To: <20260902-followup-reply-signature-v1-0-394a5a4394cd@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788358102; l=1551;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=Ju4l9XXbKzEtXxzfJ/7ZlNTrAHJz8UTUEEzK9rxen28=;
 b=MxrxiN+BTpvdLiLHKEtgy+9g0W7jNfPkcuLSj04TOYW4iQ4LZW7w3T+JOCk9IG21Srq8DmX+a
 aPrhLnu20rWBeOlue/aYsi7dwH4qsyvvPbrISsNNmkLCx1J7CCJThpk
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

When sending a followup reply through either the lite view or through the
review panel, a signature block appears in the end of the email. Hitting
send, sends the reply but without carrying the signature.

Call append_email_signature() in both send paths.

Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
 src/b4/review_tui/_lite_app.py   | 1 +
 src/b4/review_tui/_review_app.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 51e1437..ab9e4e5 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -800,6 +800,7 @@ def _flatten_tree(
     def _send_reply(self, node: ThreadNode, text: str) -> None:
         """Build and send a reply to the given thread node."""
         lmsg = node.lmsg
+        text = b4.append_email_signature(text)
         msg = lmsg.make_reply(text)
         try:
             with self.app.suspend():
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index e1082e9..eebd1da 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1872,6 +1872,7 @@ from b4.review_tui._modals import (
 
     def _send_followup_reply(self, entry: Dict[str, Any], text: str) -> None:
         """Build and immediately send a quick reply to a follow-up message."""
+        text = b4.append_email_signature(text)
         msg = entry['lmsg'].make_reply(text)
         try:
             with self.suspend():

-- 
2.47.3

