Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A7334C08
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797955; cv=none; b=fpZKgsx+tbc7mzXixMklPeHCMKGU6VpEHgNvYTVkqQ4IwhYcEkc/1WCmUEjASyxUXhguJIIPzXQdIEabum/VPNTdIlXKC/MRedY1ZJPt0N6gKFQgeRLi0SZrx7oIvg6jalVnvaINISWT187PQeOYrW+TSEe6Ib9d1lFfeiQhsh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797955; c=relaxed/simple;
	bh=vaGvH12c34k8/UdTyeystnWE8dRhffdVARu2BXIhl3Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CAjMupayNIW/ywKZ4NuSUpchWEegxiQkQBvSyx1Zq7N7Pw4V5vriA8W2P5hIuCNhX7xv1j2tepM1WGYXUtQUQ2OELyLZDEvHBRD9jJgwQ08AngO4iEm1gr7XWaRHqxPzkYgAFbmha2mXQXOdcSbnR0TXjXcrYiSed+zv20weeyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ponVFGA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ponVFGA7"
Received: by smtp.kernel.org (Postfix)
	id B0D92C2BC9E; Fri,  6 Mar 2026 11:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB99C4CEF7;
	Fri,  6 Mar 2026 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772797954;
	bh=vaGvH12c34k8/UdTyeystnWE8dRhffdVARu2BXIhl3Y=;
	h=From:Subject:Date:To:Cc:From;
	b=ponVFGA7XtG22a59jHxVOv6U2w9TVoNYobz8RnsVZKFIu5xFAnb8C+LnmZY424ge6
	 9B1B9sAErnY3f8oxqJf0AMrxjt9kCALu0tC81AfhO24MTSwt1t1OMGFrUtDJiwADaf
	 pKzrvgjWhAx7WR84xow/g5BKrnNP2c0AOsP5LdN50ftRcQppShRxrMaB+LKfanlOmU
	 c6gjM0xg4+Hyl6qm4BexOa5j5hlqiU5Cx4UHcTHIV+j3Y4DwyML5lkkGSjXoNCqJul
	 ulyvwxhwSEtXuvpJF6xrIio2Q1/7lINPvl0YhQrGZYd22UOxbZIAqPMzZzG0IXpRHG
	 56wximMiyy5mQ==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/3] shazam: conflict resolution support for b4 shazam
 -H
Date: Fri, 06 Mar 2026 12:52:23 +0100
Message-Id: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPe/qmkC/yWMQQqDMBAAvyJ7bmg0VrRfEQ/JdtUtNJZdLQXx7
 03qcYZhdlASJoV7sYPQh5WXmKC8FICzjxMZfiSGylaNdbYxL68riWm7zrXOlYg3Cyl+C438/Y9
 6CDUMp9MtPAnXfMhV8EomiI84Z7UITxyv5xKO4wf9v3mJjgAAAA==
X-Change-ID: 20260306-master-89938331cc50
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Christian Brauner <christian@amutable.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Christian Brauner <brauner@kernel.org>, 
 "Claude Opus 4.6" <noreply@anthropic.com>
X-Mailer: b4 0.15-dev-ace2f
X-Developer-Signature: v=1; a=openpgp-sha256; l=9068; i=brauner@kernel.org;
 h=from:subject:message-id; bh=vaGvH12c34k8/UdTyeystnWE8dRhffdVARu2BXIhl3Y=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSuOsBgYzHrQlSj7t+bK14sjty+d53hxEnGcZ/mP/zJ/
 EV6uqPNho5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJtDky/NPeu+hydM5p+49m
 vKJB4TNa+74Whju9XO7I+nZz7SyHmnmMDPvPtq1YEMPGtp5vF0+56Pp9VtcC+ruOXQpaxxE+/b1
 dITsA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

When b4 shazam -H applies patches via git-am in a sparse worktree,
conflicts cause the worktree to be destroyed before the user can act.
Additionally, three-way merge was never enabled, so even
auto-resolvable conflicts would fail.

This series fixes both problems and adds a conflict resolution
workflow:

Patch 1 refactors git_fetch_am_into_repo to use a deterministic
worktree path and a structured AmConflictError exception, laying the
groundwork for the worktree to survive a failed git-am.

Patch 2 passes -3 to git-am so three-way merge is attempted
automatically, and adds a shazam-am-flags config option for further
customization.

Patch 3 adds --resolve, --continue, and --abort flags. With
--resolve, a conflict triggers a workflow where successfully applied
patches are fetched into FETCH_HEAD, a no-ff no-commit merge is
started in the user's working tree, and remaining patches are applied
one at a time with git apply --3way. The user resolves conflicts with
their normal tools in their full working tree rather than in the
sparse worktree.

Sample output:

brauner@so61 ⊼οѕ ~/src/git/linux/vfs/vfs-7.1.casefolding|vfs-7.1.casefolding $%=
> b4 shazam -H --merge-base=HEAD --sloppy-trailers --resolve 20260217214741.1928576-1-cel@kernel.org
Looking up https://lore.kernel.org/20260217214741.1928576-1-cel@kernel.org/
Grabbing thread from lore.kernel.org/all/20260217214741.1928576-1-cel@kernel.org/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 22 messages in the thread
Analyzing 49 code-review messages
Checking attestation on all messages, may take a moment...

