Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8B283FD9
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146600; cv=none; b=WASq7CL1zTsCLw2Zu3Q9aGzj535U4Ng7mWNUgSKSqAKdCv9LN3V+ODHoBMerfE1XSDy8GpOD3jjhzYlHl3zE98ZX4IPF9ybeGyIe+s4dssMhwr9vimqFVWlrY7QJ7yjkUm6ZeLwJ96eXCfD990USBUtaFgaQMxjx1RT5OCCLsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146600; c=relaxed/simple;
	bh=nKniaKARg3hZcIYuWdJvKRjQqKW4epNMEdd0UPI+uvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FTTyPHmV6H+rhxuNkhW9QEAXd3zcaAu1Ps0XgHfPnjJ0yDlQeKF2BIoO4NehBdwRCzypRlj3M3RC2lKCIvX5+dFzrkpzRvfBz4wkj6n6CQBDYNmaJy0bV20SBWN6cIoYSkh3Z20BlF/w6mcP8d6BuQHY4eNlj3tjsOMk0GfZSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqohD4ih; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqohD4ih"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12db2e9b3bcso633844c88.3
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146598; x=1777751398; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJBVtPGrZcfDIcvSSC+PtY2KCZ4LLehKfTUhTTqGiKg=;
        b=sqohD4ihzIuI6bzb/jfMqgtcMqpKcadhaoy6Y3gBdKL+JYOiSTEkMbavdszq9r4N/J
         NOOdTR4Ua3TEoStG8EFfvt2sHC//OwyT85zvNpqqM8rhANvc4fOuVZ1NMwF6l9jy4Ojj
         tV54dI1aEofa4gnIo22/oWjTN++152l6dg9igGHtogwvukQ7ZmYNEBKnOo2yvqmmRfVk
         Nxey1uGzMEJALKU1ZKMLqbp58n0+RCBKMM5iq99biAlwQw/RUldSQumDFpj/UAhvLfgT
         uHCq+1VBLIof2s0o1PeiIGbuyOrmTPv7JxAap02jjXtiQNdDpQVTI5Z9TX/XcpNXzLhd
         AZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146598; x=1777751398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJBVtPGrZcfDIcvSSC+PtY2KCZ4LLehKfTUhTTqGiKg=;
        b=CRlsigV3k+YGW04G9km5Y8N404c35AEsI+DMqGDFEOPK6CVb+2jUsxFHi+ZkNqdRV3
         2Z0urud/bPJbSV+Dawi/SWf+D/Dn2EfhRc8lQyJeC3xdRqNvi9nYpjCz5QTt+j0Q+g6S
         J843ftxdqDcFDo2wqYMjMpuIHiI9KQ4SkddYo3eUmyNnswbmiEHs8IjTw+++1X9hXp7V
         0DF9sNUzzWIf0keJObqd5aFZm7d6GisfsWMEGsgzktqdxRidEagF9lVsVdoukYE2zL8U
         9/MC0+rbtWXeibKSji+eNxfrMOiEarNy7Q32aTF0ZFv0+WilN69M2LQYy1maRZpnpPSX
         GntQ==
X-Gm-Message-State: AOJu0YxQmg4s8Q+TrCktyo0DCfiCgOpJWL+wFvxnkC9TsW57Ltf7ZZoW
	xRv0GpeUzt054R7Vv8oTJFTY5RbFudaTb2eeWV+rhUmqbetDGMJwlbTo4G6DFQ==
X-Gm-Gg: AeBDietHnN7wpQynQCaeJY8SwqvVtL/EQjmUs45T2g8GybpiZ9+yi9usm3oqXZ9nXXx
	LVqX996IKRoVWBZNY6ZvkxV5Ok6O0U+Ub0i5hp7H0FKwyNXlv7v4NmI7FMnRL+8V4w/G0kIC9Xg
	p38JWCQwYlE/PFk1BYysMcyCbSwpl7kshNdNflASQcZRc3NGiQPAfQ+AAUcudff+u+C1uy/6xtR
	j7Ks/NARpi2Sd+X5QQTpemJY+joPcYzc2rv5kymIHQbvEQDXSaON5BVZhwhHoFoq20rZgHWutoe
	fjIxI4jGhPLhomM+NvV1zv5FLuhOQHoS5+TfwT/S02R5jCrI0HbI+Qvmnq0+8hV46wHa8wY06FJ
	A3VrLpZV4vSWWdqkU3xHad1MyKYoHo/NAtjbeeNL2+I1Pl+ZCxAK+WvD6Ch7+sbGexCddPGN5sa
	k3sVHLUtnkM8AQwFooE3JuXGMoZ9EgG2Y/SXHiglFWyHDuHxSGeOk4Dmg3lJ49aqoC35YKgEBHx
	jdeEjj09HToAPMSLabvzxOe
