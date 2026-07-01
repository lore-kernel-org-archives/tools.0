Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0523BD1D
	for <tools@linux.kernel.org>; Wed,  1 Jul 2026 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913888; cv=none; b=NsAdtTIuMmIV0DV2GMNSw9tTKzH92dh2jcG39RUns6PdfzLnCkJ+EeCTO6HaKPIjIBwsBw3tuAg+ZAqdn3JlKX0e6d5STBDUKkFZp6ZM36Hf9QdXtsHel6YqYuECrLF8kLxmGgA7GB7S7GmEm4tkbizQ0FgjpWkgAZ7T5yHAWkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913888; c=relaxed/simple;
	bh=drWiLFJKr+FJjIb8sV8Y6o6zeXjfaHCEoI+iGQeFnwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TGFwXYIOcSmeVnjEeKx0yaAfAK7RRN4QNo4Jn+6olEHvYCLcl/p39j5MvvPFcGjXjuWy9M68agCiJmQOH+Tqb5o0el7y2vMULR0e2g0Bnh+E2MPm4PfBG5Aw3L/BMKFi6EMKl+UoHcsl2x9HH7rMnC0GSrNa5x32OvnmKiYarPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSiHzsaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSiHzsaH"
Received: by smtp.kernel.org (Postfix)
	id 2193D1F00A3A; Wed,  1 Jul 2026 13:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7571F00A3D;
	Wed,  1 Jul 2026 13:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913887;
	bh=rfkeKqJq82eImMSzDxqJG2pLuYhYk7ayvtnHwYo8WnQ=;
	h=From:Subject:Date:To:Cc;
	b=SSiHzsaHEe6B5wOfK6o1QHF0O7kgMLVEf8GaDpwu1EQM4uZRkAiunvGqPX80n0Vqa
	 CFksrPm2L/kHsHNsxMh2m3/2JaiBVPJZysCKBo/ctPOyW45E9hJsU9GGbr+Py9ImqU
	 pykvkULlVjoM5yZ+1dsEjkB8a8UO8F9o26xVxtAJ6XM5y9Wa8IYvzP+tR+IlseE634
	 8E//4/CznYqMdyk9l6VWDqI8fqwnYns0OCyWaOqVxO3tFmdap17+4BVoLBlH/f0Uvb
	 4SUNxJ86cMrhAJiddF2RgXRbsLDe0vbGuGqEOQ9qigFNAdJBugnLWWmWqgsKTiGah9
	 +ALS0pZ1HpmoA==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/2] Detect naked cover letters that lack a 0/N prefix
 and diffstat
Date: Wed, 01 Jul 2026 15:51:20 +0200
Message-Id: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgbRWoC/yWMQQrCMBREr1L+2g9piVq9irj4SUcbq4kksQqld
 zfR1fAew1soITokOjYLRcwuueALtJuG7Cj+CnZDYepUt1N71fI7xImNZi8TBrZhRuQ7ci4DHHp
 RWmFreyqBZ8TFfX7xExlN579LL3ODzbVaX0YS2ETxdqzqIam0aF2/0R+fTZsAAAA=
X-Change-ID: 20260701-work-b4-naked-cover-letter-ee98a040e5c8
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984; i=brauner@kernel.org;
 h=from:subject:message-id; bh=drWiLFJKr+FJjIb8sV8Y6o6zeXjfaHCEoI+iGQeFnwg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS5SsfOaFu29criO4kRPrJ7p9glvjG/vOgiF8eLXzdZH
 +68sODy7o5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJxJswMry/dvZjzQVjrlCG
 +U+UNvY36EyccyamOOGp+pZPvR+Kki4z/E/n3cLGGC34opCtd8ZthdKGzUv0cwMfWbLlvGPXefJ
 wJTMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

LoreMailbox only recognizes a cover letter when the message carries an
explicit zero counter ([PATCH 0/N]) or, via the in-reply-to fallback in
get_series(), when the thread root carries a diffstat.  A "naked" cover --
one with neither a [PATCH 0/N] subject prefix nor a diffstat in the body --
matches neither test, so it lands in self.unknowns and is dropped, and
LoreSeries.has_cover stays False.

The visible fallout is in shazam -M, which then reports "No cover letter
provided by the author" and links the first patch instead of the real
cover.  This happens whenever an author writes a short prose cover with no
diffstat, e.g. Christoph Hellwig's "don't build bios/contexts over multiple
iomaps" series:

  https://lore.kernel.org/linux-xfs/20260629121750.3392300-1-hch@lst.de

Patch 1 extends the in-reply-to fallback to also accept the parent as the
cover when it is a non-patch, same-author thread root (in_reply_to is None
and not itself a reply).  Requiring the same author and the thread root
avoids mistaking an unrelated message the series was merely sent
in-reply-to -- a third party's bug report, say -- for a cover letter.

Patch 2 adds positive (naked single-patch cover) and negative (patch sent
in-reply-to a stranger's bug report) fixtures and a test.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (2):
      Detect naked cover letters that lack a 0/N prefix and diffstat
      tests: exercise naked cover-letter detection

 src/b4/__init__.py                           | 13 +++++---
 src/tests/samples/naked-cover-bugreport.mbox | 47 ++++++++++++++++++++++++++++
 src/tests/samples/naked-cover-single.mbox    | 44 ++++++++++++++++++++++++++
 src/tests/test___init__.py                   | 32 +++++++++++++++++++
 4 files changed, 132 insertions(+), 4 deletions(-)
---
base-commit: 4217c3e5d3e1eb259626142fd71b91ec6d5e3d1e
change-id: 20260701-work-b4-naked-cover-letter-ee98a040e5c8

