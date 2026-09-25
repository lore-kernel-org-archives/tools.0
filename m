Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF273494829
	for <tools@linux.kernel.org>; Fri, 25 Sep 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332218; cv=pass; b=XsEb8GFAUhnQzj9BuQpa7P1ga5Bpb7EsABVdvuVXyaktFU7k+d0kysj00ObBJL6KhYCn/hbnK6oJM81KJEznp+mYRPnx9B0sv4uWjjD2FJOnrVzYRXVC0n29Vh+sqWXpnC7n9tdhVzx4nFqPrehf4zGiCnJRlwPzysm0dKUQKcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332218; c=relaxed/simple;
	bh=3BuksN1Yf2k8G7J+TpGPM0C3hQpSLuhbC11WCjvKcuo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DIKBYbYsyfXt7MwupndI8kqo9PMqGJbBHpU4UGrSsRUBYJ8fYI+Mf7tjkb/LxKAWkJ+A3O1zWII3rrhbHMLa8wIzFbGHA6HwsZqQZ+5Sa6bEDz7YySUI5ZGlkAVNjj3rKWAPZvjdTdSKIUqQY8uCJpLFvPq9gBM+g4L7yP3PrEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a5Fo26p9; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a5Fo26p9"
Received: by smtp.kernel.org (Postfix)
	id AEA101F00893; Fri, 25 Sep 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.76
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790332216;
	b=ygW5ibVxS5pL4LPGdvh3jQGbFUCB1ucHeYvdQEblBY9i2K/Fj6A0smPqja061otgQcF/
	 IEhvEvN5fRRNyFA/viBH9NqX3NYGsvRSKWdK/8Iyb1s9frmfg3COyqevdxNM2yzQxUR82
	 Zyi3oWAZnat+nmW97jEkpV72oO2xIedNxHxhPWHy4+Oi+CYbbAiU/XLrDVwX6Av2xt0DW
	 leAGaR7XA6MjDFGCGSlkt4LEVMGtmVCAdtI6ET593OV+Mg54AAJAzba5mgpmVOg5aZTuR
	 KhaIc9McquWXLvYP6JCTOMcHbsDs6YspVmXdQMB2H+pK3UZNwwWfe37ogyzcCv2qbnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790332216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=1TPCZuo5fzPyQ58T1Ti1NKn2WRSs3Fy+AWGlAD+WBko=;
	b=dQciJiaaqLdQPQQdHyC8RaVC3mkyWkNQLyNZizVjfO2MJi+SFu8WBnIbgvgnFZkywzlP
	 cJ324K5Bq/87swe1571A4VtctDYabebQPzuleL6ZwNW29bQgZUAsaj1Q8yI6uZQIZ7nsL
	 9XsaSf7T+ZAdajYuIrao5IJ5ttDZYRPA1ygvi8Y36+8raSBUAm2lhZ6WjiiehpKuO7vaG
	 5gljkhLpKL02JVTA86rAhRfByfITa7ACz9M7WTVVq+VuioO6XgnrZf/cTLk/GbclYd3BJ
	 Y/UjOwqtYBuhOxcfjLwyfkMK94begD3iyA4t30d4CdU7AQ68ia6oBXoSKCUNsabLjEw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a5Fo26p9;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.76
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B6EB1F00898
	for <tools@kernel.org>; Fri, 25 Sep 2026 10:30:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a5Fo26p9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7B6EB1F00898
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so447637f8f.3
        for <tools@kernel.org>; Fri, 25 Sep 2026 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790332214; x=1790937014; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1TPCZuo5fzPyQ58T1Ti1NKn2WRSs3Fy+AWGlAD+WBko=;
        b=a5Fo26p9MHbQkaWNCx95HyrPJffePeLsDmo0sNqsL6wDIw0vKkNeQDt9FUXDeOqWLT
         NA2Fy3DUydKysoTaLkjz1vd5xHBTOjp85KIPE8EH8X2k30kb6zoj/V0GgBu80yZDmU8e
         YSToW6pZQIdgyWT+kFBbTdkvhzCntc7tSkuDhYPIO6Pccy+0us38S/9uD4XavojX1JC0
         ihGHsXOGqiJgKUSLQRl+MKn6i2m4nBFA8Dy/I5To0o7ysuIr5lIw7+SNIJQ+oYVtFnnC
         xHseJo3otWadY7UL+3ar9Jnjk9QSBhmmrrinYTs+jUuD3V1Ima8zcloHcn63tgJgIb+c
         4oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332214; x=1790937014;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1TPCZuo5fzPyQ58T1Ti1NKn2WRSs3Fy+AWGlAD+WBko=;
        b=jLIKp4e0+ykdFNTELK9akofTUpKs0DKfTW/VacxFsio4GVvY7iuVZ4VJHysdTQWNpZ
         3E8s0JtsWmLbsutjMzmewQVjMH6lq8WRyIyEPFUk5fsYNJAfqgXEMoydOlP9uJiSwmgd
         tS/RAZy0Bn2A09Zsj9azDhLcw8Sjp2uNtVJRprUB131STyHIGwnL/dIdy5dKOL1SlDLj
         BVjFjMVkdA2Zv5BE0x+KnCwiW3WXulnvetByXu4X6WA4EiwCuQTjkJrZI59gZcU54Tyk
         5QEqiWau4TZ5aTB3eoH4H0BK2b4K6AUgpWFd226KIBfpQb60zuA063X3R7HyA3VUdtM1
         GdSw==
