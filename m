Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE253CF054
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179933; cv=none; b=jRAcpApwlitp4GAZIZ9tB3n+AHtUvvuDAnw6ApfdYQMVXo07C6TDFKGUM87kqMApXCpAkPN5kJdhDqasT+bc9M4dNEAowbWAffPD3EaFVdOZYMwY45JGBf/y6RXZywDFMgTL5YTpeG2KLQQibI2tSdUWWfFZ/qtty59NJCihaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179933; c=relaxed/simple;
	bh=fE0L1sDe8m5QvtzHafczpt9HPvdVo8qfhQ25u8VYvtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D+JnfYewnm583+Csn7X+ghvSFOuUdI5F8A80twVQ6xgitXj5ws6q7ylFbyUl47SivzJ7lPVeM0zFaAcnL8cXk8cfpZ7QwfUiZ8gO/LgbX7L1Jk4PpEnZ32FSHIZCm7CahGmq5MaQLras1gEvVC9jw3+G6LJ5Ys3sbSUt+41H56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sV3iDJbU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sV3iDJbU"
Received: by smtp.kernel.org (Postfix)
	id 62F931F00A3A; Mon, 27 Jul 2026 19:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0904F1F000E9;
	Mon, 27 Jul 2026 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785179930;
	bh=n0ABljaw1za0W5NZ62DOAtQfrGdfg6dobJP1dygcEMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=sV3iDJbUKwU8/Jl99avEuRkVTOLuxBkk4H7Kse3iWCjNEJXMHaGHoF8jilFGmnadN
	 /uOxTzl5zZ7a4sXFa6GDy3T1t4xfH1r4Ojqz/X8C+yfwWUt2x1znHTjCEKwIRXAbso
	 nskGU5f9Ctc4hY1nqhnJUcZgIUyyZhTSbjY0QrIw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: "str = 'test"@example.com'
In-Reply-To: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
References: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
Subject: Re: [PATCH b4 0/2] review-tui: don't gpg-sign throwaway test-apply
 commits
Message-Id: <178517992177.2787052.15494677557294989585.b4-ty@b4>
Date: Mon, 27 Jul 2026 19:18:41 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=742;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=kWS5hBlFpASHB0kOE6ijSOKBRh2Hb99OHqJ0cUPdsAw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLS14safFNZa2lz6ekRlpbvpy713Q695am3/Je7RMv+B
 yyydy3XdZSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZjIomsM/6PPmxWmTzraatH9
 v7N2qtVs7lMbzYwkhCu/1V74pv9qiSvD/zyFl5PUjuaeWNO/8MRHaYWLsncvMf4sX7i9PntjVlW
 XIzsA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Thu, 23 Jul 2026 10:33:34 +0200, Christian Brauner wrote:
> review-tui: don't gpg-sign throwaway test-apply commits
> 
> The take/rebase/target/base modals check whether a series applies
> cleanly by running a real git-am into a temporary worktree and rebase
> additionally probes with a cherry-pick. The four modal probes run from
> worker threads while the TUI keeps the terminal.
> 
> [...]

Applied, thanks!

[1/2] review-tui: don't gpg-sign throwaway test-apply commits
      commit: 5d8552b43ac37ce1afe2c68bc8c0f9c6bda74063
[2/2] tests: guard the test-apply probes against gpg signing
      commit: 51d35371f26919fc8b042178705487fa6228d115

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

