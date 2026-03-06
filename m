Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B4366568
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797959; cv=none; b=ev25Jrlo8f7gG+kEQ7iQpI2yyjnB9p/h6k5dXb9j7eXsr6ospACra/nlNvS53AqoIeJdrIgTMGm+fDEQ0D1W6/KpltFUdc5e0bu2hA4fxn4lNe+S3AWUSz9pxIIePatSexu33V7DXkpXa200bc8QMffdoBvgCm5w2TdKCIoTdzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797959; c=relaxed/simple;
	bh=ffCJhjNMXe+jQFeY7e8expwD/gRdBgqfg90Qm78PP20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLhTbZ13emEnp+NWqMWjVKOq4Mmbd6kmVkLQ3wbr20KlsiLQ3jDEAuRPMhgWxSVN6DD6DxaWW16VxpV8TEyGE/oOjJvPxUHZNNxpWf8q0lWBxfE3iGhmWu4An2eVubRreXs4nCc4+oEQb8dre5y0zuZWL6G+WH1Ubatk+ft5bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXDA7vRQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXDA7vRQ"
Received: by smtp.kernel.org (Postfix)
	id 94062C4CEF7; Fri,  6 Mar 2026 11:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44012C2BC9E;
	Fri,  6 Mar 2026 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772797958;
	bh=ffCJhjNMXe+jQFeY7e8expwD/gRdBgqfg90Qm78PP20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JXDA7vRQ7CCB9ER6yPw6mPQzspb6BDVOIxZJwkfytrpToR6pFwW3ktefMERaBLn6k
	 /5xDbzqZVHCK9m1EjHQaOFb2YSe/IPhcXmkG2vBRa56gYSBH1ThM9yN2q7roVg7qzK
	 XJJ2xu3t4XimJJVTkdraHlt+xexunDsoIK1OqclQn4tCWlBbNNOkTEmZ+STeCOog6G
	 Fn3KsxwbXGjrTiNitbh46oQ8/4eWcPcKjrmzCgVFYc9DjxvMVYaiX2tExk3TcRubFM
	 Ps28bcq/VL9zxddjlD37ekDC4K3/zso8vRVN96GYQSoZ6SShltS2oZ0qgIiPvo3Dfi
	 beQA+691m2Gxw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 06 Mar 2026 12:52:25 +0100
Subject: [PATCH b4 2/3] shazam: enable three-way merge for b4 shazam -H
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-master-v1-2-5a4b9cbe11d7@kernel.org>
References: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
In-Reply-To: <20260306-master-v1-0-5a4b9cbe11d7@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Christian Brauner <christian@amutable.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Christian Brauner <brauner@kernel.org>, 
 "Claude Opus 4.6" <noreply@anthropic.com>
X-Mailer: b4 0.15-dev-ace2f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ffCJhjNMXe+jQFeY7e8expwD/gRdBgqfg90Qm78PP20=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSuOsBgo/ut50vQQ2HTm3KnbNcfmm54Sy2qZ/8FY3tVe
 fMug8pJHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABcpZmR4mjYvMnBmhYu2zYww
 22V9QXX5wvf78zcdMZLru3rbnOchI0M374ca/juCC2ImXzGJO7lfc/PkKpPC//9zTxscjK/o+ME
 IAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Pass -3 to git-am so three-way merge is attempted automatically when
applying patches in the sparse worktree. Without this, even
auto-resolvable conflicts cause git-am to fail.

Also support a shazam-am-flags config option to allow users to pass
additional flags to git-am.

Co-developed-by: Claude Opus 4.6 <noreply@anthropic.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 src/b4/mbox.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 132cbb9..0a86f6f 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -383,12 +383,21 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
 
         base_commit = get_base_commit(topdir, first_body, lser, cmdargs)
         linkurl = linkmask % top_msgid
+
+        am_flags = ['-3']
+        amflags_cfg = str(config.get('shazam-am-flags', ''))
+        if amflags_cfg:
+            sp = shlex.shlex(amflags_cfg, posix=True)
+            sp.whitespace_split = True
+            am_flags.extend(list(sp))
+
         try:
             if cmdargs.mergebase:
                 logger.info(' Base: %s', base_commit)
             else:
                 logger.info(' Base: %s (use --merge-base to override)', base_commit)
-            b4.git_fetch_am_into_repo(topdir, ambytes=ambytes, at_base=base_commit, origin=linkurl)
+            b4.git_fetch_am_into_repo(topdir, ambytes=ambytes, at_base=base_commit,
+                                       origin=linkurl, am_flags=am_flags)
         except b4.AmConflictError as cex:
             b4.git_run_command(topdir, ['worktree', 'remove', '--force', cex.worktree_path])
             logger.critical('Unable to cleanly apply series, see failure log below')

-- 
2.47.3

