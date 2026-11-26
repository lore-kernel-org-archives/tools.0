Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795718964;
	b=GX4fXURXHMJPOzPLIVqWgj1hkHD67MHj+MrU585CQgQo+qjXSRhhSy/T5p8+a0POPfCF
	 hOGQ7mIysSQScj9ElaShJuna//3gkqMXGHGODBhccu0rUEhsNzQXqba+iDhBmcNj9AchP
	 Xz8wt3bChEptfMNd/W5cBI4mKHt6cPIMOHwbVKoorueR5zWSYLR0oq1MujFbPsTh6ARop
	 YSxQMmXoMj1XVmLuK1PDMn2uG0FwMKZmqrdDKBvaoCxEhthiqaQQKV/P2Wa+r6AKywtPr
	 DS4fnXn0oER5+/UU1KS1FjBLenAHn36dEMJ/juB8jnslsqqppNkMLGjfB8mPpL046xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718964;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=qD7h7TAce8V1Tkkjy0dTkXhpJlTZipJy8HiTQ6luv6s=;
	b=QxiQbOy7n3XdJUwD8dJirTj3fI1kg69uDWwq4CEnpl1GBWM0bHeUE5E8oLtrkhnTSOUu
	 xHmH0EdcBIXIDnY7/QDR0Rys/1oc2AbuNsxvOsxwQKLo4Q/QP/YeKmv6COwE2ET1uktIK
	 7njnmxKyBndktkpoQTA8VWQkTfhKFdIsEe+w5cIrtE8AoVM62NB2Agj6zwOq2SMro1iM9
	 Y3cLOVWB6mMsPGEFjglv0rblzsOl4ppDbtNuxeP+T5UjyiuZASlH6CFq/cZUK1t/JVcp8
	 fFQ3x4RMM2irKmCohFtksX3PYeUiKrgZIZzrTz7XtzcC23TfzqVzoWqN+lXV4era/MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRuUiG2V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DA606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRuUiG2V
Received: by smtp.kernel.org (Postfix)
	id 810CC1F000D0; Thu, 26 Nov 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795718962;
	b=0ftHpZwWbNeSjybgKymmgPto77JvtZ+Veyuy75PoFHQaH46bzHSXlhYMXZAtzYTtWb3q
	 jmLBCvbaZadtILT9jpcGO4L392alFFsoCPUDW8pPdLrFWFwDZb3EK+pBN3Q1Ori1AMJLk
	 x6MDp5tjHm+W+cd/gNmM8Ek0kDJAOrPQNpG3bHgqnVzmmmgEWH3QCehe71mC+GYAxca+X
	 kuAFspE8AOIsPjvcE4ohvZr4bSETLD+o5Baw3kGvtpeSIJ8rpNWwCBvCuhZwuPjaKaeAt
	 1BKZtt2Zbwo/ATpjV3rBktFbkNS/FauIOAUb56wDy3dwF8XQc1jhD2V+VfXOxXrdBRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795718962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=qD7h7TAce8V1Tkkjy0dTkXhpJlTZipJy8HiTQ6luv6s=;
	b=piidJR/rRLvqNb8HMauuiAMTWwgRwflVC3GXkqTTRlSAZrTR+9LHsxZAKO1MJJNt9kKq
	 71GnBTtozUPgCspyBAFfcvGMzWBWcyZKfCOPEyJisakhCSsro2JorIyKpUAlucsJjOGbO
	 BBrOQgTGQW1yy3mHScZyNKDATGpwn0Qd32KCEP5MbJ6zZyp+qYANJF4J94TWB0pz46QDt
	 lVJOflr5AtTMiqJ9ScjJuWRO5W2N1M9HItvNFATnkrSYZyjuwIFDwFTuOLGoe5gx1hUth
	 qOC8v6w4HyQi7zlqFWwIvD5lrmhS6mgirnTF87cUqF4RXXjtV5HH+dai5AXmej051dA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRuUiG2V;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02EED1F000C4
	for <tools@kernel.org>; Thu, 26 Nov 2026 18:49:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gRuUiG2V
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 02EED1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ab5e64742so4440539eaf.3
        for <tools@kernel.org>; Thu, 26 Nov 2026 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795718958; x=1796323758; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qD7h7TAce8V1Tkkjy0dTkXhpJlTZipJy8HiTQ6luv6s=;
        b=gRuUiG2VGQBg3xfQR50RTu8IFKMuqHSrKqIJHSkTha5c3nGCdprMpbIYCqgLiNGXR2
         J8qWm1eeNzt8usUZqyWxPzVmEJcBFt2l8ivBMIKzMqcNTDhBJBaGOBKi/UqWngO2ZRAf
         XkX1T1z6755m/Vzj+tiN1xoCJKeszNM2LBBHxQqnmwXxUwlG9D3mSqmgeawGotmhyuVe
         4hzvFyUC7MuIN+ueHhVxnusfABMNuT8VGb2s8FpOUFCqfx8ltZS1BDgwQ/FykCn/RNN2
         IsdzbSy0LR5/6JTMETTOkw9Baidos8zFq0HF47U78CHPAeLJvxxXN1uCsSfhg3NjipO1
         czEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718958; x=1796323758;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qD7h7TAce8V1Tkkjy0dTkXhpJlTZipJy8HiTQ6luv6s=;
        b=O37anF67QgaIULmpwJJlKX0cGmD6loP9hxyvh+TDssaA4oKeX9m6M2YYo1lwpWw40z
         wH+TkMSsAX4So5F8Cxi9KLPEdLoz44diKZcQTwwt2kPhPdpaPQvE+n+4TAn79rtSNsrk
         hhd2zW7yDhapSttdfNgrsTZd9DGJ8m3AU7lPr9J4vnRuaEdlPiVScGmOgXbv7lI6YBm8
         aQrts/BuKVLxHQb3AIRmU80W6E6bBf7q9ET90LA/ZrAsa6LOu0Af3eDq/GgnLodl7LLt
         WWvTSyum/F7Q3s6FQjSY7+83hoGkfAwTgG1kofxfgdi2Iofmn/mPqIFa+o6xMOjov7e2
         xKNQ==
