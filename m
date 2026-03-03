Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72D37DEA9
	for <tools@linux.kernel.org>; Tue,  3 Mar 2026 04:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772512006; cv=none; b=HauccUcCUu5KPdtqHTPxbx+YHQsVByYHmWwnM3T9/8CivcgBMpCcH1cXhkCdxJLHelRPK0bfbs9Cp9wX9Wp/Zkz/znUJd14BpaDOjj6x8E2PN7tO9lEv0RtD2OI7TIQAEQerOzwtvbVMJcbEHFiwELc3ubS3DAIoMM1fJxi3Ins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772512006; c=relaxed/simple;
	bh=tjpzL29MLN6BeEwdRxQ2WduiwBCRnZf65csSCxSj9q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgSghw13PsRDs1LQkoKUk6ytyoqtMUO9hdeb1LJsM3tlI7CmqEPU9/sZ44nFuKJWYHqWcWi0XSnqgJrwLLrn9Bd1U/vQxAaQyAmoeviOuEEYWlGKW5Jw5tms2aSGuv7j0Nlo6+koJtBSfaEXY0YUSnHsFb5msewanJTWhMADwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlRlKlqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlRlKlqt"
Received: by smtp.kernel.org (Postfix)
	id 0DA9CC2BC87; Tue,  3 Mar 2026 04:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4155C116C6;
	Tue,  3 Mar 2026 04:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772512006;
	bh=tjpzL29MLN6BeEwdRxQ2WduiwBCRnZf65csSCxSj9q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HlRlKlqtw3PgET0qjqNqhzflKtx2eaDHU2qlt8fAB8ptWFtTqvMw6PIzsiRQ7NrjA
	 MtZ8NtssO++suv4MTH8bF1jwnYaUl/BMzmfwZchQwokRHkWylS8onUtspuI3ZqYvXq
	 xUtdsdrIHS3WxUNrW5fmsyN4pYwF12yykT7vqju8HKJazEtZK8zmibbeybLyRFPDHV
	 YXe92eieaqy/u6faQmAyQ8fKVGdp7gF47pN1bPE9Yf3So49TSLV+DcaK62Z98IBKHR
	 Cg8Fzwz9x8RrdsgKYo8X1cJAO2z4cviSLnXqQ0ZFBXaPf5j4trOm6Uq+tXPQ/G6ch3
	 YbvPFS7x692zA==
Date: Mon, 2 Mar 2026 23:26:44 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Junio C Hamano <gitster@pobox.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260302-proud-ginger-dragonfly-24edcc@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <xmqqikbdvfla.fsf@gitster.g>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xmqqikbdvfla.fsf@gitster.g>

On Mon, 02 Mar 2026, Junio C Hamano wrote:
> I hate to complain about trivialities, but the coloring scheme was
> too noisy and with weaker color perception than normal folks, I
> couldn't really see many of the UI elements in "b4 review tui".

Junio:

Thanks for giving b4 review a try -- and this is definitely not a triviality.
A lot of it is "rapidly prototyped" with colours that made sense on my
dark-mode terminal using textual's default pallette and I've not tried it with
other colour schemes.

> Is there a monochrome option that is usable by color challenged
> people?

There is now. The review TUI is built on top of Textual, which ships a
built-in 16-colour ANSI theme that defers all colour choices to the terminal
emulator. You can enable it by setting:

    export TEXTUAL_THEME=textual-ansi

With this, the TUI will use your terminal's own palette instead of hardcoded
RGB values, so it should work well with any colour scheme you've configured
for your accessibility needs -- whether that's high-contrast, monochrome, or a
palette tuned for colour vision deficiency.

You'll still find some colours here and there -- please let me know if they
are a distraction and I'll think of better ways to make that work better in
monochrome modes.

You'll need the latest b4 master for this.

Best wishes,
-- 
KR
