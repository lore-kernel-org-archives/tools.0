Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179793A6F19
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860679; cv=none; b=Wrj1TkNU46C6rA+u924kRPyvHY/APl0LOBn8k8j2kio16B22SPeFHSL1JHFeaxOADAxsU5iDj/kj55LeLuP6FweylYe4dSLAl6wLMkf5jGsehbwlH10UbBA9DR8EZwZ/CtlWHi4n6ou99HYksqrEzhorU2idnVMl49LrR3L64rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860679; c=relaxed/simple;
	bh=YOk8s5okloOHJRtujGzXnWHqsysf8lVZFQJ1EauoQoQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M6KKJWtNV/+q4Z+J+lKG4Qw2AqVy4iLRH6XPHDLq0YePIOTAW05wlMsmY9waCQk1B6c5wQuqdrs3ib/CLi/0EPzTSQGFye6QcmdK/cyOC9w1asO9siN8RZK6sdry7YSb7iThkvzWoHFnlVGixy5Vgtqxh1E1nshtM8YKXpI5aA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKsRMzK9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKsRMzK9"
Received: by smtp.kernel.org (Postfix)
	id C59DEC2BC87; Fri, 10 Apr 2026 22:37:58 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2657C19421
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2657C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a05c388b27so38793196d6.3
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860677; x=1776465477; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wkz9Lp3POAflER3vOYTlEuw19dG7HBbQOAP5mOyK9EQ=;
        b=OKsRMzK9Rixn14a4I08uIWGluGNXc1C8siNkfW6scGd5nKLSlUSoOpMpvIBY97wUZN
         COpXF5dkvWZT9nfNcNo7YvYITZWCfAV43oI+vcNKR465/HlkNPpTRI9MEYDBw77HDuFZ
         6+TRTHJUdHWTbl1yZygYSr8PSDYMHxyBgzzfu0WRLQPxghgM5cEXuLXj4m5MWyog/sbO
         xXZEf7JLd7xc8nZ7p25xCzSnPdDROHCVoww2IcXdapUpg4rvB4aWtRG36u/wFGeXEFU8
         YRJ9jAY0s3fDbTblyE+2heTBC4SOX6ahRXgJc+V4zI5R4WD/hnEIiQgneOiS25q4Zdxt
         /06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860677; x=1776465477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkz9Lp3POAflER3vOYTlEuw19dG7HBbQOAP5mOyK9EQ=;
        b=A+rEdZcQ1M9eyiNbMKrp9wmJVeh6pBWSjIjceFi4ICAHxyK07UO9Sf5ML8s1Joh7e2
         1TyZ7y8xi/R4yU38KBoR1n2Em2QNR6oJoV6JIAVXC+1hMleflYiOQl6IX2rQeu9TZ6iu
         27RytCbU/A9KM4y4vkPvKh7l9dNublc21W2gWke6/IPpMlDgU/YyIhwfyNb4BXGqWCWV
         Xpk6uEmN+EOXeFtSeJ98869crHMdEx48pgs+Jww0MtIsCAUFXtJ4FngbPp515QorpyTG
         EUAegb859NpEM7F8MmpglclTLETorIvPChP4pVZIE2JqF0cY7fAGPTVWMI5YcKY/abJM
         nZGA==
X-Gm-Message-State: AOJu0Yy0js7g57AMNOaiaxEmTDgfxn/MTQnQ3JzKCQY+ljsW7I3lkck0
	V4S3JX4LfrdVWzQenLnfEGHlH6Bz/iBH5j5KxbTURFEJexQ0uiSNpD8MkaXK7iY0
