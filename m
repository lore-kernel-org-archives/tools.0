Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E545631F995
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769175; cv=none; b=C+d+HR/byr/qBwXJesWjczIGf/xoZ8s5KItj8pjgQSZVHFeOeXj+gwK7GTAXJvijbEVM15t4OtzoqSWfIMRDS8Vam5aP7s07eZ3Z6Pfm9yEEIke+sqBWgKY+QKEHpthScSkblf52C99DedHyhyxaOXbLsCHTpi5JM1TjRUmnltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769175; c=relaxed/simple;
	bh=n7KEyA00jpbT68C2OmFhmsOqxzMxtmQDtwrO8wxvECE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n8d7coPkQ3msECEKeKeNcjg1ZeumWqQtttiw4sVLmm4srP1sp9o2bDk2tOWnV7WaU2KbQOC+ByXmlp+/FQGfKurlbQgpct5tVBe9N/C7KDV0ZxPp/rYMyvkyRc3PJ9EKtQguOA4q5yoyC9tOuJqwba3u+1tgtc8TyEqo6LB9v/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qCvazadw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qCvazadw"
Received: by smtp.kernel.org (Postfix)
	id 349071F00AC4; Mon,  3 Aug 2026 14:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F361F00A3F;
	Mon,  3 Aug 2026 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785769173;
	bh=d4W/CCxXUm/MWyFlOhQXukK7WrD86S/PTNfZ7zV58K0=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=qCvazadwEIcT9ke1Cz9hm8Q/iq4IzaZNRaGhxTJ90gUAxtLjlyHBzyHug8FEUHvHg
	 XPuCuffgHkSVXVwupfr19P4uUayjL+y79KH1JweFaCg8hlhzjPoNaeATxCw7pnoxB+
	 m0Y81tWQgaF20m0DKlMlfjEnalT1Zl3tARo6xhjU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
Subject: Re: [PATCH b4 v2 00/44] Stop the editor branch guard from eating
 review replies
Message-Id: <178576914205.191616.16357234291813431821.b4-ty@b4>
Date: Mon, 03 Aug 2026 14:59:02 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6037;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=TkOaZwglr8EZKA4J8vf7p2LytPj+Cd/4VI+X3w+n05s=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIK1lwQy5j8eMMPyaMfXCdG3NTXajY64nzavsj/IuMPo
 T2SU/7KdJSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZiI1x5Ghr9fdD1LWRpfaYov
 DdnKL5nNYvPRTC4lZ7fqibTmJ4yffBj+e0ufdfLx+aP1TW13voJM+aq5d0V/Xv4VLPcmaPn1x/X
 5HAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 31 Jul 2026 23:58:41 +0200, Christian Brauner wrote:
> Stop the editor branch guard from eating review replies
> 
> Reported from a live "b4 review tui" session: a reply editor left
> open across a branch switch dumped the reply into /tmp and took the
> TUI down with a RuntimeError. Digging into that turned up four editor
> problems, one patch each:
> 
> [...]

Lots of good stuff in this one, thanks!

[01/44] review-tui: mark all outgoing mail as read, not just review replies
        commit: 948b34772fe49348bcd8d44ab77a901a6a908696
[02/44] tests: cover the shared outgoing-seen helper
        commit: 23597716417b8440683c6ecea47e73391c4f0786
[03/44] review: close the messages database when auto-marking fails
        commit: 555ccb35388e4e87b9f07d85bc5f8fb8fb95d54e
[04/44] review: use the same busy timeout for both review databases
        commit: 1293d3348f60cbc77445e3e5a820e57dbd8eedde
[05/44] review: drop the unused return value from set_flags_bulk()
        commit: 95353ddf21c4418afee87d06914a04c1a7ab42ce
[06/44] review: don't let archiving a series raise
        commit: f4ad2d4b9999324190eeb44f9a7f46e0f9be279e
[07/44] tests: cover an unwritable series archive
        commit: 0034a180bfd8a54ca600048764101cb626cfc423
[08/44] review-tui: keep post-send bookkeeping out of the send error path
        commit: 6774a89a38fc22343b805ea22a2b0aaec642f6da
[09/44] tests: cover the thank-you send's post-send bookkeeping
        commit: deb709c02d78abaf37fa2e989d3ae5e24fb5f028
[10/44] review-tui: say which way a take did not reach 'accepted'
        commit: 126ed0862cd1c879a22e2e89152af28a2f88d665
[11/44] tests: cover the take statuses in the thank-and-archive chain
        commit: 96d71e8663c302b3b89cf36c98adc214655615ca
[12/44] review-tui: use the shared helper to delete a review branch
        commit: eefaab0e3e4675c6ae67108de502c519eea871c1
