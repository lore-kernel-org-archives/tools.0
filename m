Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C520D17C61
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068501; cv=none; b=R4Wmz8iz6EK38rTA1H8EXUZiToBnm7k2Hpkj1ZcBUXI8k7iPh+nJRXB07X+Esyt79CeNsElg4rmgkD6kOd660jFLcODqFFkDyvF+nkVF5HEFyM+JPq9ezCT1kRBsSR5UYJ/D96KDdvbg8Ha2ibHWafV3WrWHvexvIUpJqSPcMlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068501; c=relaxed/simple;
	bh=xjo8XfFfzGB0UWTdkYLwsouvW9govpxlTIXoMk+ad+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kLZgJiZZszP8ApvMwkBG+0EVKSZ7KM1XqzaVF9h8jaydJArwI2Hqe/44MGz3tSWyL3cPK1tjvcRc0xdrptLYBxbHENa0eXKYjWVSsTp7QOIskk/yhissd/0seEPZM4uGIdJDDHBd0I0kuKVp7gsTwTuKHowSKfwLNTsusAHLAh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwCErxAr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwCErxAr"
Received: by smtp.kernel.org (Postfix)
	id 7B331C4CEE5; Sun, 27 Oct 2024 22:35:01 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C778C4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 22:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C778C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a3aeb19ea2so13472895ab.0
        for <tools@kernel.org>; Sun, 27 Oct 2024 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730068499; x=1730673299; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aV+oa1Pl+kpCWeaJbz2kcUy3WvMAiFaLgBPiqAiON6A=;
        b=RwCErxAroqbZC7rj/nkRncxIuRYHYJUlwNWbr809EYLU5lfN1mrU7SOfsb+CyS/Hfe
         Wg43vanVHdilRjdFQfqmkA66dApdsf3J0vMjSOcc+qdvEIU8pwY4S+Xl7onRyJHEgZCR
         2Av1aqrl4scpEgKciRcnznBX67+bZyyxX/sTrSq5lPJ2UYttShwbYDXff56iLAtbBTWB
         kRRBNBU4iOTCA1yVyltvWyVa3IajKO3qET00lUXN32nhJ3/1IKSnajUBVhulERKPDNj7
         8o5L5eqE0RHfSzYeeiHY7vufL06nAE/1MbpguV0Qyo71R2VUoXStDUeRu29f9jmJtqvP
         yUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730068499; x=1730673299;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aV+oa1Pl+kpCWeaJbz2kcUy3WvMAiFaLgBPiqAiON6A=;
        b=V3RlPlVXi9lEdS8Xfn/rWl92dvV23DLWx1elL75C+4b4yFnkzHE4IKYYPz39+RYH0h
         ZCT0wtr7rRp1ibjp6AzHX574EOz9zjdS2ZZYxD1Dr0rliq6lwivgDlHcHWguTRvlkieT
         N2C2D8K78dAl3SQu9hmZDLxwARe3fGG9vIkRJpqpDOF7cPzQGfhuC6uRnsSHSAg23bxd
         wxWofKZPYGWNBwNvvSCSH0Hbp5Gqnyp6DqRy66UyDeAp5zwtmD+B8qXzmdnz2sUN0sgr
         kb0q7G+azUyo13za58X673v1jpL+cQAVAQ7LsBVp58Q1sfbmivrKs1MTLe8bcse186nx
         JdHA==
X-Gm-Message-State: AOJu0YzxaXZa+JTD0zVk+M/TgDgOmJkH3h463iPsR+0yBbm4Xs9TGHs+
	X36iiaZTlYB+dHXR1yhhGxepNkrn22k/X4VdTMgCLjmJ6XkgiUsZrJUjjGmw
X-Google-Smtp-Source: AGHT+IF35fJVGautJaVlmMYHG0fRezCFgYBL8k5zXiN2Qhm6XxhVh3N7aviPgcRkxJYmvtZvKnhZ1Q==
X-Received: by 2002:a92:c26d:0:b0:3a0:c820:c5f0 with SMTP id e9e14a558f8ab-3a4ed2fe492mr46016955ab.24.1730068499140;
        Sun, 27 Oct 2024 15:34:59 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc7278e05fsm1318407173.155.2024.10.27.15.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:34:58 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Subject: [PATCH b4 v2 0/6] Handle patch trailers with special characters
Date: Sun, 27 Oct 2024 17:34:53 -0500
Message-Id: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3AHmcC/4WNSw6DMBBDr4Jm3amSNC3QVe9RsUjCACPx0wShV
 ih3b8QFurT9bB8QSZgiPIsDhHaOvMxZmEsBYXBzT8ht1mCUsVqZEjdxPJJgXCmwGzFTErGsfF1
 23eNGrobcXYU6/py7b/AWmuwNHLdFvufVrs/kz+quUaH2ra5U650191c/Ze4algmalNIP778ew
 74AAAA=
X-Change-ID: 20241027-trailer-special-chars-78b97ff63ea9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Brandon Maier <brandon.maier@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15-dev

Fixes bug reported in https://github.com/mricon/b4/issues/50

Patch trailers that contain commas are not parsed correctly, this causes
the trailer to be set to a blank string. The issue is special characters
in emails are supposed to be quoted per RFC 2822. But it's fairly common
for patch trailers to be hand-written and be improperly formatted.

The trailer tests were hiding some of the parsing issues, so the first
few patches fix up the test.

While fixing this bug I discovered the trailer parser also breaks even
when the trailer is properly quoted, so I fix that in this series as
well.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
Changes in v2:
- Fixed other tests that broke when the email parsing changed
- Link to v1: https://patch.msgid.link/20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com

---
Brandon Maier (6):
      src/tests: check trailer extinfo
      src/tests: fix trailer test hiding parser errors
      b4: handle trailers with improper formatting
      src/tests: test for trailers with improper formatting
      b4: handle trailers with special characters
      src/tests: test for trailers with special characters

 src/b4/__init__.py                                          |  6 +++---
 .../samples/trailers-followup-bare-address-ref-defaults.txt |  2 +-
 .../samples/trailers-followup-name-parens-ref-defaults.txt  |  2 +-
 src/tests/samples/trailers-test-extinfo.txt                 |  1 +
 src/tests/samples/trailers-test-simple.txt                  |  1 +
 src/tests/test___init__.py                                  | 13 ++++++++++---
 6 files changed, 17 insertions(+), 8 deletions(-)
---
base-commit: 2a6338e451a0c1e81f214f48c820c1e52d76b2f1
change-id: 20241027-trailer-special-chars-78b97ff63ea9

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