---
  ✓ [PATCH v8 1/17] fs: Move file_kattr initialization to callers
    + Link: https://patch.msgid.link/20260217214741.1928576-2-cel@kernel.org
    + Reviewed-by: Jan Kara <jack@suse.cz> (✓ DKIM/suse.cz)
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 2/17] fs: Add case sensitivity flags to file_kattr
    + Link: https://patch.msgid.link/20260217214741.1928576-3-cel@kernel.org
    + Reviewed-by: Jan Kara <jack@suse.cz> (✓ DKIM/suse.cz)
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 3/17] fat: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-4-cel@kernel.org
    + Reviewed-by: Jan Kara <jack@suse.cz> (✓ DKIM/suse.cz)
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 4/17] exfat: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-5-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 5/17] ntfs3: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-6-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 6/17] hfs: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-7-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 7/17] hfsplus: Report case sensitivity in fileattr_get
    + Link: https://patch.msgid.link/20260217214741.1928576-8-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 8/17] ext4: Report case sensitivity in fileattr_get
    + Link: https://patch.msgid.link/20260217214741.1928576-9-cel@kernel.org
    + Acked-by: Theodore Ts'o <tytso@mit.edu> (✓ DKIM/mit.edu)
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 9/17] xfs: Report case sensitivity in fileattr_get
    + Link: https://patch.msgid.link/20260217214741.1928576-10-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 10/17] cifs: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-11-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 11/17] nfs: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-12-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 12/17] f2fs: Add case sensitivity reporting to fileattr_get
    + Link: https://patch.msgid.link/20260217214741.1928576-13-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 13/17] vboxsf: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-14-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 14/17] isofs: Implement fileattr_get for case sensitivity
    + Link: https://patch.msgid.link/20260217214741.1928576-15-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 15/17] nfsd: Report export case-folding via NFSv3 PATHCONF
    + Link: https://patch.msgid.link/20260217214741.1928576-16-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 16/17] nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
    + Link: https://patch.msgid.link/20260217214741.1928576-17-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ✓ [PATCH v8 17/17] ksmbd: Report filesystem case sensitivity via FS_ATTRIBUTE_INFORMATION
    + Link: https://patch.msgid.link/20260217214741.1928576-18-cel@kernel.org
    + Signed-off-by: Christian Brauner <brauner@kernel.org>
  ---
  ✓ Signed: DKIM/kernel.org
---
Total patches: 17
---
 Base: HEAD
Magic: Preparing a sparse worktree
---
Applying: fs: Move file_kattr initialization to callers
Applying: fs: Add case sensitivity flags to file_kattr
Applying: fat: Implement fileattr_get for case sensitivity
Applying: exfat: Implement fileattr_get for case sensitivity
Applying: ntfs3: Implement fileattr_get for case sensitivity
Applying: hfs: Implement fileattr_get for case sensitivity
Applying: hfsplus: Report case sensitivity in fileattr_get
Applying: ext4: Report case sensitivity in fileattr_get
Applying: xfs: Report case sensitivity in fileattr_get
Applying: cifs: Implement fileattr_get for case sensitivity
Applying: nfs: Implement fileattr_get for case sensitivity
Applying: f2fs: Add case sensitivity reporting to fileattr_get
Applying: vboxsf: Implement fileattr_get for case sensitivity
Applying: isofs: Implement fileattr_get for case sensitivity
Applying: nfsd: Report export case-folding via NFSv3 PATHCONF
Applying: nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
Using index info to reconstruct a base tree...
M       fs/nfsd/nfs4xdr.c
Falling back to patching base and 3-way merge...
Patch failed at 0016 nfsd: Implement NFSv4 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
error: Your local changes to the following files would be overwritten by merge:
        fs/nfsd/nfs4xdr.c
Please commit your changes or stash them before you merge.
Aborting
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config advice.mergeConflict false"
---
Patch series did not apply cleanly, resolving...
Fetching successfully applied patches into FETCH_HEAD
Merging successfully applied patches into your branch...
Applying remaining patch 1/2...
---
Applied patch to 'fs/nfsd/nfs4xdr.c' with conflicts.
U fs/nfsd/nfs4xdr.c
Resolved 'fs/nfsd/nfs4xdr.c' using previous resolution.
---
Remaining patch 1/2 did not apply cleanly.
Resolve conflicts in your working tree, then run: b4 shazam --continue
To abort: b4 shazam --abort
brauner@so61 ⊼οѕ ~/src/git/linux/vfs/vfs-7.1.casefolding|vfs-7.1.casefolding *+$%=|MERGING
> git add fs/nfsd/nfs4xdr.c
brauner@so61 ⊼οѕ ~/src/git/linux/vfs/vfs-7.1.casefolding|vfs-7.1.casefolding +$%=|MERGING
> b4 shazam --continue
Applying remaining patch 2/2...
Invoking: git commit -F /home/brauner/src/git/linux/vfs/master/.git/worktrees/vfs-7.1.casefolding/b4-cover --signoff --edit
[vfs-7.1.casefolding b125478aef10] Merge patch series "Subject: Exposing case folding behavior"

Signed-off-by: Christian Brauner <brauner@kernel.org>

---
Christian Brauner (3):
      shazam: refactor git_fetch_am_into_repo for deterministic worktree
      shazam: enable three-way merge for b4 shazam -H
      shazam: enable merge conflict resolution for b4 shazam -H --resolve

 src/b4/__init__.py |  51 ++++++--
 src/b4/command.py  |   6 +
 src/b4/mbox.py     | 361 +++++++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 385 insertions(+), 33 deletions(-)
---
base-commit: 5b4eaae60fd938a865dda1916885e9a1c7ddce8a
change-id: 20260306-master-89938331cc50