X-Gm-Gg: AeBDietsm766yJygTeC929ARQZmrFXa+ETFNeVALkrbbjmnuPkBiLhlqPvX5xUdlLKD
	Cy+dPmAbJS4Di4tusobMa2YeD6VRabRIdYEczStFNaPpTHbjcz4zRSFWeim5wMJPKbcyAxVErR2
	eDfUrS6kS93O4g/X9YUpsQJoNEo4Wil+OoX7Fu+oarho01L5zX36qV1siywM+F6B1g1yPuCDgsF
	CaQ/Nl6BXytMEiixwc/0MMiueYYOdVyCkhNiswP05JnXAyc/c9BRl7/udh1Rq4C1vDIwgX+UCiJ
	hIn2iYMNZ9pHyuKxY7DzGpt7cjRWwTJs7LZ8/usGTdKCkBXSC1P9ZUBnTGoVdqO7c4rI4jqgtzN
	W2dd0hCYbyC7Q+p06O0oaDgraFj5EgqH/2N2AzdMdHopELoMGsD0LaNXbCAwhRqVHGSFu+HNU8l
	Qd3HoleRGJOuQ2rjkdQ6h/uxuAh3mZPz/SFVntEm2DVf61GqnJwzj55szpeHv0ItQpUwHq6RRpW
	SLHWYzQjqWbCxQh6v/MTos/ylVeBCUxQl7ZbThySZpbj6fghZ1dpdHUe4NUJhArtw7DbNGpIcp9
	m7E6e+/Df+kt73Vs7ZTuR2Fmp0CDTtN2qKDEhqck94l35Ew2mJAN
X-Received: by 2002:a05:6214:4408:b0:899:fab4:730f with SMTP id 6a1803df08f44-8ac862f7b6emr86560076d6.49.1775860676662;
        Fri, 10 Apr 2026 15:37:56 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:37:56 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 00/14] Harden local type checking and test mocking
Date: Fri, 10 Apr 2026 18:37:51 -0400
Message-Id: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQhCLaq4iLdPLbjIW0JK0op
 Xc31eW3eG+jgqwo1DUbZby06JQq7KkhiT4NYA3V5Iw7m9Yajj4HJF4+M1giZNQ0MK4O4dK34sV
 STeeMh75/29v977L2T8hyvGjfv0OBCph4AAAA
X-Change-ID: 20260410-harden-type-checking-e92ed8b4cac1
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860674; l=2670;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=YOk8s5okloOHJRtujGzXnWHqsysf8lVZFQJ1EauoQoQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO+MuQ33RmnlSo0ME2mn58i7VXTmS2vQCdTjklTWJuiVaLT1tIDPb9GfOHs7Zite247bvN6wkND
 dLo0eA6JMUg4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This series raises the local quality floor by making the type-checking
tooling stricter and by removing test patterns that rely on unsafe or
poorly typed mocks.

It starts by wiring the repository into b4 CI checks, then adds ruff,
pyright, and ty so the same checks run consistently in one place. After
that, it removes suppressions incrementally by making the code and tests
more explicit and better typed: typed keyword forwarding in
from_git_config, a typed authheaders integration, and test-local
subclasses instead of method reassignment.

The goal is to keep each change reviewable on its own while moving the
tree toward a stricter baseline with fewer exceptions and less fragile
mocking.

It would be nice to reduce or remove the use of `patch` entirely, but
this series stops short of that since it would require significant
restructuring.

The final commit adds the minimal b4 configuration needed to send this
series. :)

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (14):
      Add b4 CI checks and mypy suppressions
      Type make_msg and drop test suppressions
      Add ruff import checks to b4 CI
      Add ruff format check to CI
      Add pyright strict checks to CI
      Replace HTTP session mocks with responses
      Add ty checks to CI
      Drop redundant read-only property test
      Type from_git_config keyword arguments
      Add authheaders stub and typed callable
      Replace batch mocks with subclasses
      Use CompletedProcess in git config tests
      Update README for uv-based dev checks
      Add b4 send configuration

 .b4-config                       |    8 +
 README.md                        |   11 +-
 pyproject.toml                   |   25 +-
 src/liblore/__init__.py          |    2 +-
 src/liblore/node.py              |  104 +-
 src/liblore/utils.py             |   89 +-
 tests/conftest.py                |   90 +-
 tests/test_auth_headers.py       |   83 +-
 tests/test_cache.py              |  220 +++--
 tests/test_email_utils.py        |   63 +-
 tests/test_formatting.py         |  324 +++---
 tests/test_mbox.py               |    7 +-
 tests/test_message.py            |   11 +-
 tests/test_node.py               | 1999 +++++++++++++++++++++-----------------
 tests/test_thread.py             |   35 +-
 tools/b4-ci-check.py             |  118 +++
 typings/authheaders/__init__.pyi |   13 +
 17 files changed, 1921 insertions(+), 1281 deletions(-)
---
base-commit: 1c0b653bdb6eeb95625e99419d4b34d31cb55c99
change-id: 20260410-harden-type-checking-e92ed8b4cac1

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

