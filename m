Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE283EBF01
	for <tools@linux.kernel.org>; Thu, 25 Jun 2026 16:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406591; cv=none; b=f8HQHpTMUA4Shyjd+vH01LWjRhC138bat81VITJyl23WBfXlI+yuz8g2VlWLnlCJJkEuHHXYSpcKms71VDlM/CmDsusRth7X9WCaK+lsoXdCXNa3kCpov0r8+Mf6jo3ekmHc90+aUU2y2R8u7XSoxUzjmhTCDkCibQ5Fp652Jvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406591; c=relaxed/simple;
	bh=QO1z1My4WOKsSPzfNKEB6B4pa+jxJpdE21yitBVDP9M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IVwO4ciWc3bOxkdhMQ/Pw6SSR7KUzmAK5NF8ypie+0wteZHikZX0rUYaYBUrI/f3Ef6WdD0FOSns9ma0WhVTORWS/grw3lPj1ZsZHX68c+PqzFmiRHfs4RIbjkW4BG7Mm5ccTpSWgjPWRPeUETp6XE6eIbkdeK2TrHOme5erX3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dWQ91z2l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dWQ91z2l"
Received: by smtp.kernel.org (Postfix)
	id 6EF471F00A3A; Thu, 25 Jun 2026 16:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9371F000E9;
	Thu, 25 Jun 2026 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782406590;
	bh=MCn73oK+1r9l65grae71kQD9uzMFqn7dcOu5oot9UUk=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=dWQ91z2lEFfyOWpga+/xv6qGG6t1DR8LafJqjacLH/5IrEJ5qe+i5yaaO/dgWzC3k
	 kZQo6aiY9yAQWkzFNhrjvBmWGK05BNEKbk2jqMBWkS746gDn14spagBAhBagYQ/Pu1
	 NXmYW1sRBNS488S+nulN0aSWhrdvEsFlJ2YM6cVw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
References: <20260625-shazam-resolve-native-am-v3-0-622b37a7f3b2@kernel.org>
Subject: Re: [PATCH b4 v3 0/9] shazam: stop --resolve from silently
 dropping commits
Message-Id: <178240658581.13679.4664987884278426086.b4-ty@b4>
Date: Thu, 25 Jun 2026 16:56:25 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=XT+3Ubpe4U+QMbKsdfrjl15hBfn/B9oqzwqXlFCdjN0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJsY/feLW55aGqnt870hH6fza5HzkfLFZUad3TaXZ27+
 dCHz+8TO0pZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAExkjxvD/0g92c3vS0IXMXV9
 Sw1xmDDZ64j1oZ8u83/tbk2/aFZmMZPhn9m6z/fPnuHJ8V9fpWcfGlHfePl1+N6dLz2CCtJj126
 YzQMA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Thu, 25 Jun 2026 14:09:20 +0200, Christian Brauner wrote:
> shazam: stop --resolve from silently dropping commits
> 
> b4 shazam --resolve exists to help land a series that doesn't apply
> cleanly. The problem that motivated this series is that, while resolving,
> it can silently drop whole commits from the merge it produces: you end up
> with a merge that is quietly missing changes, and nothing in the output
> points at what went missing.
> 
> [...]

Applied, thanks!

[1/9] review-tui: lift worktree am-conflict helpers into b4 core
      commit: 6b15cfa16456da10b8af880545435b66e5d9495f
[2/9] shazam: resolve conflicts via native git-am, never dropping patches
      commit: 7190ccb7f1a3c8fbc3e012d166f132af63c11f74
[3/9] shazam: test native-am conflict resolution keeps every patch
      commit: bb612997ec37248ea5522f76620fbdc01587f44b
[4/9] shazam: resolve conflicts in subdirectory files, not just the repo root
      commit: 5c23710165d4c2795060e89269334822f2bb0c75
[5/9] shazam: note subshell alternative to the --resolve two-phase model
      commit: eb4912334a3a0df55e8d1565f8e21a81770a7ba3
[6/9] shazam: resolve --resolve conflicts inline via a subshell
      commit: 51ddf6927cee81f0a5ea948658c0f50c617b38e2
[7/9] shazam: test the inline --resolve subshell flow
      commit: 13bf2b686de5fa54637ef3651fde7684d3386677
[8/9] review-tui: don't leave a take's target worktree mid-conflict
      commit: 84ad10c6c8b903c9b337e7ef15c32eab96788f15
[9/9] review-tui: test take-worktree conflict abort and dirty-target guard
      commit: 4ce46544a9c9dd12d56ce559da2f746e006c4e2d

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

