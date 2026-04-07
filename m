Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2A33BBB1
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580522; cv=none; b=WB+WmtoQTtYnSoVbJ7vAjyJSVffFkKtJUOjsch44y5GNQKRKGeqgChR/XDCV65T62EyOl7591yo7N0edKjkR7X5FD5COFtOYfNLIVwpyreRGs6WAsPjgw/S3HFrlzu3rpw1Uhbz33+wIxgk5swkGg0go2S6lpsr+OY1g2b75nNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580522; c=relaxed/simple;
	bh=99S6FiqK4MMhcLBi6bxeaOOb5Ga9SuzUATXvTX+bs0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fmosNUIAJTm4DPptSTkSbML+NFTkUgvGYOd8NtJ7zLWwxPEaMWeAthI27Gdyv/9OzPYveQm/+djjK0VEMU45y7J0OH87ZkcQzOW5RxSCQclm5KPVT79Li2OSZo+2Gr/S7s1tUFtYdJ2Cm+6dgiYCwS+pgJv05z0LWN5XLJSAmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODiEiBY5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODiEiBY5"
Received: by smtp.kernel.org (Postfix)
	id ACCCAC2BC9E; Tue,  7 Apr 2026 16:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E15DC116C6;
	Tue,  7 Apr 2026 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580521;
	bh=99S6FiqK4MMhcLBi6bxeaOOb5Ga9SuzUATXvTX+bs0Q=;
	h=From:Subject:Date:To:Cc:From;
	b=ODiEiBY5Ihw1eG6cnSFYzPiz1gglNm+YDMnNsIhaYb7UvEWJnvC5rFAGNg/8BZV4l
	 HjDVTYKmsU2g/CqhWwRHv1GZyZOaSW5VPPHe/XdkT7oYuo2fXm/15nkVBSdSN4/tNJ
	 YURZzc6tU7Ijn4DrBjfA9yL9/aukpKvuv6WCNBO3t8awsD+PGrYAvLGDCd8Oqw5nhs
	 Tf6Ms74qYpXMFPMtG5Bhde7qdFJx1xAb/KolMFlCJo1Hc2p1hzqgWG1GrPC0ebKMyP
	 yMjeT4KuwfcCTC3IfUeL8kwR04EwgPNeasClRlG2+xPvC3utXLN7p3P3PURKA3aSUr
	 CMQNYB/FvG5QQ==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH b4 00/12] Enable stricter local checks
Date: Tue, 07 Apr 2026 12:48:29 -0400
Message-Id: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBQFryJv3UDUqKRXKV1o/F+/gpakiiDe3
 ajLGZjZEcgLBbyTHZ5WCTJPEdJXAtfXU0dK2sjIdFZqo3PlF2blenKjqixbLoxJbVEiBj9PLNs
 9+6Ax+D4uLM1A7n9dcBwnAjvrJHIAAAA=
X-Change-ID: 20260403-ruff-check-79f9f5441956
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3788; i=tamird@kernel.org;
 h=from:subject:message-id; bh=99S6FiqK4MMhcLBi6bxeaOOb5Ga9SuzUATXvTX+bs0Q=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTdO7nrR2CnEHeu48Zvsog+M2l/2DTfHsG1f9fh706
 UfVVYstHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKbaKIrhn/H8OeUiy1ew8DBtep9yQOSA+1mGhSvjw3xveuRv+9KzcAcjw+20ul9
 vP8+4bLe69ZJHd6uUR8/m/0773wWX+LbtfWggxwwA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This series makes b4 local developer checks enforceable from the
review TUI and makes the repo clean under ruff, mypy, pyright, and ty.

The early patches set ruff formatting and import behavior, make the
test environment reproducible under uv, and type the misc helpers enough
for whole-repo mypy. The middle patches tighten mypy and pyright, then
add ty with all rules enabled and bump the Python requirement to 3.11
because the code already uses 3.11-only syntax.

The last patch wires the review TUI to run the same local checks through
a JSON-emitting series check helper, so reviewers can see ruff, mypy,
pyright, ty, and pytest results from b4 itself.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Tamir Duberstein (12):
      Configure ruff format with single quotes
      Fix ruff check warnings
      Use ruff to sort imports
      Import dependencies unconditionally
      Fix tests under uv with complex git config
      Fix typings in misc/
      Enable mypy unreachable warnings
      Enable and fix pyright diagnostics
      Avoid duplicate map lookups
      Add ty and configuration
      Enable pyright strict mode
      Add local CI review check

 .b4-config                         |   1 +
 misc/b4-ci.py                      |  57 ++++++++
 misc/retrieve_lore_thread.py       |  15 +-
 misc/review-ci-example.py          |   6 +-
 misc/send-receive.py               | 246 ++++++++++++++++++++-----------
 pyproject.toml                     |  42 +++++-
 src/b4/__init__.py                 | 293 +++++++++++++++++++------------------
 src/b4/bugs/__init__.py            |   8 +-
 src/b4/bugs/_import.py             |   3 +-
 src/b4/bugs/_tui.py                |   9 +-
 src/b4/command.py                  |  17 ++-
 src/b4/diff.py                     |  16 +-
 src/b4/dig.py                      |  17 +--
 src/b4/ez.py                       | 110 ++++++--------
 src/b4/kr.py                       |   2 +-
 src/b4/mbox.py                     |  35 ++---
 src/b4/pr.py                       |  30 ++--
 src/b4/review/__init__.py          |  29 ++--
 src/b4/review/_review.py           |  15 +-
 src/b4/review/checks.py            |  17 ++-
 src/b4/review/messages.py          |   1 -
 src/b4/review/tracking.py          |  24 +--
 src/b4/review_tui/__init__.py      |  20 ++-
 src/b4/review_tui/_common.py       | 157 ++++++++++++++++----
 src/b4/review_tui/_entry.py        |   3 +-
 src/b4/review_tui/_lite_app.py     |  19 +--
 src/b4/review_tui/_modals.py       |  61 ++++----
 src/b4/review_tui/_pw_app.py       |  31 ++--
 src/b4/review_tui/_review_app.py   |  90 +++++++-----
 src/b4/review_tui/_tracking_app.py |  83 ++++++-----
 src/b4/tui/_common.py              |  24 +--
 src/b4/tui/_modals.py              |  11 +-
 src/b4/ty.py                       |  46 +++---
 src/tests/conftest.py              |  47 ++++--
 src/tests/test___init__.py         |  15 +-
 src/tests/test_ez.py               |  11 +-
 src/tests/test_mbox.py             |  11 +-
 src/tests/test_patatt.py           |   3 +-
 src/tests/test_rethread.py         |   4 +-
 src/tests/test_review.py           |   4 +-
 src/tests/test_review_checks.py    |   1 -
 src/tests/test_review_show_info.py |   5 +-
 src/tests/test_review_tracking.py  |   9 +-
 src/tests/test_three_way_merge.py  |   7 +-
 src/tests/test_tui_bugs.py         |   1 -
 src/tests/test_tui_modals.py       |  18 ++-
 src/tests/test_tui_review.py       |   6 +-
 src/tests/test_tui_tracking.py     |  28 ++--
 48 files changed, 1036 insertions(+), 672 deletions(-)
---
base-commit: 05a91672afb00b3b3b5f76c7757a518d80509c59
change-id: 20260403-ruff-check-79f9f5441956

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

