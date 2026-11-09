Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216076;
	b=cSJ1eUlkFQFQ+yXDZ93mulefdmDnjPTg2gjq9QnDYV8g5K86hyPEONOQqPRN93dBdCet
	 71FOhDuD60pS4zamSkH2cScH4HZUXL516kfEo7y2nkFR/5OLgb6lIK99LaX7XCcNeH+bm
	 BODJ4gLNQY+EPxAc9OYveYnA5gCOR4MscKtzMU3mvdX/ET3FOhaTeS34YcKfZsIY6aB25
	 /q/RcuZB6ZIMGwaft2NiptsqBvzdtTf70RuzhU4vbZrNitPMCQ0PyxEYpI20gxiPGcVl0
	 tJuCoZU0g5f8O1Engh9zj3sIgiQkWZfV8n0qkFBb+anXAe3xh3JuMX6Iky3Z5NDfLLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216076;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=Rp4ubtyNS9Qm74tpnwmSfdsvxZwuOg18WkBsWL4+Zjs=;
	b=VZ4hlvAz4QRIpy8x9UMJDE2/13wg4DIlS3nftRoWxQRPyzW71lFI1NWboHMrFjIYQvJV
	 tkh4FMgMZwg425xqIcKpfmAL48Kkk02CwE1HI74qcdISZaT1uC/u1MFv1F40yrUYbYk0f
	 9DAuUVSJhBqDatyCupzQbleWstmADVVTkJMppVZhrFyxAs8RX9ui9QNOQ4IIlUmVOe6NE
	 wesNq+hGGqy68dOjDY8QjYYanWhF8Vghyrg+5B1EideGhcu3hx086G6fUurdanfjsQk+N
	 JbLoVQuBL/wqbcbqbYhILbq1wo0xdNF7Tkwxj9vhTvZMbGc3CLfTRX2QF1D3uLM54CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eeeok30w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE18606A31C
	for <tools@linux.kernel.org>; Mon,  9 Nov 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eeeok30w
Received: by smtp.kernel.org (Postfix)
	id 056011F008A2; Mon,  9 Nov 2026 09:21:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794216075;
	b=FSEzDaqxusiCLaDUzEFfIGeQ9f5h2pZ+xdZULubd8vN+NY+CTyrlxVRqGL8Bx3fCVVxT
	 2kFm134QWs6mMNk7ulRPlU8Z8p5FPqZmzXT7agxkjo5lx0dO+cUeGnm+vLX/R2bFVQRd2
	 kl3edOH9mw1DGMkxjSWdJdntgDNHPb2zKhRShxLsnrsjI1RtPeP4xOTK0znrRhI0/WB2H
	 lMvOrtPesm7rq+xXA1dkvrz1oLZND+civIzFiLzXdrXe08MN63Akr4Z0eMTn2kbzMG4ND
	 XbLTR4d8L8940dBBfmX/72Qf0pfpZjDbUFmfjZm6HmP28E9dbF+DC7yLdIUB5WXrLCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794216075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=Rp4ubtyNS9Qm74tpnwmSfdsvxZwuOg18WkBsWL4+Zjs=;
	b=I0FM7mGtzPMnNg7O5qk3FdZIb9i+dPRokKiOobaBcgdranVFMX3bTWxwq7l4bq9m1OIs
	 eWPbFnaHTNu2m+RJSOVVKFmQ8P04kaG0bRldxKiKxayqRdhmuohgNOk2RQzDXI0F0DO6U
	 qqot4tS+i7HvYT/7iXjJ9meCNuL4WV6/R8iqEJfN0oE71s+DSELmdGrXhOmAr04rXJ+VS
	 po+n7EQmsNMyL1WsNTcyx+XsVC7gi1/ooHyMShlZjwNGhxKSkhWLNs9BmC54f+F/aitir
	 SwK0aFu1pQkqDmCRlp4h4fW/qvnI0bLjco3eQieFODDv6RooZIRhOqnzw4ZQA9p5Xgw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eeeok30w;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 841D91F008A1
	for <tools@kernel.org>; Mon,  9 Nov 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eeeok30w
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 841D91F008A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so3755105e9.0
        for <tools@kernel.org>; Mon, 09 Nov 2026 01:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794216073; x=1794820873; darn=kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp4ubtyNS9Qm74tpnwmSfdsvxZwuOg18WkBsWL4+Zjs=;
        b=eeeok30wnXodv1x+cR6g/VaPb2O9QmuRR4/vcK/HbjfOhpHpCN2fItV/I/kdqmeTcT
         UlZy99ToABdBgfrFIDmWEUiE//R8n09ptgtcbgkb0ypThjlKyiEZSKRqGA4whCJkkco1
         BHRawhwFSZu1Wd0RXtco6Q/ovPZaYnRmnFfr/JmUNzgr93U/AJOtQDv1G8qEJVNwdsOX
         4GTJfrSjO6zRsMcSrzZJTzYXPj/35c9vIQ0Ny/t6NS+PRoGfXVwue2YLFUv4m6AFImNW
         QHn5MBXgrVnCXtNckM2bZIAec90IYI+n/sk6wNMy0F6oX3H21PA1WxUnOQZjvnutkC55
         tP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216073; x=1794820873;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rp4ubtyNS9Qm74tpnwmSfdsvxZwuOg18WkBsWL4+Zjs=;
        b=S6N6G5cyNgRLl0mBgGRYQJaZz+vZD3U3gH54d6GxWGChG55UQjLugc0hc6mTETCrKn
         0Sb6DmTXcPdlEn01bQA6CU8n0esyxO3XjjWWVrnPQ1I9xTQ6g/J2Hx50Bty6oksacBWe
         SbQT4wfTmixBdqOIl3AyZRY0V6On2qn6Yqa2r/19cDT6qe4Q1oYMmGgAsj46Hwi7cmuZ
         8L1AJ5fzyke0lm5yyEbFaToj5aqViGafIA7LH/imM5kpN6O/M8JSDvfHOV4oXck46SAY
         y+6UU+fMoyQqXpljV3dRLClADrWv6daJasG4ZYMX4w8nAIeuz5hdIdqa3Ksj92nxK68e
         EaRA==
