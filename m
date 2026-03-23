Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A53C07A
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267278; cv=none; b=idMPql0CrFdM66a7NtpiP7ZvoWOTf9nQB2BO3ytgLK24TmzQn4rRnTTA4nPh0FNMUjTXV81YgFpRPKzjZzmP5nkV1vHCQ8OeujXVptkg3Tnv8k9nufVVWORyyRkdjccBGjvHMfhrwGd+mBCm8CC9KkxmhllNdAbv/O3rVhHpZe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267278; c=relaxed/simple;
	bh=HWVktMB1gG+0njYKpIGHrMyzRIrD53osDsIj2HF0YGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WV03uzv7yeb5uRpXnloo4Jib08XKz0Vte0r1b0UqPvv1gM2jbNFWJwEZKwtaPNLKBYJDhysbbNipcZUHGtEjD6GWYmOAld7RhQ/ofVktTZAfLmKbDtoY2wOj45gvy5kFwFEnc90vWs9ufmFLkGT+Ut/XNFjL47g6ezAACmPQCRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=UvDzekNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="UvDzekNy"
Received: by smtp.kernel.org (Postfix)
	id 3106CC2BC87; Mon, 23 Mar 2026 12:01:18 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 415E8C4CEF7
	for <tools@kernel.org>; Mon, 23 Mar 2026 12:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 415E8C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=4E37v1QyXmVoBSL7HHmdopLJTjloAldnN4S8LbncXlw=; b=UvDzekNyangGbFS3wmql1YSc3o
	Sb60N68t5MjJLBgRMbVlF+x0XLufVnb524SG3t8zrtUc0hMBdup/VXraTBXdIH+JB97M6w5jA0/yu
	0OXsSqSMN3cHyzN0k52uuYrF1HgW9td2GCc99RqD8MoxgFe7GULlqQbiE5RqA6VSXOBKgQwCHhULA
	4v51VRWC1X/WuBAxGuXGuy9QjMKEqa97I+t14uFAwyiGkTrLS2Mo2wiY1B/CkkCd77oysPlLAl6Zs
	/mKh/tHS0SCD5/KlFW2egGa3RbGbneGgzOq9lWKNAA+XLumWEYcXkbe4falRvHwRwMKd1H0rGDgHO
	jWFVBdEw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4dy6-007W0v-IZ; Mon, 23 Mar 2026 12:01:13 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 23 Mar 2026 04:58:26 -0700
Subject: [PATCH b4] prep: add --cleanup-older-than option to clean up stale
 branches
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-cleanup-v1-1-cbf209f3de43@debian.org>
X-B4-Tracking: v=1; b=H4sIAOIqwWkC/yXMQQqDMBAF0KsMf20giWmLuYp0EeO0HZEoiSkF8
 e7FdvsWb0fhLFzgaUfmtxRZEjyZhhBfIT1ZyQhPsNpedWtbFWcOqa7KjRzcxTjd3Qwawpr5IZ/
 f1GNwuP+t1GHiuJ0FjuMLx/qMNm8AAAA=
X-Change-ID: 20260323-cleanup-4dea45140971
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-49f96
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791; i=leitao@debian.org;
 h=from:subject:message-id; bh=HWVktMB1gG+0njYKpIGHrMyzRIrD53osDsIj2HF0YGM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpwSuGRVSSMK1lJ87+d61FMqUp0fgp/blM1/c79
 w8zwb58u/uJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacErhgAKCRA1o5Of/Hh3
 bRzeEACt0DFHkTF0nWisQiAlFq4WoH/29Ul95Bdkh4T06HQgmHsyeQteGwmioYDsLdruDoy4poZ
 G0PvvcNYP2nIREZz7E/0e7//UfXZxuLeRdnMKenTWmziX8pJySx1zmA9WzwXlRFfBEHJ4YB+jzR
 7Ge6HqLE2cl1JfWi0MlUfgcg8/5H24sgxMCTd277ujtzsdR1NtPZm5GmPRTaLlqPkgRHpXNolzB
 9jx1kWJQAMw5k0lgzhQLfA4uj5o57bDIyYpyc6TKGQOsnjJlHzFi4+Bhe5u8qO/hEHU2NMNZ73n
 HHvYE+XI5GB2EBgF5HgIucRwJ2rKV+OwybtzhOudlhmZM1PnQIeUJU04DCPHUMeoE3VCJGfQ03c
 C1XyIbLRFGemVVkQDBFl5b5ydAQ/AricWBHPZIdYZV/QV8LVCxhBE6f9uosv5WfXY0Yrsjv3CNK
 PRZnn2LoNqdeyqFJYlXDNJD8eUod1IE9ViuVC9X5AvynLA33jNSjt7KwiXyu66Pkl9ldC81Sbdl
 fAXOgzoH0v8cwt4U9AaUwknYhIT10KQigRpAnuKzNEfFedgGRvpgeUiXLVd3u90umfRgQX08w+S
 QBfw1e7L2hIDHV29MXMbgpciqWoFi8SyfjDO4HxRgz2ljkj5Dslwjw1dvDjbOnunaJDZfznYckb
 Z9rr8CbY10KkMpQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

