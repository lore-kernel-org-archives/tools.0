Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362A53AA
	for <tools@linux.kernel.org>; Sun, 25 Feb 2024 22:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708899152; cv=none; b=efnVweqjROR8E9ozbIiS5cmX5d9y87CkpZTuy1tC7MMM4kxsXtHjpjhWvB7F5DNDlmFaLAKftsC3WXpU1E0VgUusKL/QOAMlqcQRqVHyhlebBv4eg3whEmIH+ZPjFI/bGZgeNyPezCJrI5f2YI72iqKhWS7NX2M4hRtTKpfe77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708899152; c=relaxed/simple;
	bh=iKTDr7e+O5pJP1pW7efjhUI60oQnQjrMMTl0UwoAODk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=diRBNyP6DK24NkPiUVULTFTZ8PwhgrnVkc7HG9NAbHvEY7H+LZiBPuU1G01RHQY+rM3EWtcQ2Lp+UP02yhZxR7AhFteTihT4zeUL3Pjn8yhVONp0bij9Wp+ZsDYhDVkwTmG+A+2ryObmeu2YSN08WGECDWfP7MTIK+0WAeKSaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEVxpzaJ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEVxpzaJ"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78731e444daso191769285a.2
        for <tools@linux.kernel.org>; Sun, 25 Feb 2024 14:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708899150; x=1709503950; darn=linux.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hvr4x2nhA2mcnAiUtx/YvVqltrDm/QVYWh/Hwjs00M4=;
        b=nEVxpzaJzMmncACJ+N4vrw2wjwtc4zw8v7S5z7680FMNc0vKFTlSjmKHbegP6G1rnw
         5kEcvKMqu11VgLPLiohAAzY/vBBS0Ey7Ilw0vKhak/FGUanVLxHSE1vJmNnSMI1ohLTc
         7rRuIkVuR6wgEQAae+vujgofWyRTSl7KKNDQV0wH7+eE83cgIF7N6KvEgoTi6pv5XuUT
         wPq0ue8pDY1OmAM8pnhKFLV6uNwcmOR6UwrRzskk/1yuh/YBZlq6lTpOl9Dj7DVXj81I
         ONBL/bz609yGbZXqds2yO9JCCabpz6AwIZ8v8uRzv+Le8JVkqJYL8Suc/SnU2YEN6DdB
         NK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708899150; x=1709503950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvr4x2nhA2mcnAiUtx/YvVqltrDm/QVYWh/Hwjs00M4=;
        b=DrtNaWTTH0YGBOg0XBi16E5NbgLvWVYLrN/taqR//YJfT5UClltPbYhEDApA67LYgZ
         gM2+wpBjQ11QpoBzWmiEwbgYRMDQQ72BEES7ZNq7jElgG+X0zqyqCZnKzHLCUtcQs57z
         WlHWWfYmwpCMeQozhdzst2hjfFRr4F4BbPM1b7MUCnng8rf0sMX6zDz3Z/cf2jNOOSJv
         iDT9Muz+PJscVz3x+qrCRwr/fUIPMzR4lIEaWhNyKAmEaE0zdmVl/VEZ81o6C2lXSKh7
         JZT1u/5DgLhj/tr5/qhSdQiiZ4k3bLntPMUpn8ESXqEYWYftpnmoWlnWSR/GdKtIn1q0
         RjbA==
X-Gm-Message-State: AOJu0YxmL0Jn8QRBtiYWNPvEStfRsEE/+CnRjjEzblpUNm/KrDGcKlDf
	BtCxG4txyvrwD+GV8hk3nUZjuj08wExehGdv/VurV9nPARFyAYs0
X-Google-Smtp-Source: AGHT+IFtQNU1HrvlPpPogBQ/2mITlaLXZGqGtOz1z37GKgSQwmb9Y13CcShPdt16Gsi1YyNh5tH8Sg==
X-Received: by 2002:ae9:f30f:0:b0:787:3aac:5499 with SMTP id p15-20020ae9f30f000000b007873aac5499mr6377118qkg.35.1708899149899;
        Sun, 25 Feb 2024 14:12:29 -0800 (PST)
Received: from [127.0.0.1] ([2606:6d00:11:ff90:6090:e182:bd61:ebff])
        by smtp.gmail.com with ESMTPSA id d11-20020a05620a136b00b0078726073228sm1847129qkl.26.2024.02.25.14.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 14:12:29 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: [PATCH b4 0/2] ez: allow inserting a range-diff in the cover
 letter
Date: Sun, 25 Feb 2024 17:12:19 -0500
Message-Id: <20240225-ez-range-diff-cover-letter-v1-0-0df35b63bcf2@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAES722UC/x3MSw6CQBCE4auQXjsRR4jiVYyLmaGQTuSR7pEYC
 Xe3ZVX5a/GtpBCG0q1YSbCw8jRanA4FpT6MTzhurcmXviq9rx2+Tva/5a5zaVog7oWcbZq6Oft
 wSbgCZMAs6Piz43eKFT3si0Hhogmp/7PvWbMgDMchqBG0bT+A5LJ6kgAAAA==
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.14-dev

Hi Konstantin,

In the Git project it is the convention to insert a range-diff in the cover
letter for subsequent versions of a series, so this patch series adds this
capability to b4.

The first commit is preparatory, to document the allowed tokens for the cover
letter template.

Cheers,
Philippe

---
Philippe Blain (2):
      docs: document tokens for b4.prep-cover-template
      ez: allow inserting a range-diff in the cover-letter

 docs/config.rst | 11 ++++++++++-
 src/b4/ez.py    | 32 ++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 5 deletions(-)
---
base-commit: 8bdbe754bd599674330c420f6faa4aeca2233d28
change-id: 20240225-ez-range-diff-cover-letter-95932a7ce8ee

