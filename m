Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716186;
	b=J+qGZxekeUkY5K5lRLNmM7KY1h/eDemQkKLjf4SIBCkFR94Lilbqj637lMx5vyI1XPqH
	 UtBZfJ2qNvew3hANboj9q7C8i/NXdjzhOnarJLoTttMbHzaowyfxvhE7WW9GSgaLnyQaq
	 eFkLjDP/cKDL6Txjbs3JlpzUebb73xuhkmEJdY+hxWibxQU4Pgo770N2c6n2IqUZhigtg
	 U/1y2qYfII2X5ro20i+w/2vRyI4OTz+K42m3r9F9Tx786aPO/n2VFLAMGONrmPays8CJ9
	 pRNTilNL38+TywmkqnpjvQ+/P9cOMNCEPsKHe4qoSE56k149jINJPknQHkE75wNONTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716186;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=n5P8SumX85pmAMFmpfCcv2dwvbiFnhS/33NEAUkzoto=;
	b=Ohc0RdmXJz5etqQuyHxBW71m/xTXgHC5QY7V53dpGBAwCaVxEbkhhmvHpZNnv6+FJEUb
	 yJ+Vy2FRRIWIYKecPyXNz2ogbPIvgwBM2mKFAODIO+XjtgkuxpDZTis1iNV4YkAxMfq6T
	 PulQznPT8auawgp+ASXjazko4XFEt0ECzyky015EzCgl2nQpmKdT14KDGNRBakdgjW+1W
	 juzgd6ZKPhET4vzfwbVQEzbH+BrQxdd5Vb/CJAWcw+823blj6KDT6ebJaKUlyIKdWfOMQ
	 BTwC6aKe6jZbgraTLE7IhRHPVcjP1G4qrYStE6GmnEog8UgZ6d5qkj3kRcZENfkxQbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVurpPB2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A70606A32D
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVurpPB2
Received: by smtp.kernel.org (Postfix)
	id 7AECD1F00919; Tue,  3 Nov 2026 14:29:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793716185;
	b=xdvXcy4Is2bC+XgMB5AImfQIzS1OWJy7bqEm7dxtBODcWF87wxWKvAV1DfF+EYwjK4g7
	 5g7x2zFU4cOoB8MWq5Bg5eR/SWSNL07/w9Xk+jGdBW9SdE4GiQq37LGCAuRWX6bN3r5jQ
	 plYj+JHC4liDsK6N+4lyagvvOT+txhId8d/lr/JS8sgjIUkXxxJTXpfFjw2NMnSiEzyLB
	 ppZTYUYyp16uRENm1YGlr9JxcmCRMSqL9Mw7a60mJXuxDQsxreNSPNPDgGnXEK7xR0qgQ
	 kA75ue7rVm9mp/R69a0c8WHHU4vBIZaTLg2VA03wAmzpW9V/TQFxxrPq4H4HSl3mqeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793716185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=n5P8SumX85pmAMFmpfCcv2dwvbiFnhS/33NEAUkzoto=;
	b=bJk6CATbXjo93KDyZK4WS5/4Ac3hnu+2Y5zJoau2uNBNxUx2hGUtRyQAoiB3AV6GDblv
	 bXnqEzPN8e36ggk98xa1EMU5/o/3FifDfzgQ6D0sRIc45BbjWRpz56FN7bQRlKLee4OdM
	 QiS5SVlhMRFw0urRBQ9HEgchO6SQFU9MA49TCBig1YEcaOE0Oon3aTGqfuiZm6gGBD/wL
	 LbVft/scHWng67ncS0ROyxFEBVb2Mphz0DqBLy1mY7moCOkkTY05bhZAEjOWCiTGQU7zJ
	 kvFwbCx+ZTg72sAI20Ps5+ZmUGN8eBmN0CSLKVne5d3zk6R+sRDWd5FsLR3AycYxA8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVurpPB2;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF4041F000C1
	for <tools@kernel.org>; Tue,  3 Nov 2026 14:29:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVurpPB2
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DF4041F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso33911095e9.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 06:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716183; x=1794320983; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n5P8SumX85pmAMFmpfCcv2dwvbiFnhS/33NEAUkzoto=;
        b=WVurpPB2kopmhMDvFQ88BkTSrip8zmLo1y/FWe4F0eYab8wTnEdD8k9tQsaPzhCuv1
         zLyWShZ0El/MEdy7F18bVT/AUA25Zz/ViwBW1dVpTif6wGjecEhR5BwD4Y1SkvpCo24J
         mhuqWhk4LkOvsVw7WTtnA4OAumFGmO/yKAPMx+xhvAUAVus2ZVcVpGt795B6iuEBAsjm
         Mk/XRh5xRzxS6rErZVet9sOzhBqWSGylSiHAs6X2UC2BO+FJX+bZBfBahfYi8p2ij+zT
         mVgqcaCF3JlRvPAtjeu5pQ4JeABlTimz+vQwEDDC/6a7svzgXTypWm+BKvFtIni2gIvI
         hzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716183; x=1794320983;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n5P8SumX85pmAMFmpfCcv2dwvbiFnhS/33NEAUkzoto=;
        b=YM2IHfH3KcsJQjnRuCs6EPOpsPyp0tGwIF5VU/r3Xzj7Mwm8cRvMQa+tNq13TqP/Fu
         XBFrca4kXBTH71jRjbD8u3N8Rbj3R1K+my/JhvPO4SzBlTORWmW/CiTjAe7ByO1t6Kqn
         vlZtF4VwIkpQJNHJLpVt/oOc9xvW8kM8wkdGLQPi5XlEcEP3s2aUHES3BkYxqCpIpN/4
         8L4b8EoLpi7/MtpechJoWpucSiv3BtDXkMsk7eyeFpDgcYpTXXdmf3j0aqsogOhdEnBC
         0J3ISt83rjdfkOr6lTura58Awps3ywvvHKyDjtHz+VZC5uhxBoPL4LIUPjqQv1uJE0d1
         /mgQ==
