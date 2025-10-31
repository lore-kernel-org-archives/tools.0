Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24322505AA
	for <tools@linux.kernel.org>; Fri, 31 Oct 2025 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761882553; cv=none; b=bhcsW6xbYLs1epdeA4UjXhVTV4Eg2yBX+rc/VR+rAUWSnToJcUrhrBzGovZHWB4jhnZOYB0yEAA8VtB7j9NF3/CFubWYnJq6tp5cRalw5nr0bJ1QXbdylFC80QtG40Sr4U7E0/xY0zyRSe4PYw6z6Zw6TYr8UtLWy6Z1U54xc1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761882553; c=relaxed/simple;
	bh=FormyfVOijCo8K+2MDoeMABmqO5l31hCLoRTEwZ78x0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FLnk68FQEdFeoMBGYGn7cjIyKGBcEcAyaPnFQQCPAYAdyHEEGW6RNh3diCyA3dpQAtHs2rgoXbUbdX3uYl3CNgFbEFk6UPURC51I8iG4pfU6QL6PiYG7X2unUBVqp1Mq7Y1Vp7J7kqXkdUTHx+biCd1uI4eDncvbmj77NJ5daq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wsic9/S8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wsic9/S8"
Received: by smtp.kernel.org (Postfix)
	id 8579DC4CEFB; Fri, 31 Oct 2025 03:49:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41DF9C4CEE7
	for <tools@kernel.org>; Fri, 31 Oct 2025 03:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41DF9C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761882549; x=1793418549;
  h=from:to:subject:date:message-id:mime-version;
  bh=FormyfVOijCo8K+2MDoeMABmqO5l31hCLoRTEwZ78x0=;
  b=Wsic9/S8laJeVeREUMVJ0WkkMSOK0Z1V6uTfI0NEgB6sG03Alt9F1MCh
   9vi5IaQPa7+OFGD5w+7ATHbOBegTmqDtvLzQKs7T0DQWDafEjxggzyg7T
   1krQHEI/KRdiTDPnNXQXhC7e85isrlQ/GRZET9zLIeLCXGXAncqbCdaCq
   UcZ1CJbOwC/6zdHCy3qR3Uev+r7jpUv9ftZnxwCN68Db/Ra1m+k2ROD0J
   476/fRwPT1L4SPU36Wgxw15/yeEtHumhUnytphP3u5ZV9+lDG4Y+3kdLQ
   MXzeRDQB3LiUkjrHVeUZlyzu0lpqaZ9UFm6PJWT+Nt4buyWKDD4okB4QD
   A==;
X-CSE-ConnectionGUID: m9Lz5mUkS56gZuUEvv552A==
X-CSE-MsgGUID: f9nj5KyfQ4SSjTrfRG/z2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63058211"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="63058211"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 20:49:08 -0700
X-CSE-ConnectionGUID: g2vPpgtgScyZ1qRT7rGW7w==
X-CSE-MsgGUID: dM8K9HHOTBCjD7KXbugwPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186462788"
Received: from c02x38vbjhd2mac.jf.intel.com ([10.88.27.157])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 20:49:07 -0700
From: Marc Herbert <marc.herbert@linux.intel.com>
To: tools@kernel.org
Subject: Unreleased, multi-lines git_filter_repo fix required to run b4 tests?
Date: Thu, 30 Oct 2025 20:49:01 -0700
Message-ID: <m2zf97ybma.fsf@C02X38VBJHD2mac.jf.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

 I learned the really hard way that I need this multi-lines
git_filter_repo.py fix at the bottom to successfully run "uv run
pytest".

- 100% pass rate _with_ that fix applied on top of git_filter_repo.py v2.47
- 3 tests failing _without_ that fix:

FAILED src/tests/test_ez.py::test_trailers[trailers-thread-with-followups-None-None-trargs0-compareargs0-trailers-thread-with-followups-b4cfg0] - ValueError: dictionary update sequence element #35 has length 1; 2 is required
FAILED src/tests/test_ez.py::test_trailers[trailers-thread-with-cover-followup-None-None-trargs1-compareargs1-trailers-thread-with-cover-followup-b4cfg1] - ValueError: dictionary update sequence element #35 has length 1; 2 is required
FAILED src/tests/test_ez.py::test_trailers[trailers-thread-with-followups-trailers-with-tripledash-None-trargs3-compareargs3-trailers-thread-with-followups-and-tripledash-None] - ValueError: dictionary update sequence element #35 has length 1; 2 is required

These 3 tests fail because they do use a (very long) multi-line git config:

[branch "b4/pytest"]
        b4-prep-cover-strategy = branch-description
        description = "EDITME: cover title for pytest\n\n# Describe the pur...
                                                     ^^^^

As found with "uv run pytest --pdb", they crash exactly where the fix is.

Unfortunately, this fix is part of git_filter_repo.py version... 2.48 which
is not released yet!?
https://pypi.org/project/git-filter-repo/#history

So what really baffles me is: how come no one else noticed this before?
Maybe some recent change in the default "git config --list" output
format?  Reproduced with git --version 2.51 and today's b4 509f56ff5c24
in case that matters.

PS: if some `uv` expert knows how to hack the uv configuration to use a
local git_filter_repo version in the virtual environment, by all
means please share.


https://github.com/newren/git-filter-repo/commit/4697eeb37b7c3c30b

--- ./.venv/lib/python3.13/site-packages/git_filter_repo.py
+++ ./.venv/lib/python3.13/site-packages/git_filter_repo.py
@@ -1683,14 +1683,14 @@
   def get_config_settings(repo_working_dir):
     output = ''
     try:
-      output = subproc.check_output('git config --list'.split(),
+      output = subproc.check_output('git config --list --null'.split(),
                                     cwd=repo_working_dir)
     except subprocess.CalledProcessError as e: # pragma: no cover
       raise SystemExit('fatal: {}'.format(e))
 
     # FIXME: Ignores multi-valued keys, just let them overwrite for now
-    return dict(line.split(b'=', maxsplit=1)
-                for line in output.strip().split(b"\n"))
+    return dict(item.split(b'\n', maxsplit=1)
+                for item in output.strip().split(b"\0") if item)
 
   @staticmethod
   def get_blob_sizes(quiet = False):

