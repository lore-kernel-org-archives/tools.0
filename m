Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730817;
	b=Stdf/QAeomiGDyVYHaAEooKS9aGEV/KuajnM539y7EItcTHAJPCjOvcVxQHETl6eLUxV
	 3+1iQQr+TX3tF/3qqOF2Yc/h3Wft4dd2f/1u2nZZ2mvpv0ifWJqj+nXV9lT+o2x66jdjT
	 tvJFtyAW+OTBTOD8YkmAndA0GpO+6OOmaNcg99o1EHkesDQMkz11pKoNZpyapIDlcgo8K
	 yc1Ia5tIOBLlizLyJmsHnUHVWxSORe5PD4AkcVsvmLgDhOee+g/Nhg8CtJmg06CE9Ef7+
	 2WDagIr1Q5pem/dUXf8ryEfesmVpb+SzR2qXq53a7SjT91fWEw5jnaKfLIuednxXasw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730817;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jBdsathH80o8RNvORTAtMLXKqWAjhx5rZA2ujrzoGlM=;
	b=RR1DTsekdV6kR6xfi1dpR2stLa8k9V/WMRucVvdjy018BcZ3A2ZUdja/NS+l3XNhBHdX
	 n2htlokKpbvfjSZ5dd8NRzz9+lJTR6A9hmo+Tkrq/lS9A7QNQVNbZ1QTBsjE9ZdjJSf0G
	 cdY6XWwjcCEhrDlb133u9MqD+dA+XlmGDAgSd1i/7QEv5XzFjxBJUm2I4t8rznpP3acKa
	 JwlkZQd68aE8PNn57M5D5Z5LPrdJYNBQOhiouEjz8ZoNtp6l7Utm22ZOLja52wRmH93c/
	 wm3q2/xjnhphEXxRdJwEb4D2xrdEQo5BK0qwHUWySwQtuaWLJeTGMZ65Y9Mir+Hb14Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3dXkk8Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F013606A31B
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 18:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3dXkk8Q
Received: by smtp.kernel.org (Postfix)
	id EBC131F00A02; Tue,  3 Nov 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793730816;
	b=Zk52shZZydYJUI9V/N7lxvpY1IPkfGF4wytxJgO++Zb11J6N+MT0dtpbqVlca5IdlQnw
	 yrVpSFA6eb7JYl5ApeuTCxYCBqb76ZYImlDQbxDz6TObjOcPLec6KTFzmFNdZjNGMmaIq
	 AE1ldAkmmgXE4lfmb9haDl+Non1qG2R1I9e/9AShr8HNBSNBRldpR6S14BXP2yQV3iWbz
	 9RHQfHZ16nU8Id8JrUeBUFRMVaPjS3gy2FSlnxj5hkeXyG1BP5fLZEDl3gO9M1cZbpE/S
	 EhbJ+78RwInRQxj5+Ijw4ImpU0L33gj60EruTxI1NE0NVUyzIr37rujb8BjEhJZNXZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793730816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jBdsathH80o8RNvORTAtMLXKqWAjhx5rZA2ujrzoGlM=;
	b=mYHbl+nt+ln6Wq3kb/frtFx57IcJO6MxtoiAWK3xQPSVop8dBbmtDkB3q5umvfWhqZou
	 XNs8IInwLaKf5Qqm0fX6Cw38VIk5qncrvdnpgqRtLFF1RkEImHR1yUCqVIyBu9d/UopN+
	 zjLOaVD96FtxWv68V800F7/DDSJgRWlxPcvAukkNZSNAoZWrmvFWN2sBv99CqnIUQMrZk
	 6iAHDLGmIp8ZFZW9SnO5T5tF16tXrqYdzLVX3U99RVo9Jc4rCAJMcy5aMOJyaI7R74IHc
	 AAheTeh6s/py0mXPZWlpr/2av7wueNaGDnezIMCU3Eh/W/yLReikHB5Eei2Kuasz+Jg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3dXkk8Q;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6561B1F0093A
	for <tools@kernel.org>; Tue,  3 Nov 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3dXkk8Q
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6561B1F0093A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so40458505e9.0
        for <tools@kernel.org>; Tue, 03 Nov 2026 10:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730815; x=1794335615; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jBdsathH80o8RNvORTAtMLXKqWAjhx5rZA2ujrzoGlM=;
        b=Y3dXkk8Q7I3kLUMGbxa4rBRWXC/rYZAtQghjQZU5vnpJGk2Wq0kLu6jDMizwRmYHvY
         8FfEsv/jvnNkphUlqVCLRmdWLM628tsLzNWrFzv8f/EWn7ogJHxfxLlR4UWTDMmBFIXm
         oGx5IkAgBr1UOURa8r70e2rFozOf0CQK6yJ9pX9Op5Cxo6Hyvjtgx3PmyTl1kF7y0g/w
         0uuTuQMCn6kwcrtqx8K95kqEWe6khLAisJSonohKy4Jk4smnbV4lhlQIjqdOpv9rroe0
         hsdaB6v0QobjJ5/xju2LBtX7nXtQoTBFlgfINYwnssfK3THloEihKY8VaQjvplYgrzEj
         J3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730815; x=1794335615;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jBdsathH80o8RNvORTAtMLXKqWAjhx5rZA2ujrzoGlM=;
        b=WXLg8ya1bDdaO24ufcV9GGyO/LiP3NQ+Ugg1NuVW9aIfSv3236zbBnP+MLD+it0HLM
         sCHQrX/U1FUHBjIa70K32f2Pw9uJ8tUZeMIDBUlzL7q0EsJb3B4BJyryumrtFPZ1ycCI
         zPZ6ko44+6Gk4XsU6sSy5+pes5wfn4YM/OVo8+XP1OGQKRSp7hlfO8uptbUUqlDhamcJ
         VQ1suajOcSdLLYDfcCyXOJMOpr8zk68Pyz7WxN7SoaCbxwCkTEaLDOhEvLwCF848BRUB
         kluF0pTmkcO6wpAN6I6K1IOQnPVoK/AQQ4DFOHK6W7LQolXvSEpIPjmc0qzYBTdPGKme
         z3qg==