X-Gm-Message-State: APuU4Z8C+5UxMCSMlBKqtQKyiBhrOdrLXBL40TBuNq9VkNifW4Y9cjrW
	rUOy0hH0Mf+XbM9XT3WDc4CEhn6+fcM6lBFj9NDlY6IbgbdnrYL1Gofu9GzN1B7v
X-Gm-Gg: AZFdTZd3QlJUmA3ot/PJKHaIr5dlHvbzqtL904h9pFzCV07XGdlMwL3RAa48cbm/PSw
	YgSplE94Bk3FbNr7z6L2tA4mfskun+bg4oGxhmpt8PdwBvSSY3ZwVNhEDDm1o6RAGP82VnAkSLS
	9M3HcbmH7vaUN4rpfhHAn2DVgcDIvx1wAu2Bcl9HGQ0KFcTTr7D9eI86IvCeJI3j/5YblphqsqW
	PDYPrA9sGmcWmAlldBDW0ltD8fFS1G9hCpYPZCptq8lx4Uh5wrYXCDs03kSvGEnoojcERkrsLlm
	eJvFcXUpdTGCwyvl04F7bSmU5iF4mRrK5LwZ3CP8r89e7PdxclBuGdYH2Cs5aCDmh4YmQeZ/510
	/HT0gorciHTcq9A5m0wklAjGMBx58dyoYvs1uk3ZNpVcDmqddI2WHh3/jLh7CyY6CngsznbIh4T
	F4SxlerTfcyYeijsIMNI1EwTPgwxXz4qhTx7ghOzc3cATvzHxs/KMtHVJ7R7U8cCz80KVoVgzE0
	zuymjKQK1OWNYUSEYivweasQQTciTO/MrMnrycsXq1zoWlP0NZL6CEgag871e2/BnkLRlySU5mx
	JVnG3UGuD+qOEHmpGP9B1I67TGsLs0tuEHKpSGIpqjEgW0wWrD/kZG62eO9tmsVzuo9JdlAWV26
	6CnV4XhONU9PKrHEBdvtFADmQUSA8+PuFgDK6ky1pAhbT5vmHI2tTyqjKZ3cEDBAEGXCYHJwuMu
	RniyclREwt+8a0j+wBqMAtQzWacL3a3L6ZYv5PqcWQ5qWsvJ/GSIerJ1tjm4ldeCzpGbfoT9cN
X-Received: by 2002:a05:6820:83c7:20b0:71a:fb85:d05e with SMTP id 006d021491bc7-71b392aab2dmr12230301eaf.10.1795718957791;
        Thu, 26 Nov 2026 10:49:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6d8sm15315447a34.10.2026.11.26.10.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:49:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Nov 2026 11:49:12 -0700
Subject: [PATCH kgl] Fall back to Date when Received is at or before the
 Unix epoch
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
Message-Id: <20261126-submit-received-date-fallback-v1-v1-1-351156bfc4d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7aAJNKBXEReTdNqObVOZxCCU3
 t1Ul+/xeX+DxCqc4NZsoFwkyRormFMDYaQ4MEpXGezFOmOsw/T2i2RUDiyFO+woM/Y0z57ChMV
 gaK/GkXUc2h5q5qXcy+d3cYdpmOHxlzX05JCP+DHzlBi9UgzjoVaVQeJ5oZRZYd+/5hJrnakAA
 AA=
