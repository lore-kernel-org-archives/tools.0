Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B5D18C03F
	for <tools@linux.kernel.org>; Sat,  1 Nov 2025 02:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761964383; cv=none; b=Lz/XZ7xt9DKOnRcQvwsai99r3w7FvFchQRr1OluWiRAsOhwePzvIYjjWF3B9663Co3AAhSIZAJ0qDlzquON+YLV8stmZwGDgu8rSK847xF4LSCzPaLp77NLM7ie7l0DTxDeV1x3Harud2hFA78tVUlMUdG5s2a/nGXWTgRuZewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761964383; c=relaxed/simple;
	bh=AnVW/3c0GfpylstXrO61TU1SoLrI7iOGRVn6NGl8fUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NV+uEwxT9eKs9TSTUTPun0iRz/QNgf+s3+Y/mHuhxm/WC2HjRZcykH7N9gRhS62MWA+QLVXfiWA13Fs4xD4kqG0bLborom1nyIBph+QYIebxjxwGcsQcrv9fAY3gtRooy/wqfxwq169lytRf5uSRddMnkqM+D33g2UcU26EeEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMTrPScn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMTrPScn"
Received: by smtp.kernel.org (Postfix)
	id 2F0F7C4CEFD; Sat,  1 Nov 2025 02:33:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4E1AC4CEE7
	for <tools@kernel.org>; Sat,  1 Nov 2025 02:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4E1AC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761964382; x=1793500382;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=AnVW/3c0GfpylstXrO61TU1SoLrI7iOGRVn6NGl8fUM=;
  b=TMTrPScnqv4Zs+xj30Y0fO6iRAkBYR20mSHLPnhdKxPFugUOArKeh58b
   nd2loRgAXQRwEz+z8o0wxgz5Id2zuiD9XGIEtWz53/Uz+gJn1vLFojTJL
   6SQSdpclX/O+aDcKFOIERsJQVpoVZXzojO+ySp+CvLxm3GaCOoCnuGxhk
   3w0TaUt00fqIGcrTEPipbKsv6OenTPMTnw+DkX7D0Xpf8YA8AZUZ/HMIn
   diZT8PnumlFwNwVqd7ATxmnltVS05c9EDEuomREv0TQKem/cJp+C4IsnA
   Z1nahNRW2yAtmevSOt/jSCfWlyir02eKT+1oYjYSY+Rq3pugiufm6w6VK
   Q==;
X-CSE-ConnectionGUID: 97ubBaEHTQuALp9+nNOz0g==
X-CSE-MsgGUID: Fftrq7YQQnGnTdQlU8VCgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75479373"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75479373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 19:33:00 -0700
X-CSE-ConnectionGUID: 7XQT2vU5Ts6SKkQ+Rxwsrw==
X-CSE-MsgGUID: 1gWl4sXxQmauEzZPsNhSKA==
X-ExtLoop1: 1
Received: from unknown (HELO hyperion.local) ([10.243.61.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 19:32:58 -0700
From: Marc Herbert <marc.herbert@linux.intel.com>
Date: Sat, 01 Nov 2025 02:32:46 +0000
Subject: [PATCH b4] test_ez.py: xfail tests that need unreleased
 git_filter_repo fix
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-xfail-v1-1-3f88d19a2e9e@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAE1xBWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwND3Yq0xMwcXQNT8xQLs7RE0zTDZCWg2oKi1LTMCrA50UpJJkqxtbU
 A5VsqHFsAAAA=
X-Change-ID: 20251101-xfail-057d86fa5f1c
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Marc Herbert <marc.herbert@linux.intel.com>
X-Mailer: b4 0.15-dev

Mark tests that need the unreleased, multi-lines git_filter_repo fix
with `pytest.mark.xfail()`. Blowing up the test suite out of the box is
not a welcoming development experience.

Show how to switch to any other, random git_filter_repo version with a
one character change in pyproject.toml.

Make sure pytest.mark.xfail() is off when testing git_filter_repo
versions other than the latest, broken one that everyone uses by
default.

Signed-off-by: Marc Herbert <marc.herbert@linux.intel.com>
---
 pyproject.toml       |  4 ++++
 src/tests/test_ez.py | 28 +++++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/pyproject.toml b/pyproject.toml
index 7b2c6e218df8..d32e8b28ebad 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -25,6 +25,10 @@ classifiers = [
 dependencies = [
     "requests>=2.24,<3.0",
     "git-filter-repo>=2.30,<3.0",
+    # Use something like this instead to test multi-line fix 4697eeb37b7c3c30b in 2.48 not
+    # released yet. See
+    # https://lore.kernel.org/tools/m2zf97ybma.fsf@C02X38VBJHD2mac.jf.intel.com/
+    # "git-filter-repo@git+https://github.com/newren/git-filter-repo#c1d8461ee34c6d3f",
     "dkimpy>=1.0,<2.0",
     "patatt>=0.6,<2.0",
 ]
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 68fd27b2822e..16c6838503b0 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -7,6 +7,10 @@ import b4.command
 
 from typing import Any, Dict, Generator, List, Optional, Tuple
 
+# For xfail_multi_lines() / git_filter_repo 2.47.0 bug
+import git_filter_repo
+from contextlib import redirect_stdout
+from io import StringIO
 
 @pytest.fixture(scope="function")
 def prepdir(gitdir: str) -> Generator[str, None, None]:
@@ -18,11 +22,29 @@ def prepdir(gitdir: str) -> Generator[str, None, None]:
     yield gitdir
 
 
+_out = StringIO()
+with redirect_stdout(_out):
+    git_filter_repo.GitUtils.print_my_version()
+git_filter_repo_hash = _out.getvalue().strip()
+
+
+# https://lore.kernel.org/tools/m2zf97ybma.fsf@C02X38VBJHD2mac.jf.intel.com/
+def xfail_multi_lines(*params):
+    # 'a40bce548d2c' is the latest and broken version 2.47.0 that practically every test
+    # environment will get from pyproject.toml. Don't blow up by default for a known issue.
+    # But let users easily test other git_filter_repo versions
+    return pytest.param(
+        *params,
+        marks=pytest.mark.xfail(git_filter_repo_hash == "a40bce548d2c",
+                                reason="need multi-lines fix from unreleased git_filter_repo v2.48"
+                                ),
+    )
+
 @pytest.mark.parametrize('mboxf, bundlef, rep, trargs, compareargs, compareout, b4cfg', [
-    ('trailers-thread-with-followups', None, None, [],
+    xfail_multi_lines('trailers-thread-with-followups', None, None, [],
      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-followups',
      {'shazam-am-flags': '--signoff'}),
-    ('trailers-thread-with-cover-followup', None, None, [],
+    xfail_multi_lines('trailers-thread-with-cover-followup', None, None, [],
      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-cover-followup',
      {'shazam-am-flags': '--signoff'}),
     # Test matching trailer updates by subject when patch-id changes
@@ -30,7 +52,7 @@ def prepdir(gitdir: str) -> Generator[str, None, None]:
      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-followups-no-match',
      {'shazam-am-flags': '--signoff'}),
     # Test that we properly perserve commits with --- in them
-    ('trailers-thread-with-followups', 'trailers-with-tripledash', None, [],
+    xfail_multi_lines('trailers-thread-with-followups', 'trailers-with-tripledash', None, [],
      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-followups-and-tripledash',
      None),
 ])

---
base-commit: a6db3f06ce9836a7fc8921f588452804fc62bed1
change-id: 20251101-xfail-057d86fa5f1c

Best regards,
--  
Marc Herbert <marc.herbert@linux.intel.com>

