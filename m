Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A540DFC4
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614406; cv=none; b=I8r7eH3+O+w7eZu82Nom729kq40IidU/vR4oh/QSCpUXcAYVsA1osnIdCT7uUmCNrPydkzeZ18HxoYsSt8JEdTWj7cEYy/tdTtqqWSzofSeDSJcrmbbRLp6ks/kEnmGz/Lqv6MkaZBlpWjKujt/SWl97P9NQtIvRp4PL4INpoJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614406; c=relaxed/simple;
	bh=WLOpLOZboMBQymv9h1QEe8Iz8wiOEHn0WN2k8j3Ft+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZC07ijQfZ4eBU48HYMbBxxvM6N6tR8t5YHI0pQJnZkUtUDbpz+NfcG9lr01uy9fQzNSFd/316CCjuB9Mj+7ricEbMFcvNsH7M2f5C9Ryxwhk8bD2zzCLx9LhONxN+9Z+NPTXhb2rra8pT0zhSj36M3+QyJ2StzZaqIgfQMO4O6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dM3YOubu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dM3YOubu"
Received: by smtp.kernel.org (Postfix)
	id 3F83DC2BCB3; Sun, 19 Apr 2026 16:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84198C2BCAF;
	Sun, 19 Apr 2026 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614406;
	bh=WLOpLOZboMBQymv9h1QEe8Iz8wiOEHn0WN2k8j3Ft+Y=;
	h=From:Subject:Date:To:Cc:From;
	b=dM3YOubufsKW8JgQ1OEx+vVpCCYMcU1OcrwlldTJpiX+u3cO5/aDXsv0KhoeqEdbB
	 h0awcb48w2OwlpmHsTJ2DVAk3ttiy5bgEq0Aj98zaaM2qHGqBrbmC7Osa+FFtIF7MH
	 Fko0Qlteq3qFp2wVYEQV26ekm9NUrwCXT4QQmvDNEilUCTverAMweg88J1KRGkLwyT
	 3s5S7oid3imznhInk2mJiROIWOYtCFUr1LG8iWjpJiVIhyjcZ4Zu18JCqIpQim/wb1
	 AatK/mLj69lmM0nVWN99VH+2+jV+d0sbDcOXkOjUkyTid9+mS3bxyIm8dZxnldkvhm
	 MqZazyv8jOp8A==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH b4 v2 00/11] Enable stricter local checks
Date: Sun, 19 Apr 2026 11:59:55 -0400
Message-Id: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03NQQ6CMBAF0KuQWVvTYgviynsYFlJnoGLATIFoS
 O9uqS5c/sn/b1bwyA49nLIVGBfn3TjEkO8ysN11aFG4W8yQy7yQWh4Ez0TCdmh7UVZUkdFaVaa
 AOHgyknsl7AKNhvp783NzRzttytbqnJ9GfqePi0rdH17+44sSUtgoH41WREV57pEHfOxHbqEOI
 XwAoKf6CbsAAAA=
X-Change-ID: 20260403-ruff-check-79f9f5441956
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>, "str = 'reply"@example.com', 
 "str = 'reviewer"@example.com', "str = 'author"@example.com', 
 "str = 'patch1"@example.com'
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3968; i=tamird@kernel.org;
 h=from:subject:message-id; bh=WLOpLOZboMBQymv9h1QEe8Iz8wiOEHn0WN2k8j3Ft+Y=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/jAbGZUn3xWMyf+zQKrHoi/qYlBYsp3U7itrpvj9m
 uzWyMbfMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKo39jIy7GzYv8lh9VGbubKVflcFzqbc92XtUzOOurBBP3VCzFdPe4Z/6veu/Iy
 bo7ctqyXW9PVuBkHe536HqxmSGW/V31jzIC6JDwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This series makes b4 local developer checks enforceable from the
review TUI and makes the repo clean under ruff, mypy, pyright, and ty.

