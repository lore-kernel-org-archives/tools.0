Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314461;
	b=1D4ek+TbojOISE3JR06nmAvrzutNoFz1ODEp/C6wQtzbZ63yiKeJzXHK/RQ8ykkiseb6
	 EUlwqWmNXdZJ6lLzVC19Q30exjxDmd5ex6BybwCu3t+OsAacysNcmy2b4ykvOH/3awVDR
	 I7IdHmUOb1PcLvI2AaDdG2SnpaXz5oAXWT8S6uCE+GLur/ja5NYi2vKTgYtSLPGBvZkV4
	 6jYj8rLBY9Tgq+FsY9eFnsEwwbZrCcIZ6/3viu6hCA0lPpAztT8bRFSsc4qbRPq34yvj/
	 irZu0CwlQxgmlIikp6+K7NjMDISeaQhcF+3K4iytddO6V71vUxpPvguoSnG205Ki1mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314461;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=26lqpcqec1ZxRY54JV5UODdXwGk110k/ulnViPEco4M=;
	b=l0agI2iUZAcM9gexn35FPYBB5sHNs1tw3HgCRSqqvRiyaVeuE2kqNXj5O/Hvzi1hoVdJ
	 D+DrWlKHDP9TvKGqWah4d5i9hPfh/LC11KGMdxAQ4rXmIdPIgFIHKwflhH95TL1MkAmf9
	 0A00n8qEhirBIiLVNtUa3x8AnA6BXexspOQd4wXQaP6FXI5tUL8+Bl4z0vwzZpk+PyXmD
	 H4B6PIDJjdSjXbePQclsIQg9add5b9C6jrFezYXRfgB+L3OoXlqBFTIXpuaYkckjbgeur
	 DXyGbp3NFuzWmxhMKNkP8m9rWMT0mElmY40LghI5VTaD5aHjWsl4U30EMHzo3GN3F+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2AA60A262A
	for <tools@linux.kernel.org>; Tue, 10 Nov 2026 12:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69AA71F008A1; Tue, 10 Nov 2026 12:41:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314460;
	b=tSXumWfcZH6BlKBxRZAdpw/ca14T9MjppuVOXnZ5yIDuCFs/5/wsZeGiyYef/wZrDNM8
	 dvcpmDkYhaHaUmDzsETazf2q1AgaCJSgMfBAXxc9dsK+YPD8flS+l+heCTM2+GfBl4MWf
	 K4k2/7lpl5f+2p8bGOLkJhrg0YOnoumqhkR7uQxNkPr9So74E8OW/UzgoYpDrzyAXyyiS
	 pbWxZUIB74lXjtEUhe514x0vhJ/y5heuL6Ogwz3a/WcE9MfAIl1YhI65yY1/5KhaHaoWu
	 NkXx31JpeZpvikt9nvjNSbhIpgAhrr82NZDHI3cKgW8aRN73fIFYRRYg4b3h0Sa3DqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314460;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=26lqpcqec1ZxRY54JV5UODdXwGk110k/ulnViPEco4M=;
	b=X3mrZNXj4q7wFTQBnLxN1h7ft+AewcW6tfHNv5MidhbjXbBb1FPt9VzpqU+j18m8P7oR
	 PBDuyXfkrk9mU2jHOgwn+G+aF+jCPW/V91eLqfYSNW5c6m2bmQUXW2MGhLsXCAXbG6xBD
	 /ixC2fnMMrxUeqmbGe6f27qDof9U5tLosk+mW5T0svDWJKjkHuFl/GPxyPrK2gFGqLNH+
	 nI48r9uVzP9rYrlGvt20wGYHAY+JTdZ5Pyn39c/vl7K14E8E3uVaq2TynCA8vgmDnq2Ni
	 zGihB06Cy/bCsZe0QeUaVnoKOflYW7w/x7g33N16WatNa8/Z7CgRX1t1h0/9EthP8RA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 475631F008A3
	for <tools@kernel.org>; Tue, 10 Nov 2026 12:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 475631F008A3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A1B7C48187;
	Tue, 10 Nov 2026 13:40:56 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Tue, 10 Nov 2026 13:40:52 +0100
Subject: [PATCH RFC b4 6/6] docs: prep: describe working on a detached HEAD
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
Message-Id: <20261110-editor_refuse_the-v1-6-4b6e52f326a9@proxmox.com>
References: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
In-Reply-To: <20261110-editor_refuse_the-v1-0-4b6e52f326a9@proxmox.com>
To: tools@kernel.org
Cc: Gabriel Goller <g.goller@proxmox.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Gabriel Goller <hey@gabriels.computer>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794314454231

From: Gabriel Goller <hey@gabriels.computer>

Explain how to enroll a detached HEAD with an explicit base, which
commands work on the series afterwards, and the limits that come with
having no branch: only the commit cover strategy, a clean tree with no
git operation in progress, and rewrites that move only HEAD while
every other ref, including those another tool keeps, stays where it
was. Also describe the recovery ref that enrolling and later rewrites
keep, and how to go back to it when enrolling fails.

