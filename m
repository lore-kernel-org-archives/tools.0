Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314459;
	b=bYZDsgtH+9yjgtB26R/QWnUtAZfYfwrHJevGqxmUbR2kL2RoEmQMJwyC1VPIDpYXdYNV
	 sI7ktDXvPlFZGUGI86ag46027TABXo7P4/OYLpaK+ItYoRBd9aIMz2YzLS+NwpS3R3r1R
	 dgYDnnWIsFmwOMdaQPCsY/wL6t0arJ2UK3DZpD8LVwo9cKgFmI2wu1jVpLePA7nGutPL4
	 8uRV5W3RZTZiVPdgQE9XEVSOYpNryQqbd15a5YDWbsCYpA5j2QbPtdWZ/sqMZAv/94p88
	 P8RMONLsrlLvmaKzg2LilC5HC2GBqlrnWlqUH0xDHCTk9J8gmFQJRn8/rPe9XKHj4Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314459;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=M4vB4fmGrRzvktTCaDDIcjaZFXqa+Ay80GRNdr30nDQ=;
	b=FzN3/VDpqYAPRYP1Hk5VdpHOsRy1bj4XapEtKadhZVcuzi29/pHLukM2RliopkXTUNnh
	 Fvw+TTfklKGwBAGIMRwomfKnMWPoAMvlxsJsGJPn/xQC3fNvQ1txwgMHhH5QuMBljwcch
	 xMAn5QLPUq9miuoZQgql5ygZnpMYZSCeFNmBskQYHB6xx84ZyHbkWAM6ri3bc24/9CZly
	 /txmQobQEiKpsiQQnktnu/nWjTaoR6c2UB+dCq3yhMlDKPdtBExkNU0VAJp2566b6TjDB
	 873iiEyuzSehv9kuyafXoO/Xgdlr2BCv7yROa/0acRgIAwzo4KTelwHvY0zBqp5PQDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8960A2606
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4DE81F008A5; Tue, 10 Nov 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314458;
	b=gNyhqX04cg5f11O/6zQAWXbqsfy+/O9O4wbAKWhH5BazqGXTxiQnb2CJI7PkquuSD0lB
	 YtC/mTq6xQLsAzOtwjHHyTFQdGOGYFOytr7Z+EO0G6N8QloVyfORuCbxV3aBFH3uTH9EB
	 IYh2sIYukLlXvJ+PRnZqz6N3jbbG673HSNTtPLRqEruasRBdZzSRwJUZWxAt0anBuV9hy
	 BgjlYv8mRAE4v1tNAVDkxolnJA8p3i/sOZTFQvbTnMLnjiQU/l/CKZzNdjYBG1M+d91mw
	 xHbtb0HeCe4ustRcJFeOPTW9Yaj7yaNxEBPqppnSBNFSMdewU0pTTGPGXa24VGgk0LQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314458;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=M4vB4fmGrRzvktTCaDDIcjaZFXqa+Ay80GRNdr30nDQ=;
	b=MPjctWMd1iBaRzdTaomsQgKhITkDKmu0yQhmzwsWD0JxJImOQA8jv2dv/BDa+HKlSUTj
	 Wx9DTEs5FkS9JRYnuv+tBPLya1DjVuX1mq6c0/dklMpg8w7YCPkkc5oeoWjXNRISrU2RT
	 GP+vxpdRcKIks7i2GVDrGEZv8luFi2M3wvnkdJdEFooJdcJym8HICaRBw788JvCRGvh6M
	 +H8xMjoNM3JCKyNgVuYhIPei4S6eQU5nNmO3qFnGueu4gNApGw3vDg5VqnjnizaH0O+La
	 NVRKkugcc2Py1xYE7cLIbBzi7jbzgTXKt8V9EcaLruIdEm/xCdCHOH995elN8FJcsAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 146671F0089F
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 146671F0089F
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D1368481B1;
	Tue, 10 Nov 2026 13:40:54 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Subject: [PATCH RFC b4 0/6] Initial support for b4 workflows on a detached
 HEAD
Date: Tue, 10 Nov 2026 13:40:46 +0100
Message-Id: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3dSUzJL8ovii1LTS4tT4koxUXQsjAwODpFQT00RDcyWgvgKgXGY
 F2MxopSA3Z4UkE6VYiHhxaVJWanIJyECl2loArfMSeH0AAAA=
X-Change-ID: 20261110-editor_refuse_the-82000be45a17
To: tools@kernel.org
Cc: Gabriel Goller <g.goller@proxmox.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Gabriel Goller <hey@gabriels.computer>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794314453501

I'm using jj instead of git and want to use b4. The major difference and
dealbreaker here is that jj is always on a detached HEAD and not on the
latest commit or on a branch.

This is a preliminary, basic implementation of detached-HEAD support
in b4. The goal is to make b4 usable with tools such as jj, which leave
HEAD detached, without having to create a Git branch.

It supports enrolling a series with an explicit base:

  b4 prep -e origin/master

The series can then be edited, checked, sent and updated with review
trailers. Only the commit cover-letter strategy is supported. Rewrites
keep HEAD detached and save the previous tip in a recovery ref. Branches
and refs managed by other tools are left alone.

Normal branch-based workflows are preserved, with added checks to refuse
history changes during an in-progress Git operation or when the rewrite
target has moved. On a detached HEAD, b4 trailers -u now requires an
enrolled series.

This is not full jj integration: b4 updates Git HEAD, but does not
update jj’s state. Feedback on the approach and its limitations is
welcome.

Includes documentation and tests for detached workflows, recovery and linked worktrees.

Let me know what you think and if this is somethingi that would be accepted.

Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
Gabriel Goller (6):
      editor: refuse the edit when a detached HEAD moves
      ez: refuse to rewrite history during an in-progress git operation
      rewrite: keep a detached HEAD detached, never overwrite a moved ref
      ez: work on a series at a detached HEAD
      prep: enroll a detached HEAD without creating a branch
      docs: prep: describe working on a detached HEAD

 docs/contributor/prep.rst     |  69 ++++-
 docs/contributor/send.rst     |   5 +
 src/b4/__init__.py            |  45 ++-
 src/b4/_rewrite.py            | 135 +++++++--
 src/b4/command.py             |   3 +-
 src/b4/ez.py                  | 481 ++++++++++++++++++++++++-------
 src/tests/test___init__.py    |  45 +++
 src/tests/test_ez.py          | 127 ++++++++
 src/tests/test_ez_detached.py | 657 ++++++++++++++++++++++++++++++++++++++++++
 src/tests/test_rewrite.py     | 189 ++++++++++++
 10 files changed, 1619 insertions(+), 137 deletions(-)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261110-editor_refuse_the-82000be45a17

Best regards,
--  
Gabriel Goller <g.goller@proxmox.com>