B4 is so useful that I have too many branches now, create a way to
easily remove old branches.

Add a new --cleanup-older-than DAYS option that archives and removes
prep-tracked branches whose latest commit is older than the specified
number of days. Each matching branch goes through the normal per-branch
confirmation prompt.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 src/b4/command.py |  2 ++
 src/b4/ez.py      | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/src/b4/command.py b/src/b4/command.py
index ca7f238..2d263de 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -401,6 +401,8 @@ def setup_parser() -> argparse.ArgumentParser:
                        help='Show series info in a format that can be passed to other commands.')
     spp_g.add_argument('--cleanup', metavar='BRANCHNAME', nargs='*',
                        help='Archive and remove prep-tracked branches and all associated sent/ tags')
+    sp_prep.add_argument('--cleanup-older-than', metavar='DAYS', type=int, default=None,
+                         help='Archive prep-tracked branches older than DAYS days')
 
     ag_prepn = sp_prep.add_argument_group('Create new branch', 'Create a new branch for working on patch series')
     ag_prepn.add_argument('-n', '--new', dest='new_series_name',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index b7afab5..70b9f97 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2681,6 +2681,47 @@ def _cleanup_branch(branch: str) -> None:
     logger.info('Wrote: %s', tarpath)
 
 
+def _get_branch_latest_commit_age_days(branch: str) -> Optional[int]:
+    """Return the age in days of the latest commit on *branch*, or None on error."""
+    lines = b4.git_get_command_lines(None, ['log', '-1', '--format=%ct', branch])
+    if not lines:
+        return None
+    try:
+        commit_ts = int(lines[0])
+    except ValueError:
+        return None
+    age_days = (time.time() - commit_ts) / 86400
+    return int(age_days)
+
+
+def cleanup_older_than(older_than_days: int) -> None:
+    """Find prep-tracked branches whose latest commit exceeds *older_than_days* and clean them up.
+
+    The currently checked-out branch is always skipped.  Each matching
+    branch is passed to ``_cleanup_branch``, which prompts the user for
+    confirmation before archiving and deleting it.
+    """
+    mybranches = get_prep_managed_branches(None)
+    if not mybranches:
+        logger.info('No b4-tracked branches found')
+        sys.exit(0)
+
+    curbranch = b4.git_get_current_branch()
+    old_branches = []
+    for branch in mybranches:
+        if branch == curbranch:
+            logger.debug('Skipping currently checked out branch: %s', branch)
+            continue
+        age = _get_branch_latest_commit_age_days(branch)
+        if age is not None and age > older_than_days:
+            old_branches.append(branch)
+    if not old_branches:
+        logger.info('No branches older than %d days found', older_than_days)
+        return
+    for branch in old_branches:
+        _cleanup_branch(branch)
+
+
 def cleanup(branches: List[str]) -> None:
     if not branches:
         # Show all b4-tracked branches
@@ -3089,6 +3130,9 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.show_info:
         return show_info(cmdargs.show_info)
 
+    if cmdargs.cleanup_older_than is not None:
+        return cleanup_older_than(cmdargs.cleanup_older_than)
+
     if cmdargs.cleanup is not None:
         return cleanup(cmdargs.cleanup)
 

---
base-commit: bc4c73c5333d7d88428e4ce970facd48d6b8b107
change-id: 20260323-cleanup-4dea45140971

Best regards,
--  
Breno Leitao <leitao@debian.org>