Signed-off-by: Gabriel Goller <hey@gabriels.computer>
---
 docs/contributor/prep.rst | 69 +++++++++++++++++++++++++++++++++++++++++++++--
 docs/contributor/send.rst |  5 ++++
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 17433f257a89..298fb31dd4c5 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -166,6 +166,67 @@ forked from ``master``, you can enroll it with b4::
 Once that completes, you should be able to edit the cover letter and use
 all other b4 contributor-oriented commands.
 
+.. _prep_detached:
+
+Working on a detached HEAD
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. versionadded:: v0.17
+
+Some tools manage the checkout themselves and leave ``HEAD`` detached
+instead of on a branch, and you may also be working on a detached
+``HEAD`` yourself, for example after ``git checkout --detach``. b4 can
+work on a series there without creating a branch for it. ``HEAD`` is
+the tip of the series, and the series starts at the cover letter commit
+below it.
+
+To enroll the commits at ``HEAD``, pass the base of the series
+explicitly, since a detached ``HEAD`` has no upstream branch to fall
+back on::
+
+    b4 prep -e origin/master
+
+The base can be a branch, which is forked from the same way as when
+enrolling a branch, or a tag or a commit, which has to be an ancestor of
+``HEAD``. b4 names the series after the subject of its first patch.
+Enrolling refuses a base it cannot use, history that contains merges,
+and history that already has a b4 cover letter, before it changes
+anything.
+
+To insert the cover letter, b4 resets ``HEAD`` to the base, commits the
+cover letter, and cherry-picks the series on top of it. Before that, it
+saves the original ``HEAD`` as ``refs/original/b4/<change-id>``. If the
+cherry-pick fails, b4 leaves it for you to resolve, and tells you how to
+go back to the saved commits instead::
+
+    git cherry-pick --abort
+    git checkout --detach refs/original/b4/<change-id>
+
+Once enrolled, the series works with the usual commands: editing the
+cover letter and dependencies, ``--check``, ``--format-patch``, ``b4
+send``, ``b4 trailers -u``, and ``--claim``. Things to keep in mind:
+
+* only the ``commit`` cover letter strategy works without a branch,
+  because the other strategies keep the cover letter or the strategy
+  itself in the branch configuration; b4 refuses to work on a detached
+  ``HEAD`` when :term:`b4.prep-cover-strategy` is set to another one, and
+  when the cover letter commit at ``HEAD`` was made with another one
+* b4 still requires a clean working tree, and refuses to change the
+  series while a rebase, merge, cherry-pick, revert or ``git am`` is in
+  progress; commands that only read the series keep working
+* when b4 rewrites the series, for example to update the cover letter
+  or add trailers, it moves only ``HEAD``, which stays detached; the
+  previous ``HEAD`` is saved as ``refs/original/b4/<change-id>``,
+  replacing the previous backup of the series
+* b4 does not move any other refs, so a branch, a bookmark, or another
+  tool's idea of the current commit still points at the history from
+  before the rewrite; update them yourself if they should follow
+* if ``HEAD`` moves to another commit while you are editing the cover
+  letter or the dependencies, b4 refuses to store the result, and saves
+  your text in a temporary file instead
+* ``b4 prep -n`` still creates a new branch, and ``--cleanup`` only
+  works on branches
+
 Creating a branch from a sent series
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 If you have previously sent a patch series, you can create your new
@@ -676,7 +737,8 @@ modifying defaults for some of these flags.
 
 ``--claim [BRANCH]``
   Re-stamps the cover letter and every patch on a prep branch under
-  your current git identity (defaults to the current branch). B4
+  your current git identity (defaults to the current branch, or the
+  series at a detached ``HEAD``). B4
   refuses to rewrite history containing commits committed by someone
   other than you — for example when applying trailers to a series
   enrolled from another maintainer's tree, or after you changed your
@@ -700,7 +762,10 @@ modifying defaults for some of these flags.
 
 ``-e ENROLL_BASE, --enroll ENROLL_BASE``
   Enrolls your current branch to be b4-prep managed. Requires the name
-  of the branch to use as the fork-point tracking base.
+  of the branch to use as the fork-point tracking base. On a detached
+  ``HEAD``, enrolls the commits at ``HEAD`` without creating a branch;
+  this requires an explicit base, which can be a branch, a tag, or a
+  commit. See :ref:`prep_detached`.
 
 ``--range-diff-opts RANGE_DIFF_OPTS``
   Additional arguments passed to ``git range-diff`` when comparing series with
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index 6cec79f70b2e..17b45d682e4b 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -288,6 +288,11 @@ The following happens after you send your patches:
 * b4 automatically edits the cover letter to add changelog entries
   containing a pre-populated link to the just-sent series
 
+This works the same way for a series on a detached ``HEAD`` (see
+:ref:`prep_detached`). Rerolling rewrites the cover letter commit, which
+moves ``HEAD``, and it stays detached. No branch or other ref is moved
+along with it.
+
 Resending your series
 ~~~~~~~~~~~~~~~~~~~~~
 If something went wrong, or if you need to resend the series because

-- 
2.56.0


