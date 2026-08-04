Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D4346E75
	for <tools@linux.kernel.org>; Tue,  4 Aug 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846360; cv=pass; b=oU6dBb/kkAiSyusDHJv7hCWNJAxyXIJDu9G3BfWckdVoRvrZ7W5FCT1BPPHCAc8PO0kBDjz7bC2kXlkmYiiUekPrmRLMsRbwbfL4aH5HJT/O+mTG8MWRnicaWftg+Kvg2/oVqo4JKHsRdH4YiK4aSxA4cVzMnCewiO/XHPZ2Uyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846360; c=relaxed/simple;
	bh=NI3vALFNK0IXhcKEtqI+RyaWzjjq/A4gJ1ota3ZTEVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dKXZivkxPNHgxSMNWTXAxti0mrU10fw8m9wTOp4vyXJrmFxRK/bSKmb+F9MkhJG2IwKaK1Lq5VL/mgrbEwV8ET+AJUpGgprJuED+D94vpb8sKm3J6r+8EyFFKVFZCEu/BnSVvfqDnZuuqoQ9gxTyabP+N1+S8NoH88+5xiu5+JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=dS+JlnvA; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="dS+JlnvA"
Received: by smtp.kernel.org (Postfix)
	id 074831F00A3A; Tue,  4 Aug 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785846358;
	b=Iq8cAZGITUsODaU2jCN33uzSXRwaGsx1UMFCmeGIg+Gdv3ADZN3oMcZz67sBTchvpxD9
	 nEGHiUUq8bew55mbrbS05PSUw3hu2kgcWn/NZ7V5LPHoC2ia8iHWCEO/AGiVdOeIIrYbS
	 DvBL1pM1bvn6UFASH5cUnWxHFffrZh1GlqqP+7/iWWsV+ypxDhsiMJ4oV8w0LVcpjOkAX
	 MP90eZmXkx46xQR0+0Jf+yBFIo/KsBk6+cRVNS+7jDKzwBCtk+W3ciMrh9U6d73nxQb+N
	 c5zqFaf5GD5bB2dL1D9Lh3FQ84NxSlgX/pdvXSkkEeTw6FPl+2vr9Wcm8bI7bXZZoEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785846358;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=LmqLGmkule7CRqZcQPwHeja4YQUt2DsoE9Zqh+sOfaw=;
	b=eurmp4m1cEbWN8N3N0L6YSOvK6cGFuAvkZoBFEF6OF/gz4j/+ofAQDlUkgyTTbobhPxk
	 BIB+dczGfRwFOd4LjbbmTr2fjrFE8Rgwf6rQeJb7e1rPHfGAUjXfP0tnCIGijQ+bvCd0O
	 8VLi6mgk84Hh8Bz0EKe+gj7MYV0Bbk8otY/Ks9XlRGaIH0A4rkS+aXyxVEsaFwHi0TMiv
	 YpCTDEJPpqem9jcX/TcI1qp+0ASHkt/b+e7lvpk/DiJW9RMvflSfcbaVMC03v9JTwXBIc
	 08dFD0wFbSZuJfQQoSXLR+wewSAiNlGhSa8zbecEKAQ9iXkVEOA7cVvh3/uwQtZe1Ug==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dS+JlnvA;
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B0111F000E9
	for <tools@kernel.org>; Tue,  4 Aug 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dS+JlnvA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2B0111F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=LmqLGmkule7CRqZcQPwHeja4YQUt2DsoE9Zqh+sOfaw=; b=dS+JlnvAM5qBkHQDSjncnsW+fu
	jTEgJymPw5ZJZMWMlh4V2PLuUFe8WGKGzHEtMBf55BF899QPXrvGWlNONfHWyUFRK8XJZJwSuMw/i
	BwhlOTTHDKhX+B45LwsevPBG8Di1GAgeu9cUSu7fERdbut21LhaF/ndppGiiTC12C+GMBTi6h7jOQ
	dTHx8zul5k4BFuos53nexfbzfeE7WLH1Z4ghj2oi1wMiU0+aqeIym00XUdM8buP9oqJJTa9OzH7mM
	Q+fLrajIIvi05UCivQ4ZBwhU8L/thwfMLSR+AOEQfoFCdNG0oXYeFjtfEn9zpPUI/CCrffRMceMaa
	hWG6Vt7Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wrEDL-00D8aX-1C;
	Tue, 04 Aug 2026 12:25:48 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 04 Aug 2026 05:24:58 -0700
Subject: [PATCH b4 v2] prep: add --cleanup-older-than option to clean up
 stale branches
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-cleanup-v2-1-8c8df5d66e8f@debian.org>
X-B4-Tracking: v=1; b=H4sIABnacWoC/2XNSwqDMBSF4a2EOzYlr7boyH0UB3lc9ZYSJdHQI
 u69aIedHn6+s0HGRJihYRskLJRpitAwVTHwo40DcgrQMFBC3YRWmvsX2rjO3AS05iqNqO8SKgZ
 zwp7ep/QAZ6D7bXl1T/TLQRzVSHmZ0ue8K/Js/+QiueTe9UrUvQ5odBvQkY2XKQ3Q7fv+Baw08
 ka1AAAA