[13/44] ty: check reachability in the repository the commit landed in
        commit: d993556653db1c552a17642d839abf15aeb669f6
[14/44] tests: cover the publish check using the repository it is given
        commit: 142a31ac09c159254f82616ab6f99bef6ffc1d8a
[15/44] edit_in_editor: make the branch guard opt-in
        commit: 6a4f6fefa1a2222ba9d244724f39ceb4331d837c
[16/44] tests: cover the opt-in branch guard in edit_in_editor
        commit: 1355ccb50e9f91a5794adf1c5d29a5c95e5f06ab
[17/44] edit_in_editor: work in the tree the caller names
        commit: dbfff82426f5342782f0bf9cc5cf02cdd6d77fb9
[18/44] tests: cover edit_in_editor working in the caller's tree
        commit: 7234a6a591bd871c7b4b87091d03dc2a190ddf34
[19/44] ty: edit the thank-you review in the tree it was pointed at
        commit: c13051a7ba57da9d1f138b91b17e43c265fa4729
[20/44] tests: cover the ty review editing in the named tree
        commit: d97bf68b1d6c4c91e3e5b4971cfa861612c90b05
[21/44] tui: route editor launches through one non-fatal helper
        commit: dce0ec7fba89e9be49cbc428df1136194327c396
[22/44] tests: cover an editor failure leaving the review TUI standing
        commit: 0e13dcbb870ab0f5cb6961b6e62f240472126905
[23/44] review-tui: only put back a branch b4 checked out itself
        commit: 0d656242e4ccdc8e13d757ec7afb9b9cbd794394
[24/44] tests: cover the review TUI's branch-restore guard
        commit: d8465a962e0f1ec7bc62f9d2633881d2da8cbd83
[25/44] review-tui: put HEAD back where it was when it was not on a branch
        commit: e33672bb52271f4cd2eb25623afee705e3ce50e7
[26/44] tests: cover the restore from a detached HEAD
        commit: d142e7f4430e7cdc2e68516fa089e8df5973506b
[27/44] tests: pin the default branch in the queue-delivery fixture
        commit: 12779c7f9ea8b216cd655765c6953c978e386a73
[28/44] ty: an unknown remote tip is undetermined, not unpublished
        commit: 0f48dad71e528f9f8593afdcda3761687947c60f
[29/44] review-tui: keep post-send bookkeeping out of the review send error path
        commit: ef00f109f2080a8e31c311ae919315d28f0d2918
[30/44] tests: cover the review send's post-send bookkeeping
        commit: be0531bf1dfe307fafd49efb567d36042d9baefc
[31/44] review: close the tracking database when archiving fails
        commit: 1e6691c86a458dd96d4d33050792086318bd1853
[32/44] review: clean up a review branch that cannot be finished
        commit: dd969668b5b9615d33db4cd3245b9a93cbf62835
[33/44] tests: cover create_review_branch cleaning up a half-built branch
        commit: 94cdfa81ed2d789c42a096466f4f3693d8de26f1
[34/44] review-tui: put the branch back after a revision upgrade
        commit: cdf5b1f06f12b52e3d77a2c8409a296ccbfd3b1e
[35/44] tests: cover the revision upgrade's branch handling
        commit: f0309ce2ca0db188b25d56cb197c20711ed3f9b7
[36/44] review-tui: restore the original branch however the tracking loop ends
        commit: d56c99b310acaeeb28b1e199a72e49b1b83267fb
[37/44] review-tui: do not let a failed tracking load skip the branch restore
        commit: dd49f6cb850f6e8462ff78bf19d81843a8f47ad4
[38/44] tests: cover the tracking TUI restoring the branch on the way out
        commit: c94d19a70d00a17601cefe3e1ce8e4bc83af68ce
[39/44] review-tui: close the tracking database when the status sync fails
        commit: 4ae34e00412023396e0b8bca3a24f8a9a776a388
[40/44] tests: cover the status sync closing its database
        commit: 6d45cb9e2e50d9813d5f790573b6a2d960996835
[41/44] review-tui: catch the exit a failed checkout reports itself with
        commit: 5ca28d0a0716ee4758247efb18cbc19b25c9eb0f
[42/44] tests: cover a failed checkout leaving the tracking list standing
        commit: 884061a3a5b7f43c803a1604e94f9311d925e85f
[43/44] review-tui: put the user back when the branch they are on is deleted
        commit: 9b4b96f9a4277de1c81285178eb61934d02aadb0
[44/44] tests: cover the branch delete leaving the worktree on a branch
        commit: 150e1cd2b89de45ee6ac19b39b188e9e1b226657

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