X-Change-ID: 20261126-submit-received-date-fallback-v1-c5916a26ec5f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

With message_date = 'received', an archived message can appear newly
arrived in an IMAP mailbox despite having a valid Date header. If the
latest Received timestamp is at or before the Unix epoch, liblore
returns that timestamp and korgalore discards it. IMAP then assigns
the time of import.

Try the Date header in that case and apply the usual timestamp bounds
to it. Keep clamping future Received timestamps to the time of import.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/configuration.rst   |  2 +-
 man/korgalore.toml.5     |  6 +++---
 src/korgalore/message.py |  4 +++-
 tests/test_message.py    | 13 ++++++++++++-
 4 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/docs/configuration.rst b/docs/configuration.rst
index 30b8ac3..f9e9dc3 100644
--- a/docs/configuration.rst
+++ b/docs/configuration.rst
@@ -579,7 +579,7 @@ header. Gmail, Fastmail and many other mail clients sort by this date. The
   ``Date:`` one second apart.
 * ``'received'``: the date the message arrived on the list. This is the
   latest timestamp in the ``Received:`` headers, which the mail servers
-  add. When a message has none, the ``Date:`` header is used. Mail servers
+  add. If none is after the Unix epoch, korgalore uses ``Date:``. Mail servers
   usually keep their clocks in sync, while the sender's computer can be
   wrong by minutes, hours or even years. But delivery delays can mix up
   the order of the patches in a series.
diff --git a/man/korgalore.toml.5 b/man/korgalore.toml.5
index abd6e6f..24a1171 100644
--- a/man/korgalore.toml.5
+++ b/man/korgalore.toml.5
@@ -329,9 +329,9 @@ header is missing, in the future, or at or before 1970. Patches in a series
 keep the order their author gave them. This is the default.
 .TP
 .B 'received'
-The latest \fIReceived:\fR timestamp, or the \fIDate:\fR header when there
-is none. A date in the future becomes the time of delivery, and a date at
-or before 1970 is ignored.
+The latest \fIReceived:\fR timestamp, or the \fIDate:\fR header when none
+is later than the Unix epoch. A date in the future becomes the time of
+delivery, and a date at or before 1970 is ignored.
 .TP
 .B 'import'
 The time of delivery.
diff --git a/src/korgalore/message.py b/src/korgalore/message.py
index e03bf43..23e9506 100644
--- a/src/korgalore/message.py
+++ b/src/korgalore/message.py
@@ -154,8 +154,10 @@ class RawMessage:
             sent = self.sent_date
             if sent is not None and is_plausible_date(sent):
                 return sent
-        # liblore prefers Received and falls back to Date
+        # liblore falls back to Date only if it cannot parse a Received timestamp.
         when = msg_get_date(self.parsed)
+        if message_date == 'received' and when is not None and when <= EARLIEST_DATE:
+            when = self.sent_date
         if when is None or when <= EARLIEST_DATE:
             return None
         return min(when, datetime.now(UTC))
diff --git a/tests/test_message.py b/tests/test_message.py
index 49c0e6e..ebe0924 100644
--- a/tests/test_message.py
+++ b/tests/test_message.py
@@ -160,6 +160,16 @@ class TestRawMessage:
 
         assert RawMessage(raw).delivery_date('date') == RECEIVED_AT
 
+    @pytest.mark.parametrize(
+        'received',
+        [b'Thu, 1 Jan 1970 00:00:00 +0000', b'Wed, 31 Dec 1969 23:59:59 +0000'],
+        ids=['epoch', 'before-epoch'],
+    )
+    def test_unusable_received_falls_back_to_date(self, received: bytes) -> None:
+        raw = b'Received: by mx.example.org; ' + received + b'\n' + SENT_ONLY
+
+        assert RawMessage(raw).delivery_date('received') == SENT_AT
+
     @pytest.mark.parametrize('message_date', ['date', 'received'])
     @pytest.mark.parametrize(
         'raw',
@@ -181,7 +191,8 @@ class TestRawMessage:
             (
                 'received',
                 b'Received: by lore.example.org; Mon, 2 Nov 2026 10:00:00 +0000\n'
-                b'Received: by mail.example.com; Mon, 2 Nov 2099 10:00:00 +0000\n',
+                b'Received: by mail.example.com; Mon, 2 Nov 2099 10:00:00 +0000\n'
+                b'Date: Mon, 2 Nov 2026 09:58:00 +0000\n',
             ),
         ],
         ids=['date-future-date', 'received-future-date', 'received-future-received'],

---
base-commit: c763e772f0aafea0ebf08d005a3e4486f13c6ec5
change-id: 20261126-submit-received-date-fallback-v1-c5916a26ec5f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