X-Gm-Message-State: APuU4Z9IyyEQzSZHEAFVgnmRt1INT/6WRcHfo/5irABWHlYy3VFhWzmD
	i0e//MvPlBmg/nIlRl7fBRVTvEfqDvSTon1lp6qakg+w10LURnjNITZh
X-Gm-Gg: AYBFou3lRgHCXmb8LoxxVKPqi3mgesz8xGhab/j5cFx6fAvtFS4I9fpWxhxAnWSCnJg
	W0e/YAziwHjaUp3XP8r5YK5sx/jyb6phY5SZMlnbWmSejZz/KbwrsWW6WYpnq68wRA4m7399sgd
	FNWwN5WNWqKyUchAmosla8Bq3fS19Dq8pQwZOL6wQRParkAcw+sF7WxK+zykCXyDi4/m8IiMIBf
	j8GmjWEFkk95dGd0/hQYwKMOOw8smsMz182h21oSvdahaaWxYt+yY7HVMYB5D2QvPsLHJWwokTY
	nNE9LDuUeUqIVIuPeYxVnPFnFvEZv/Ng5lTWTop3R8h+o9lSqV5beL8vTzx+vsQ/1HTo5D54Nsp
	ck14eWxore9t86NI4dhtBz+dNI0jBfoKMPOvQjZIIESgQ/xAvRbo9EuIsjLYYqRouKg/5qwGlIA
	+IudX1bT5ZHRmMWSrXE3OddaTfRIT3+UOINXXM8r5Vcd0pd7QOQevCluIsovVJwlMms9c9YZP8b
	o2YWCqpNUd4ExK5fF0FSY775nGMSmhsm5SDYkx8u4Ix/oRb1CWOxfed9Yhr94ikExw7t5lm1lpv
	IGbE46sCJj58K9Jxpw7GIViE7a6Lqv/YaC3nmBSGLkaVJg==
X-Received: by 2002:a05:600c:e552:b0:4b1:4da2:ca99 with SMTP id 5b1f17b1804b1-4b14da2cb6fmr97803735e9.10.1793716182891;
        Tue, 03 Nov 2026 06:29:42 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm65290805e9.11.2026.11.03.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:29:41 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Subject: [PATCH b4 0/5] review: edit tracked series in the TUI
Date: Tue, 03 Nov 2026 15:29:33 +0100
Message-Id: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAM3v6WoC/yXMywrCQAyF4VcpWRtoQlHxVcRFZiZqFKaS1AuUv
 rujXf4HzjdDqJsGHLoZXF8WNtYWtOkgX6VeFK20Bu55S9QzJh/foSi14OSS77gCqDJo2RHTXhj
 a++F6ts9fPkIa4LRu8Uw3zdOPhGX5ArdELzJ/AAAA
X-Change-ID: 20261102-browse-and-track-series-ea4ed71218a2
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793716179; l=1510;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=ckWtPMNAK0sOz72AxbTFSwBg1ktxBk7OV7BtuGztumw=;
 b=3VDovJKMhmtyQg5z9c7k441I/EylIhgSdJENrleZizsB/CsgKx1+tcm0Qywfe6/J8XXTOdB8Z
 o6V96DHOXQyAXw8LHgMr0Y2hF9Cgv6vhKh6WqgC3T/NRLc7lWbR9zoK
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Adding submissions to the tracking list requires leaving the TUI and
running 'b4 review track' with a message ID. Reviewers may also want
to abandon several tracked series together when cleaning up the list.

Add an edit screen, available with the E key, where reviewers
can browse Lore submissions, select series to track, and abandon
multiple tracked series in one operation without leaving the TUI.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
Bernhard Kaindl (5):
      review: Split track_series_from_mailbox() from cmd_track()
      review: Convert track_series_from_mailbox() to use LookupError()
      review: Add shared tracking using track_series_from_msgid()
      get_pi_search_results(): Add flag to raise errors during search
      review: Edit tracked series in the TUI using the E key

 docs/maintainer/review.rst         |   17 +
 src/b4/__init__.py                 |   11 +
 src/b4/review/tracking.py          |   78 ++-
 src/b4/review_tui/_modals.py       |  889 ++++++++++++++++++++++++-
 src/b4/review_tui/_tracking_app.py |   48 +-
 src/tests/test___init__.py         |   14 +
 src/tests/test_review_tracking.py  |   66 ++
 src/tests/test_tui_tracking.py     | 1267 +++++++++++++++++++++++++++++++++++-
 8 files changed, 2374 insertions(+), 16 deletions(-)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261102-browse-and-track-series-ea4ed71218a2

Best regards,
--  
Bernhard Kaindl <bernhardkaindl7@gmail.com>