X-Gm-Message-State: APuU4Z//gkl1fjysMXe+bArNYhPfTsfoco7WbU5dxgfWra9iMuFzeP3H
	MSTAimEbH+tudx9KcWognhgDScsfHu+RCnAquPgQB1YZPa3/1NOikkNS/0a7bBk8
X-Gm-Gg: AYBFou24Vz+xmv9zUVJZh+xI6gmPppSHKX0cQ1kFWfwztqhpDL8eNmlRkyTODc6hk2A
	CruLklf5cvVeBAZAxWGSB1cAHMQGolkL10q5WPXjGDnYB3OLxzzfDehnVa8+xD45+SIBN//8wIW
	D5bEQ09wL+95E/hxsp4Nwd+BBq1FjmX/Crr8983LJH+WW5FoVRROt9WnrYx5qxNlpVpN9MT3xcP
	+4x9IcEXMjEIj6swz3TbpbT0NTKItFaEtIqA5EFDvmSgHI4HspFEL5mqzr8wRy6CLm6KHJJU8zt
	l8X/cMelwmeYMAuDwA5jhNhi2/BND6p+YjSU8rlHMDlPdrbI5XIU6B5C0/R7z1dyUE3euaT0seB
	ysfs5ZQUFYe2hoqSAhoetR4lAYF9NNiyhIjKU5jB4BIL2KNLIzfdl2mupdSKn+AbjBFKe1GYyjT
	jFgJxcAgRODYp34m7/yro54hYvfHLbHECnRdlEUZ/YAFQ+AUUuFf5huy2dJASigYxayjSclN1T3
	uyH0Dt5SLwuVmZxWH1bTVp53WU0S8XlwhxmoviwSd8ESfiIvKhLRZMOv+sfoVVCSFFhaqC78FpE
	m4bMnLzwTejwiMqi9B0UckPLB8Jhg59wPLrIl2VNrAlEIav3jVfxu8DOBeI0H2Yq/iE=
X-Received: by 2002:a05:600c:3f0a:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4ac1709a2d0mr306293825e9.14.1793730814610;
        Tue, 03 Nov 2026 10:33:34 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f00sm1749315e9.2.2026.11.03.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:33:34 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Subject: [PATCH b4 0/4] review: Improve rendering of follow-ups in the
 email screen
Date: Tue, 03 Nov 2026 19:33:31 +0100
Message-Id: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAPso6moC/yWMzQqDMBAGX0X23IVEq5S+SunBJF/qFjGS+Afiu
 zfa4wzM7JQQBYmexU4RiyQJQwZ9K8h27fABi8tMpSobrVXFi2BlH/o+rDyPiacuonVwrKoatbG
 qeVhPOR8jvGzX+kXmTu+/S7P5wk7nk47jB5PgRs6AAAAA
X-Change-ID: 20261103-view-follow-ups-threaded-035e5bc068cf
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793730813; l=1763;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=sROErfNUnr0knvV0JkMm166zNwWoVrsw0VdNvrf9bGc=;
 b=rngHtMJXZW5mQ6kEA+ON55ArWdApYk0JGXW1XAc9DCa/AnoN8zanTnfzHuqwz+mGVy8wjHI7m
 W3nWqpRMuZbA+KZqAs2eXQu2Ew6a2FO5au202eNXOoHq9U8ZHIY+Mww
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

The review TUI currently lists follow-up messages chronologically,
so a reply can be separated from the message it answers, and unless
the review was updated recently, a follow-up may be outdated by a
newer reply.

This series adds a threaded sidebar view, with indentation adjusted to
the available width. The F key opens the threaded view or switches to
it from the chronological list; pressing F again hides the follow-ups.

The series also displays the cached thread first and fetches updates
from lore in the background. New replies are added to the open view while
preserving the selected message and viewing position. If a refresh fails,
the cached messages remain available. Refreshed messages are retained for
the current review session without changing the stored thread snapshot.

Two preparatory changes protect a reviewer's draft comments
from being overwritten by their own follow-ups and preserve
the view position when follow-up data is reloaded.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
Bernhard Kaindl (4):
      review: add an optional threaded follow-up list
      review: protect draft comments from follow-up imports
      review: preserve follow-up view position on reload
      review: refresh follow-ups in the background

 docs/maintainer/review.rst       |   18 +-
 src/b4/review_tui/_modals.py     |    1 +
 src/b4/review_tui/_review_app.py |  285 ++++++++--
 src/tests/test_tui_review.py     | 1079 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 1328 insertions(+), 55 deletions(-)
---
base-commit: 0a9e800d0d0b27a31a641182f257a5842c382360
change-id: 20261103-view-follow-ups-threaded-035e5bc068cf

Best regards,
--  
Bernhard Kaindl <bernhardkaindl7@gmail.com>