X-Gm-Message-State: AFuF++ldAMO52zFnilIq6XFwvq0Dtpch3cPDoVUTQJcpR5ShVhKfW6o4
	ow2LP4E9rqzgLQAlnCDatLw4XmigsDErmFQuP/cbpSJMMYuU60X0vAI9RemwqugSiS4yLUDYmaa
	Wicca
X-Gm-Gg: AYBFou1z/PaAqoR9B3XXLV/uYad5WOxt2HJFdy6InY4LsrZK/M4UtCcD3zhfUqrNBdA
	22/NTDxXVvn+CWd2mWXfloR4hK2Qi2GD9obd81p2rtnCPl6CvJ/EXkfoWr0B+6G16HX2N1kxl/h
	A0gaS2n07irlzj7do8lsrV9MhgvPxCwJJaKxLTsNeX5ySQZR13cpQj1wRJaBaSW/BZBZEW2c/KL
	cHe7dFgBhHbzb5KI3igYBuMuo/i8Ob+srifh6we12+13zKFCi7T+JDbgRwa6aGdebaLfeQbISsb
	wA+AhSFQblu1z0JBHbuWgbyAdYoYpj4qKC2vSQOertP+favUCSJbM3WoySb4id5JWejr9Kt0T8A
	MSxQ/I/52oaUmnDlNi1C8gwORqH/SXMgFF7VQ2nMj078zdLC8A+3ukUoZXBBjJnnGM2JpM6cSEO
	/0oqD/WPY4H/hujhwWR8EUDZxUQ4D8XezPynjl8yF4NDBwtCzIWGDWl1zDAK5d9JLaQLCInqSAk
	WQu72FLLZb/tUeE/mv+CaufjFT+YM4=
X-Received: by 2002:a05:600c:3107:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ff06e502dmr32260865e9.16.1790332213728;
        Fri, 25 Sep 2026 03:30:13 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm40706185e9.4.2026.09.25.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:30:13 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH kgl 0/2] Fix mail addresses parsing from `L:` entries in
 MAINTAINER file
Date: Fri, 25 Sep 2026 12:30:10 +0200
Message-Id: <20260925-fix-list-comment-v1-0-0c4c9599d3e4@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADJNtmoC/yWM0Q6CMBAEf4Xss5fUQgX9FeODlBNPoZBeMSaEf
 7fq42x2ZoVyFFacihWRX6IyhQz7XQF/v4aeSbrMsMYezNE6usmbBtFEfhpHDolMU5d156qqbRy
 yNkfOn1/yjGc/4PIfdWkf7NM3hm37ACsaRct5AAAA
X-Change-ID: 20260925-fix-list-comment-08737d544b85
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

While testing the new maintainer container[1] tool, I subscribed to my
prefered mailing list but I ended up not having the same mails as in my
local inbox folder.
After investigating a little bit with an LLM tool, it found an issue in
the MAINTAINER file entry parsing.

Patch 1: Fix the parsing issue
Patch 2: Refactor the code path

[1]: https://llore.docs.kernel.org/en/latest/

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
Clément Le Goffic (2):
      Drop the comment from a MAINTAINERS L: line before querying lei
      Fold the M:, R: and L: branches into one table lookup

 CHANGELOG                    | 10 ++++++++
 src/korgalore/maintainers.py | 24 ++++++++++++-------
 tests/test_maintainers.py    | 56 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 9 deletions(-)
---
base-commit: 29151623085919f57710589efdde80cb5115baa3
change-id: 20260925-fix-list-comment-08737d544b85

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