X-Change-ID: 20260323-cleanup-4dea45140971
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-51ac3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297; i=leitao@debian.org;
 h=from:subject:message-id; bh=NI3vALFNK0IXhcKEtqI+RyaWzjjq/A4gJ1ota3ZTEVU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqcdpGx9euXYPGggWTI2Hew8DfokxFYKQOvxDyt
 Oj4oJgJ1dWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanHaRgAKCRA1o5Of/Hh3
 bTvLD/9Pwn4T+u/MtZSmwYQA5bwEGOgOFvA3K4DYiYOUI/4q1bAFG0dyj5Tj5YhKfy9k25f7q9q
 bzlWhCQaotKn7fWqcoyM9i5PgLtxQO18pmci4+ljVRE+1U9O6SAliys1LM34JjXtxByC7yLgJrI
 gfj3/w0++Ly6w+a8RgHswSbjCKA8zUeNzIdVxP9RNGVYvGY3Lb9c0oN2Tkvc1bVPQLU0OqxkF5U
 LnkuRMzYIjlqb/Qq6pqlla4dvWtLf2gcR0qHA/Dke4zSHmOfj1lDTNKhjHN2RsgHBho3Wcryv8a
 k6ph8dPcV/JTMfzwWUxD92NlPbt54/U2+7rAeoy06aMiXBBPVaEBcWDLazWX1v0fvRdggA1Covd
 sswbg4v+IXROBCeOOS5vW6gSc2A66RWgmFLW2tm0r9iz6yd1ZWl/SYph8DWaQE/ERu5icF/vPsO
 gDdwuwx0lhDgb57FtBX96yrr54LAlCj6jX5z0rsFExQeg1j3g9ysa/qh1kowXLMKpNo3O60qgiU
 8D+HAxyGkDvOZCw174/vLgEPB7VnXWUH0+zpLyevbbVd0S6ljxE21tLL/sFk6CVmSi9zXVBp9Rg
 FC03wJteBpcQmCLbHVJS44p8XuaRkrkTrj5Y+zoWeiPIxjxQdvkfuSTC1iqpnSdq/KRDEwonP+V
 r2gFGBTxuviti1g==
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
Changes in v2:
- Rebased onto master; option moved into exclusive group, help
  clarified.
- Age no longer truncated to whole days
- Documented in prep.rst.
- Link to v1: https://patch.msgid.link/20260323-cleanup-v1-1-cbf209f3de43@debian.org
---
 docs/contributor/prep.rst | 18 ++++++++++++++++++
 src/b4/command.py         |  7 +++++++
 src/b4/ez.py              | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 20b34d7..bc470d4 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -354,6 +354,16 @@ patches, cover letters, and tracking information from your series.
 Afterwards, b4 deletes the branch(es) and all related tags from your local
 repository.
 
+If prep-managed branches have piled up over time, you can select them by
+age instead of by name::
+
+    b4 prep --cleanup-older-than 180
+
+This finds every prep-managed branch whose latest commit is older than the
+given number of days, skipping the one you currently have checked out. Each
+matching branch is then archived and deleted through the same confirmation
+prompt as above, so nothing goes away without your say-so.
+
 .. _prep_flags:
 
 Prep command flags
@@ -522,6 +532,14 @@ modifying defaults for some of these flags.
 
   .. versionadded:: v0.13
 
+``--cleanup-older-than DAYS``
+  Same as ``--cleanup``, but picks the branches by age rather than by
+  name: every prep-managed branch whose latest commit is older than
+  DAYS days is archived and deleted, one confirmation prompt at a time.
+  The currently checked out branch is always left alone.
+
+  .. versionadded:: v0.16
+
 ``--claim [BRANCH]``
   Re-stamps the cover letter and every patch on a prep branch under
   your current git identity (defaults to the current branch). B4
diff --git a/src/b4/command.py b/src/b4/command.py
index b8f7646..8a8c96f 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -1010,6 +1010,13 @@ def setup_parser() -> argparse.ArgumentParser:
         nargs='*',
         help='Archive and remove prep-tracked branches and all associated sent/ tags',
     )
+    spp_g.add_argument(
+        '--cleanup-older-than',
+        metavar='DAYS',
+        type=int,
+        default=None,
+        help='Archive and remove prep-tracked branches older than DAYS days',
+    )
     spp_g.add_argument(
         '--claim',
         metavar='BRANCH',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index ac3949a..483ebac 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -3625,6 +3625,46 @@ def _cleanup_branch(branch: str) -> None:
     logger.info('Wrote: %s', tarpath)
 
 
+def _get_branch_latest_commit_age_days(branch: str) -> Optional[float]:
+    """Return the age in days of the latest commit on *branch*, or None on error."""
+    lines = b4.git_get_command_lines(None, ['log', '-1', '--format=%ct', branch])
+    if not lines:
+        return None
+    try:
+        commit_ts = int(lines[0])
+    except ValueError:
+        return None
+    return (time.time() - commit_ts) / 86400
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
@@ -4076,6 +4116,9 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.show_info:
         return show_info(cmdargs.show_info)
 
+    if cmdargs.cleanup_older_than is not None:
+        return cleanup_older_than(cmdargs.cleanup_older_than)
+
     if cmdargs.cleanup is not None:
         return cleanup(cmdargs.cleanup)
 

---
base-commit: 62c5a3c2f841dd6533a9009e6ab4fee104bf3b04
change-id: 20260323-cleanup-4dea45140971

Best regards,
--  
Breno Leitao <leitao@debian.org>

