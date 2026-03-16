Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50A40DFAD
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773689161; cv=none; b=ajfnFA2BZZq2RF60xuE/VzbJ9Ua3M96g9TRQ4mK4HKYcHAZdt4GTNwOlddn4UXDHjZElWVwH56LtQaCUrxiDuQFhUYkHYBhevDXe7+DAsjdUKKj/BLn5kQhJHj3jaufqMw9vuIkXOqOfKl6Cv9lfoftgqfgcfIu0LNgogBIoeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773689161; c=relaxed/simple;
	bh=NffH75vvoqCgjcW/XwXuKaxGKjwKAfLZXVPRPTxlGjU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fftzbljsT+aGRmHjs9ztSXCLoLFFIdu9OVkITbmJsQ7kIvNUZDn92iPlEvSRdwUjfliupRmqTLPRSZ0pUB7ETV73J6eTj5HR2Xd+mE2Ok8PvXsS4GexM/vuv3fF4zxUpTgsWbbhzFC9W7oSdkfu2idwTQFsiJP6CfxP+Q+8Wsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XtVZ56mp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XtVZ56mp"
Received: by smtp.kernel.org (Postfix)
	id 89228C2BC87; Mon, 16 Mar 2026 19:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C38C19421;
	Mon, 16 Mar 2026 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773689160;
	bh=NffH75vvoqCgjcW/XwXuKaxGKjwKAfLZXVPRPTxlGjU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=XtVZ56mpGKPGL8zt9RUz2Hx1icWVkFS3aptrZf/R1E1d036RA0ZALeFuxOpiK7smx
	 s8iECBkFqHz3knaO4c5IBa4kVXyJk5aVhkS/Jnkxd+ujiZ9gcneP0qHIF+np3+y6GM
	 QPwFXDXwVzgEZYr6CilL7OqbWm6WFjZFyfk2ENjQ=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 v2] review: suspend before tracking saves
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260316-followup-tui-bad-v2-1-f4d163415e8a@kernel.org>
References: <20260316-followup-tui-bad-v2-1-f4d163415e8a@kernel.org>
Date: Mon, 16 Mar 2026 15:25:58 -0400
Message-Id: <177368915821.1682813.18391167383301333506@lemur>
X-Mailer: b4 0.15-dev-41293
X-Developer-Signature: v=1; a=openpgp-sha256; l=621;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=NffH75vvoqCgjcW/XwXuKaxGKjwKAfLZXVPRPTxlGjU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDJ3RLp33EywMdeNe57Iqdv1+MiXqzvk9ntVt3D+Exbae
 qHzik53RykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIl07WD4p8E7/en1s+opzyZd
 u3ukyStff97RbR9WV564f6OeddLRhw0M/6yva241/3DuXlvN/Ssuoh6brmpeTFvzd5KwU5X1gaK
 kZk4A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On 2026-03-16 11:16 -0400, Tamir Duberstein wrote:
> Wrap review TUI tracking saves in self.suspend() so interactive git
> signing and pinentry own the terminal cleanly. This avoids sluggish
> input and swallowed keystrokes when follow-up loading triggers a
> tracking save.

I didn't take this directly, because there's actually no reason why we 
need to be constantly signing the tracking commit, especially since in a 
number of places we were completely bypassing the signing. I've 
refactored the code to reuse the method that shouldn't invoke gpgsign 
when managing the tracking commit.

Try that out?

