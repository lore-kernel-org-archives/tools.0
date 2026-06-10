Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD95B3168E1
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 01:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056064; cv=none; b=qap75XjRRxEgA3jrsp45Uv3NbH6yGM6B+JzyyBvUDKQuolcqFRXQlGZO8iF+k6ca6OEquOvl/U4+us6j8jawZWT5GZCSVPC3LxjQmsnfI3bB6GzW033oZ8mOWEll5kV/zna8BV6nG3Whkb/43Cf7BUzDvnrfT6GImcHFV9hB4ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056064; c=relaxed/simple;
	bh=VIUKq5pE5pks+3D/ggJeX6ZhViYj158hAaCY80DtVJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSZAjJLN9LzRTCSesPI4GfIhJvg7ASIzY+TvDdmHKqkH+jaQCFwSoE799lBQggxgTPN5eOtQLhlXAsy0vKIVWDxzMqS8VWghc68nPS1caumxV+Ks9JqHP3Yp2DFXvwskNKRZkAMSgExh6JvuOQEQL5QoUwa4mvHWta1jYUuvd6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bC/yu/Em; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bC/yu/Em"
Received: by smtp.kernel.org (Postfix)
	id 2BC061F00898; Wed, 10 Jun 2026 01:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2151F00893;
	Wed, 10 Jun 2026 01:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781056061;
	bh=VIUKq5pE5pks+3D/ggJeX6ZhViYj158hAaCY80DtVJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bC/yu/EmXHRKykbKyC8afZlbad/Fdgx5VXQumb5Cnnk2kNb3PK5L1/1VzlrLxhkQp
	 L7ZeCKTbo7fxMV2x8N0uPw8xKWB7ImFHfErXwAg2nY6B1IzVy8d6ClKw04d/fCjD9E
	 xeKHefKB8nAw6kJRyRyrw4tmoq0dX324PHuxPlWU=
Date: Tue, 9 Jun 2026 21:47:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: tools@kernel.org
Subject: Re: [PATCH b4] review: allow a custom Message-Id command for TUI
 replies
Message-ID: <20260609-terrestrial-military-honeybee-d6ffcc@meerkat>
References: <20260522-review-msgid-cmd-v1-1-facc71f2e084@kernel.org>
 <20260609-loutish-busy-curassow-33ac37@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-loutish-busy-curassow-33ac37@meerkat>

On Tue, Jun 09, 2026 at 09:11:01PM -0400, Konstantin Ryabitsev wrote:
> This patch won't quite cover every possible case -- e.g. it will miss the
> thank-you notes that are still sent with the same code path as "b4 ty". Let
> me think of a more global way to plug this in that won't clash with
> message-id's that are generated for series with "b4 prep/send".

Rather than adding a parallel make_msgid_with_cmd() helper, I folded the
hook directly into make_msgid() behind an allow_custom_msgid_cmd flag,
and flipped that flag on at exactly the reply/notification call sites:
review replies, follow-up replies, and ty notes. When the flag is set
and b4.custom-msgid-cmd is configured, b4 runs the command and uses its
stdout as the Message-Id (angle brackets optional), falling back to the
built-in <...@b4> id when the option is unset, produces no output, or
fails.

I renamed the option to b4.custom-msgid-cmd (dropping the "review-"
prefix) since it now reaches beyond the review TUI.

Try it out and let me know if that's what you were looking for.

Thanks,
-K