X-Received: by 2002:a05:7022:2522:b0:127:def:dd72 with SMTP id a92af1059eb24-12c73f659d5mr8222855c88.2.1777146597845;
        Sat, 25 Apr 2026 12:49:57 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:49:57 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 00/13] b4: add native Windows support
Date: Sat, 25 Apr 2026 12:49:28 -0700
Message-ID: <20260425194943.1499-1-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

This series aims to provide native Windows support for b4. 

While Linux remains the primary environment for kernel development, many 
contributors find themselves on Windows systems due to corporate 
policies, hardware constraints, or environments where WSL and virtual 
machines are restricted or unavailable. Enabling b4 to run natively 
allows these contributors to participate in patch review and mailing 
list workflows more efficiently.

The changes focus on platform-neutral path handling, encoding 
consistency, and process management. Key highlights:

- Portability: Replaced POSIX-specific assumptions (UID/GID, path 
  separators, and shell execution) with cross-platform equivalents.
- Stability: Fixed race conditions in the TUI worker and added 
  defensive guards for widget mounting, which became more apparent 
  under Windows' asynchronous I/O model (IocpProactor).
- Testing: Added ci.ps1 to allow local validation of the full 
  quality-gate pipeline on Windows.

The entire test suite (900+ tests) was validated on Windows 11. While 
some minor UI timing flakiness persists in the test environment due to 
console latency, the core functionality is stable and ready for use.

I am open to maintaining the Windows-specific execution paths and 
addressing any regressions that may arise on this platform.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>

Adrian Neftali Sanchez (13):
  tests: specify UTF-8 encoding when opening files in text mode
  tests: use os.path.join/normpath for portable path assertions
  b4: add cross-platform username resolution in _setup_user_config
  b4: resolve platform-native data and cache directories
  b4: normalise git-reported absolute paths with os.path.normpath
  b4: select platform-appropriate default pager
  ez: use portable uid/gid accessors in write_to_tar
  tui: The _suspend_to_shell function assumes a POSIX environment,
    relying on $SHELL and shell-specific arguments (e.g., --rcfile) that
    are invalid on Windows.
  tests: replace NamedTemporaryFile with tmp_path in patatt fixture
  pyproject: add Windows operating-system classifier
  ci: add ci.ps1 for running the quality-gate pipeline on Windows
  review_tui: write git tracking commit before updating DB
  review_tui: guard against unmounted diff-viewer In certain
    asynchronous contexts or during rapid UI transitions, _show_content
    may be invoked before the diff-viewer widget has been fully mounted
    in the DOM. This is particularly reproducible in headless test
    environments and on platforms with slower console I/O
    initialization.

 ci.ps1                             | 15 ++++++++
 pyproject.toml                     |  1 +
 src/b4/__init__.py                 | 22 +++++++++---
 src/b4/ez.py                       |  4 +--
 src/b4/review_tui/_review_app.py   |  8 ++++-
 src/b4/review_tui/_tracking_app.py | 24 ++++++++-----
 src/b4/tui/_common.py              | 58 ++++++++++++++++--------------
 src/tests/test___init__.py         |  2 +-
 src/tests/test_patatt.py           | 31 ++++++++++------
 src/tests/test_review_tracking.py  |  2 +-
 src/tests/test_three_way_merge.py  |  2 +-
 11 files changed, 113 insertions(+), 56 deletions(-)
 create mode 100644 ci.ps1

-- 
2.45.0.windows.1