X-Forwarded-Encrypted: i=1; AL+hErHVp0PY1Y7egs4LO2NBba/QfCH1PGzFnbfh8t9UzghB4ZA50asuTLR+1XQn1ZcflBxeipfJKg==@kernel.org
X-Gm-Message-State: APuU4Z8zbg3n6E5tuxHQNkbofVnOKfqiy1BbkosV7kS5l1gzBsHKnBTW
	upxtUIOPGAXqU4hfGXkrSO6rowP98ZNzOwM1OUI1N4gGaFZ42xstNJlNXWLvGqBTzLQ=
X-Gm-Gg: AYBFou1fjK2+No7s6S/ktlAIEDj6IHaO0ddxEUszM1i3T+ng8rXEeVP248lcjKl1kG/
	L/77QZANEhwTMI9Ldml2taixjldD8hhpyQU0NJI2bbRuMsi+OlmO8UnM/z6D4tpd5xcg3zjpDZQ
	y0WZkxjsoOEhMnu64XY/xlbFB3c6rOwNTvPi3AgjXBGMKwyK8OdL7kim3JLjminvBnaPqDEFBlo
	2wGZqlNjmMvGzgcuExZaX9jLRDr7CHaBsZ9uAmyyF482oMvQAvA5WYiOfRcdkA+gemmBFKTkvt1
	Ko/ci5cHHC6EIfVY1VDJcRSRLHXEJPAlKkVOg07qY2yC3Ub6MeN3aBQa3FcLqAJt+JAd+/GZeug
	qQJZnnr4w3IrvKBsw8UJo3Siqa/wPD0KJ5zYn07GXcUkCw1Vp4613WoPu5ZGLo+z8je10R8NVec
	/X/IOm6KznSVRHWekEQXjYQWe5z99VNhQnH65Gu/2PAArPQnHrp/ZhiPPd6CyRICZqx/VAxPHUN
	7KOQCby3mn1giLHKRzBaPdTLB2ATOdc1LRPyJt60+WR+qzD4BKsCDwN02YCfNqzM3KnQyMBo4tv
	53b3K1Axe1OnYpVt1eDucGQk6S1SGrbkiceTeAI1CJCKvMRh
X-Received: by 2002:a05:600c:3486:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4b94d762e7fmr70696565e9.2.1794216072845;
        Mon, 09 Nov 2026 01:21:12 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm113283885e9.8.2026.11.09.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:21:12 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <masneyb@kernel.org>, "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Brian Masney
 <masneyb@kernel.org>
Subject: Re: [PATCH b4 0/4] review-tui: add support for setting the delegate
 in patchwork
In-Reply-To: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
References: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
Date: Mon, 09 Nov 2026 10:21:11 +0100
Message-ID: <1jbj7y1htk.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 14 oct. 2026 at 20:03, Brian Masney <masneyb@kernel.org> wrote:

> Here's a series that adds support for setting the delegate in patchwork
> via the review-tui.
>
> Signed-off-by: Brian Masney <masneyb@kernel.org>
> ---
> Brian Masney (4):
>       review-tui: show why a Patchwork update failed
>       review-tui: let ApplyStateModal update other patch fields
>       review: add pw_fetch_maintainers()
>       review-tui: change the Patchwork delegate from the pw browser
>
>  docs/maintainer/review.rst   |   6 +
>  src/b4/review/_review.py     |  57 +++++++++
>  src/b4/review_tui/_modals.py | 220 ++++++++++++++++++++++++++++++++--
>  src/b4/review_tui/_pw_app.py | 165 ++++++++++++++++++++++++-
>  src/tests/test_tui_pw.py     | 279 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 718 insertions(+), 9 deletions(-)
> ---
> base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
> change-id: 20261014-pw-delegate-b185593a1837
>
> Best regards,
> --  
> Brian Masney <masneyb@kernel.org>
>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome
