Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D928432B99F
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474500; cv=none; b=axZDK5jXZ0ElLTfe7daeOLEiepfvTY60Oaoo/dl7cA6/LL3SEAaXVzoRG8un0FsPraTdZYKmD9OGXKZB7oMAxMVgGy+WhgSD8a2kmrw3KiQYjGcg/q+uYknccVK8Iht61BQnjk0b8EuSU0Q3xyksIfV5zi1Wj8M73VaEwgQeOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474500; c=relaxed/simple;
	bh=YFy4H623zp2V3nVc+1oxp6GsbKn46Ju8b6FPmTAJBbo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XKfju5/ibpUpJZpu5SQ6GQSC0SYtXBCLmrz02WP64ZLBOVF8eYUA8v4ynRu9CBfSrpyUNmOBywrmRq6zqtJnXjbnsWjiZBqpMrzzziYR1AHS7z5/ZQt+ybAKS0JBkTA6bvXarJSx848AYxSnutRF6kZPxzkRL2xaF4RJwzafoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wCPv0fxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wCPv0fxB"
Received: by smtp.kernel.org (Postfix)
	id 73C1A1F00A3A; Fri, 31 Jul 2026 05:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB061F000E9;
	Fri, 31 Jul 2026 05:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785474498;
	bh=G/QMnNfT5lRZdsWwA4JLdpbW3+/jOlCk9Pnapsvw2bA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=wCPv0fxB8QyPSmVVtQi+w+BJw+vlskWpPblF4EDxObXI79mkLENkwafMJHZiAkjlG
	 j85yOb+OAk+mfgdUqyPLEdTGLL7TjzJDDEYf3QcD/DbODGzi480tGOzhzkz0NMDidJ
	 HV54g6cHv1fSSuy9aaxWbt0dMFlv0B0p/+XevK0U=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
References: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
Subject: Re: [PATCH b4 0/6] Keep the user's git config out of b4's scratch
 worktrees
Message-Id: <178547449320.3880964.5864663412892541301.b4-ty@b4>
Date: Fri, 31 Jul 2026 05:08:13 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Cn5zAZzjhC+GmOtgididxwwrtz6Y+52aiZ74QQWOzgk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJydA/qXa7k/HPolIu2OXfXsmhZre9b/3u7eu7pWtp9f
 vmma/VTOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzk9hWG3yz+HRslDsRJLbLI
 ibzAWpnF+ibfuO7p4b9WP6VvLc64p8fwTz24xamsw0xHsk1bpderTCzt75SLc06sEG1x/Rd/cVs
 4IwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 29 Jul 2026 12:44:27 +0200, Christian Brauner wrote:
> Keep the user's git config out of b4's scratch worktrees
> 
> With submodule.recurse=true in the user's config b4 cannot apply
> anything in a repo that carries submodules. The scratch worktree's
> sparse checkout recurses, looks for the per-worktree submodule clones a
> just-created worktree cannot have, and dies:
> 
> [...]

Applied, thanks!

[1/6] git_run_command: look past -c overrides for the subcommand
      commit: 97e09203a66f7849500cd0258d83864c15535461
[2/6] shazam: ignore the user's submodule.recurse in the scratch worktree
      commit: ea34dcdac92304fa422ee90ab9b541931d7e527e
[3/6] review-tui: use the shared scratch-worktree overrides for test applies
      commit: c9a21b8111ddd79485a4e8d787ff43158ee49aff
[4/6] fake-am: use the scratch-worktree overrides in the staging worktree
      commit: cecec5d1844fdbcc4cfa90e56b10f6358eb4948d
[5/6] send: use the scratch-worktree overrides when tagging a sent series
      commit: 0abeddbb46c2f86b052de4e31816912246bd9d23
[6/6] tests: exercise the scratch worktrees under submodule.recurse
      commit: 6991ac96a05cd410c1734a0cd15307481f11860b

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