The early patches set ruff formatting and import behavior, make the
test environment reproducible under uv, and type the misc helpers enough
for whole-repo mypy. The middle patches tighten mypy and pyright, then
add ty with all rules enabled and bump the Python requirement to 3.11
because the code already uses 3.11-only syntax.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v2:
- Rebase.
- Replace b4 ci integration with a simple shell script.
- Link to v1: https://patch.msgid.link/20260407-ruff-check-v1-0-c9568541ff67@kernel.org

---
Tamir Duberstein (11):
      Add CI script
      Add ruff checks to CI
      Import dependencies unconditionally
      Add ruff format check to CI
      Fix tests under uv with complex git config
      Fix typings in misc/
      Enable mypy unreachable warnings
      Enable and fix pyright diagnostics
      Avoid duplicate map lookups
      Add ty and configuration
      Enable pyright strict mode

 ci.sh                              |   10 +
 misc/retrieve_lore_thread.py       |   17 +-
 misc/review-ci-example.py          |   10 +-
 misc/send-receive.py               |  454 +++++++---
 pyproject.toml                     |   55 +-
 src/b4/__init__.py                 | 1571 +++++++++++++++++++++++-----------
 src/b4/bugs/__init__.py            |   52 +-
 src/b4/bugs/_import.py             |   14 +-
 src/b4/bugs/_tui.py                |  440 ++++++----
 src/b4/command.py                  | 1369 +++++++++++++++++++++++-------
 src/b4/diff.py                     |   50 +-
 src/b4/dig.py                      |   75 +-
 src/b4/ez.py                       | 1016 +++++++++++++++-------
 src/b4/kr.py                       |   10 +-
 src/b4/mbox.py                     |  309 ++++---
 src/b4/pr.py                       |  160 +++-
 src/b4/review/__init__.py          |   52 +-
 src/b4/review/_review.py           |  491 +++++++----
 src/b4/review/checks.py            |  396 +++++----
 src/b4/review/messages.py          |   64 +-
 src/b4/review/tracking.py          |  673 +++++++++------
 src/b4/review_tui/__init__.py      |   38 +-
 src/b4/review_tui/_common.py       |  366 +++++---
 src/b4/review_tui/_entry.py        |   69 +-
 src/b4/review_tui/_lite_app.py     |  111 ++-
 src/b4/review_tui/_modals.py       |  680 +++++++++------
 src/b4/review_tui/_pw_app.py       |  202 +++--
 src/b4/review_tui/_review_app.py   |  513 +++++++----
 src/b4/review_tui/_tracking_app.py | 1543 ++++++++++++++++++++++-----------
 src/b4/tui/__init__.py             |    1 +
 src/b4/tui/_common.py              |   43 +-
 src/b4/tui/_modals.py              |   49 +-
 src/b4/ty.py                       |  233 +++--
 src/tests/conftest.py              |   57 +-
 src/tests/test___init__.py         |  827 ++++++++++++------
 src/tests/test_ez.py               |  154 +++-
 src/tests/test_mbox.py             |   96 ++-
 src/tests/test_messages.py         |   21 +-
 src/tests/test_patatt.py           |   33 +-
 src/tests/test_rethread.py         |  178 ++--
 src/tests/test_review.py           | 1648 +++++++++++++++++++++---------------
 src/tests/test_review_checks.py    |  455 ++++++----
 src/tests/test_review_show_info.py |   97 ++-
 src/tests/test_review_tracking.py  |  990 ++++++++++++++--------
 src/tests/test_three_way_merge.py  |  188 ++--
 src/tests/test_tui_bugs.py         |   42 +-
 src/tests/test_tui_modals.py       |   60 +-
 src/tests/test_tui_review.py       |   98 +--
 src/tests/test_tui_tracking.py     | 1360 ++++++++++++++++++-----------
 49 files changed, 11574 insertions(+), 5866 deletions(-)
---
base-commit: 3bfbc1bf8f9549cfa2ad3949d807ce3d4954bb5d
change-id: 20260403-ruff-check-79f9f5441956

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

