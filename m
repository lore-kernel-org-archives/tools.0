Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608804749EF
	for <tools@linux.kernel.org>; Fri, 18 Sep 2026 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758204; cv=none; b=fB8H9qR8DsnwOm+occ5SEgO+74mohd5cq7qUro24E65TpbnWg9SygRuidk+/pmuqZmPXVv2OE3JChr6msyAyKyLCJWO92D3ue8EzdikuxbsXAIIheCX/uEYnPZr3H/AFpd6czdh5MntwFvX2qXGi4Sx4xvdLUifZSJOiib4o6Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758204; c=relaxed/simple;
	bh=xo8GTwtgom40Gg7TBiTOwbt3KiFIuCgLkUS0/xyV08k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U+xainlGTBXdxYLuFHp3pquMMt1Qm9tduCipqdPBcC2X8gI8GjzuilYH7md+9E1sXcrKvs6ryTG38joXjNuvmMxSzL2AB1HduCHRvQRw1oDzuS0KhxZigThQzzLLsTavd4AQU9gvMqJngw8XnHh9TISiow7PgxYm/0B8p3Mqs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4bTsHVn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4bTsHVn"
Received: by smtp.kernel.org (Postfix)
	id 4D9151F00898; Fri, 18 Sep 2026 19:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA9A1F000FF;
	Fri, 18 Sep 2026 19:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758189;
	bh=eZHDiMG5N+aqMDWakYhDgjEZ5zUL76SHtZD/EvAhU44=;
	h=From:Subject:Date:To:Cc;
	b=C4bTsHVnoehX7LwUnBeh7d7cDbhxfVCFq37UVcl0edEee4WOQvwqwT3WQQ8gv50M9
	 6e/Zrz6g//sbeNm+aA0ElKqr/J7Zht6hvzpuRJacvzcG/eHAA9R2u6Ac2ZNwDFhKHF
	 Mz//XIzQfbOM8Vy/hY+nIakoo06A4ZVYYXtBtHSRoV9tHP9AKrkiwr/uvD8AAEOD6N
	 udILPG8FYvUmA/v+li6rZjOQHfE7C0ww7Qi61i2OTdiGtvWkze7CaF0Z4i7+CN/RKf
	 MAEFWU+mlSp0Vt4TntomN/ylkO3IFIt5ANX3PdsJaYGlEpbFT3hZbsFTyvllOUbqEz
	 xyr6w4Gw5EPiw==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH patatt v2 0/4] Harden local checks
Date: Fri, 18 Sep 2026 15:02:51 -0400
Message-Id: <20260918-stronger-type-checking-v2-0-37de1d8a6c86@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOTQ6CMBCFr0Jm7Zi2goAr72FYlDJC1bRkWomEc
 HcLHsDl+/L+FgjElgJcsgWYJhusd0moQwZm0K4ntF3SoIQ6i1zWGCL7hBnjPBKagczTuh5PpVB
 FUWvT6hpSeGS6289efINRRx0jND8e3u2DTNxaN+dgQ/Q87w8mufv/jU0SBRZGikrkVadMeX0SO
 3odPffQrOv6Bfm5GnnXAAAA
X-Change-ID: 20260419-stronger-type-checking-3702559acba9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062; i=tamird@kernel.org;
 h=from:subject:message-id; bh=xo8GTwtgom40Gg7TBiTOwbt3KiFIuCgLkUS0/xyV08k=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlru57EcH3IuiOWdizn94KrbEWbd1q/UbBU95mtdLcyb
 tYPPneJjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFMdPpXhf9kM45s5Vgtm7RD4ssJATnH+0Vk7HsW+9WBhWPM1i3vTgkSG/5FnEiy
 W8FopeZ3NCjwQ9+Zf+0SnCT/ZJM1VJqffMXq8jg0A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

The CI and checker setup proposed in v1 is now largely covered by
05c5bbb0b00e ("Add CI helper scripts and stricter type/lint gates").
This revision builds on that work, retaining the remaining typing and
cleanup changes and adding a lockfile for reproducible checks.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v2:
- Rebase onto 0.8.0 and drop the superseded CI, Ruff import/format, and
  ty setup patches.
- Add uv.lock in a separate first patch, then upgrade Ruff and ty
  alongside the corresponding lint and type fixes.
- Adapt the remaining typing changes to the upstream configuration,
  removing unknown-type exemptions and precisely typing the key cache.
- Fix Python 3.8 packaging and test-collection failures and add
  regression coverage for cache reuse and missing-key validation.
- Retain the dictionary-lookup and unconditional PyNaCl-import cleanups,
  adjusted for upstream changes.
- Link to v1: https://patch.msgid.link/20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org

---
Tamir Duberstein (4):
      Track uv.lock for reproducible checks
      Tighten local type and lint checks
      Reduce dictionary lookups
      Import PyNaCl unconditionally

 .gitignore                             |    1 -
 docs/conf.py                           |    2 +-
 pyproject.toml                         |   20 +-
 src/patatt/__init__.py                 |  373 ++++----
 tests/conftest.py                      |   12 +-
 tests/test_validation.py               |   19 +-
 tests/unit/test_devsig_header.py       |   17 +-
 tests/unit/test_get_config_from_git.py |    2 +
 tests/unit/test_patatt_message.py      |    4 +-
 tests/unit/test_run_command.py         |    5 +-
 uv.lock                                | 1515 ++++++++++++++++++++++++++++++++
 11 files changed, 1753 insertions(+), 217 deletions(-)
---
base-commit: 274198d9d5cc315c9588bf84cc7b53a7261726e4
change-id: 20260419-stronger-type-checking-3702559acba9

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

