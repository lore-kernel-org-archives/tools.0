Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1841E50B
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043239; cv=none; b=jZ2QKU/H4ak+AgMzfyAf2nPUJyRYvbR69z0j6ghZXfdV5YuIdw43eR7TmvSSt4PV/VllAEIN7VVagChEXGva/qydkbb2aFUKm6ZcNrhEk336vpuA9TcwjuN5pQsQ0Wax0lffhcX3OJ9zIvLdepZCMrGlMUAtCrgfYFHz2ECeK2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043239; c=relaxed/simple;
	bh=zyshzh5eaRvAEGpyg1VSGoIXpy6peHSlFDvKFP3x8n4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qn2mOejY5F4AFTYyFNpX6BbXqvR7zTCGzIsGlgU6GGlWQshbXSq+dp3qZvMkOVwtTJwcuTpmTr0ntK1VQFpizuuFoacCrVy84hTfcxhuPIMUCRPM7KMCa/B0AKXJXZrwwrJ4R0i0AbHP7wQvTm+uau6yZJ+PDhW9VeGHg/lsBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/tkcTv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/tkcTv5"
Received: by smtp.kernel.org (Postfix)
	id 18185C4CEC7; Sun, 27 Oct 2024 15:33:59 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A472C4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 15:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A472C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a4d3b7077cso14242435ab.1
        for <tools@kernel.org>; Sun, 27 Oct 2024 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730043237; x=1730648037; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IY66wnoF980aFJLyc+RWaJaXSuoCgYRukoeKYS+A5U=;
        b=m/tkcTv5fzaY56FDbplPGzkiu74xMZcbmu1CuOyj9uJn5mfvPx7CEgl390qXiP7b97
         rtF6/iXokFTlilCOb8rC6Ang4izC8nKpzqV8awVpGVj25XjdN1wXhXP0dbsUAisrinX5
         3DhinMzpl4rlpoa8Q1pm8qQcJlMhYQFc7bo1m8puAKHRXPCiwXhc9zkXh8ixsvutx/aR
         9cJA22UG16AuSfZ1SWzS+MMYkL7TnIqJo2cfhaEAI9j+9wuJjQpIjgDWzTbWNpdoJ/ou
         IvmzPCy/Moc8iLFuttSjfRhtgDqMjFNSz1BC5otnUYIZpkGUBxLsfTuMLNRLjcW1CoKB
         ct8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730043237; x=1730648037;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IY66wnoF980aFJLyc+RWaJaXSuoCgYRukoeKYS+A5U=;
        b=Jw02BlXpO6l8P+cyDbTdKbt4gmm3gAh7siCRo8i/w3YGU2wtCZ74hMovuZNpTbjPWi
         HBtVKkTdQqmumZVMDmW6AIEraVBbwnFVXUYPJprXzQyXRiqXhAfPgcdLiVkqFjqGlyNW
         90+Io8OJNuxkmOQhEFaTOl2OyQqREnOnosaeOYmP5btUOeDh4dnyZ3Y2DkMHlguCQc7k
         YAUVi9jotMmMs/kaiw+HQlJBzA2iFCMYVjoBkwmg83I+gEs2ozGFZllJQ2+Z1lggqR9w
         0yUFa2wBrO/yThCaKzHgkNmsqhH6x2u+txOkV1LBq9NBubvSqB2LbJK2b+wTlt30UrCX
         cnvw==
X-Gm-Message-State: AOJu0YztPDVj+f/mgGJJT/tOtkzbxTe0S8mw6Hf17cEp4hRwXQKTMyy2
	QnvRd4E1wY8vGxSTJvD7pWmc7ayQ4boBknfcZ72t12QJkv8LDGZ/
X-Google-Smtp-Source: AGHT+IGdCnLJ1JD6sP3w5bSj2+PJCPVfHFROcQtMFDax2RE5W8aFaHPEKH02AaBnhl+Rw1fBpLWd4g==
X-Received: by 2002:a05:6e02:1d04:b0:3a3:449b:5989 with SMTP id e9e14a558f8ab-3a4ed304cebmr35231695ab.21.1730043236770;
        Sun, 27 Oct 2024 08:33:56 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a4e6e56641sm12179305ab.65.2024.10.27.08.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:33:56 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Subject: [PATCH b4 0/6] Handle patch trailers with special characters
Date: Sun, 27 Oct 2024 10:33:52 -0500
Message-Id: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBdHmcC/x2M0QpAQBAAf0X7bOucy+FX5OGwx5bQrqTk310ep
 2bmASVhUmizB4QuVt63BEWewbiEbSbkKTFYY11hrMdTAq8kqAeNHFZMlij6emh8jFVJoYHUHkK
 R7//bweCgf98PoPfDRGsAAAA=
X-Change-ID: 20241027-trailer-special-chars-78b97ff63ea9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brandon Maier <brandon.maier@gmail.com>
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
Brandon Maier (6):
      src/tests: check trailer extinfo
      src/tests: fix trailer test hiding parser errors
      b4: handle trailers with improper formatting
      src/tests: test for trailers with improper formatting
      b4: handle trailers with special characters
      src/tests: test for trailers with special characters

 src/b4/__init__.py                          |  6 +++---
 src/tests/samples/trailers-test-extinfo.txt |  1 +
 src/tests/samples/trailers-test-simple.txt  |  1 +
 src/tests/test___init__.py                  | 13 ++++++++++---
 4 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: 2a6338e451a0c1e81f214f48c820c1e52d76b2f1
change-id: 20241027-trailer-special-chars-78b97ff63ea9

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

