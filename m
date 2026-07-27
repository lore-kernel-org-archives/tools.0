Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A03876C9
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162936; cv=none; b=JZc1PnGevpOisXNc0e0uK50XsprimUb6Oac5GEj2TOqakmgSQN+Oyua8soBctTfKwxMS6cfGfPHdiUNMZY+Z193tkB2hKewFC2axkTq0d8H16c9dcF7tDg4KhOeMjl8H1vSfetgbs04jOp9s88sN6RduB8th/Mr7LeFSXbScG3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162936; c=relaxed/simple;
	bh=djga3Li9DcW4mXjPLV3HCXOH9NkAw/sK/JN7uXMj8iE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=HoZPolpk5GIRSlGBnl+48QUrgiKyPN0HLUzPE7l/iFuXOZbUDnjq0dZsL9Vu2JGMXtLN95G+lauOHfTRM/I0tWz3tH3oXZO1qX6lYKUJdV5PnJFvNs/EqXCS0BxQTDYkyhPiux3Knq5/l1Y9wyw1bXacYnbcjU/RoKJK3BJAtL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U22Fl0J5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U22Fl0J5"
Received: by smtp.kernel.org (Postfix)
	id 6E0E41F00ADF; Mon, 27 Jul 2026 14:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6DF1F01558;
	Mon, 27 Jul 2026 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785162935;
	bh=7F8lmMYYF3mgIYbRRC+fyLUPvcWjZBqtBHVZKPOF7IM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=U22Fl0J5kU6S9uHnfm7dkPjAUruZ6llc8s2pVj41poRS4M4zHAukz69d1onXNArSc
	 dn6gh1jKic1CMieCoVAyN+dTTk2K01YoKXIxvm6nyoavYbcWIv9zj5z5rQnZmfCT8O
	 V8iXoZlt4JNTxhwtxyJ5UCPADHrPRoHCUYHSG9Z36DjM/8WOvNidSvaSMUcCP5Vk1s
	 B1a8KfQD/CzW5QkC6lfeX4aurOlXkQO/Hvo7VXYuRthjUBS5Nb2tttwMkqqJOmIvSB
	 FXwG4JZ7Kkoln9acNozQAx4Fiwua/pYZbaAfat6jjYD0JztzopwdniWc8FSK3lCknb
	 25rAR3TCXDnTg==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/2] review-tui: don't gpg-sign throwaway test-apply
 commits
From: Christian Brauner <brauner@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "str = 'test"@example.com'
In-Reply-To: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
References: <20260723-work-b4-testapply-nosign-v1-0-a7cb7105e06f@kernel.org>
Date: Mon, 27 Jul 2026 16:35:32 +0200
Message-Id: <20260727-ordnen-zimmer-abseilen-f4c572bf1bf1@brauner>
X-Mailer: b4 0.16-dev-09492
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449; i=brauner@kernel.org;
 h=from:subject:message-id; bh=djga3Li9DcW4mXjPLV3HCXOH9NkAw/sK/JN7uXMj8iE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSl52y7vN6/T2vH5fXntZ3zz/rxTwxf3zb9sNViC8eHJ
 Vp53RXFHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABP5dJKRYUUaT/KbEJH7z5s8
 npyovB6+/7WC2c2K0NgLUzxn8Zev3cfIMIXFXCXu294mkTfnvaW5fqpIt1xIas+WbFlYa3bxOXM
 wPwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-07-23 10:33 +0200, Christian Brauner wrote:
> The take/rebase/target/base modals check whether a series applies
> cleanly by running a real git-am into a temporary worktree and rebase
> additionally probes with a cherry-pick. The four modal probes run from
> worker threads while the TUI keeps the terminal.
> 
> With commit.gpgsign=true and pinentry-curses git tries to sign every
> probe commit. pinentry then pops up on the tty that Textual owns in raw
> mode. The TUI repaints over the PIN dialog and its input reader swallows
> the keystrokes and so gpg never gets the PIN and the apply hangs. With a
> card-backed key this reproduces on every take.
> 
> The probe commits are discarded together with the temporary worktree
> so signing them is pure waste. Let's pass -c commit.gpgsign=false to all
> five probes. The rebase cherry-pick runs under suspend() and so cannot
> deadlock. But its commits are just as throwaway. Real applies (checkout,
> take, rebase, merge) are unaffected. They run with the TUI suspended,
> where pinentry works, and keep signing per the user's configuration.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---

It would be nice to get this issue fixed as I have to keep the patch on
my local b4 source to be able to use b4 review tui and I would like to
get rid of carrying that change (or something else that fixes it)
locally. :)

Thanks!
Christian

