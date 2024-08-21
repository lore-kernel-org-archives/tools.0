Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C31607B0
	for <tools@linux.kernel.org>; Wed, 21 Aug 2024 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251981; cv=none; b=sDQLlpSsXhyEiyvvw8my+0pj/ZrHRlpTx4Q95XKRVZG15eaozTY+DFCF9QuQyMruatFjgs58YcAqm5NFoEMmxIA5JbKBfaQnFF+mHt9cXEKIOXJQUaOeJtBn+ASi7EVlV03shNuMopZcmnS/t4W5HD3LD1rFkjEbjMIfI6ekqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251981; c=relaxed/simple;
	bh=udPciWSZ6DN0/Z4fv9BjfnOPYI2zc7oCoHlI5Iihz0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uo0QDzbEqk/tJwLz7gWj29SmE06A9dGApFfQbroU8e2hEWn9fJ3dEXLzvEWi2/sGx2MqJsrQzESXpBH0WcJjJESe7dC8+xNvaBY26W2av4E7Lj/8JhoPPZgjQHx1hK8y7JAT/jq1Mjr1wY5brSSl3mVz0/v1rRoxrQrqXHyUvp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pGgwkg4s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pGgwkg4s"
Received: by smtp.kernel.org (Postfix)
	id 1BCCEC32786; Wed, 21 Aug 2024 14:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5FBC32781;
	Wed, 21 Aug 2024 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724251981;
	bh=udPciWSZ6DN0/Z4fv9BjfnOPYI2zc7oCoHlI5Iihz0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGgwkg4szDnrbr34t7kLAXAj9j4VXhq9FRKKss5bqRFLUyJdjne2H8HTyZzIfnb9q
	 h/riV+bpQWmaKmQHyCazpET4+Ud37W3ytyF3Kjlc8ra1WSqLLQZLSc3/KuKPSPEffv
	 cdkhR2WeDHeKKdCvP0poAPM1ctEkV8QjPDSJfTLU=
Date: Wed, 21 Aug 2024 10:52:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: tools@kernel.org
Subject: Re: Non-deterministic bug applies non-existent tags
Message-ID: <20240821-colossal-amaranth-mule-2f314b@lemur>
References: <CANiq72=y5OjbyDhh_W2FF_v_7mLGDkf3+TbpfYiSGMdWH=_KKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=y5OjbyDhh_W2FF_v_7mLGDkf3+TbpfYiSGMdWH=_KKw@mail.gmail.com>

On Wed, Aug 21, 2024 at 02:58:30PM GMT, Miguel Ojeda wrote:
> Hi Konstantin,
> 
> When I run:
> 
>     git checkout v6.11-rc4 && b4.sh shazam
> https://lore.kernel.org/all/20240819112415.99810-1-benno.lossin@proton.me/
> 
> I got a strange Reviewed-by tag from Gary (who was not involved in the
> thread, but was Cc'd). I went to bisect `b4`, but I noticed it is
> non-deterministic.

This "fantom trailers" bug has been super frustrating, because I can never
reproduce it no matter how hard I try. I've seen reports of this and I know
that this is happening to others, but I'm thus far unable to figure out the
cause or see it happen for myself.

In this particular case, the Reviewed-by tag from Gary Guo is valid, because
it was given for this patch in v2 of the series:

https://lore.kernel.org/all/20240801133055.6d127fd1@eugeo/

We reuse it, since the patch did not change.

> Indeed, if I run it several times, I get:
> 
>   ✓ [PATCH v4 2/2] rust: init: add `write_[pin_]init` functions
>     + Reviewed-by: Boqun Feng <boqun.feng@gmail.com> (✓ DKIM/gmail.com)
>     + Reviewed-by: Alice Ryhl <aliceryhl@google.com> (✓ DKIM/google.com)
>     + Link: https://lore.kernel.org/r/20240819112415.99810-2-benno.lossin@proton.me
>     + Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> And other times:
> 
>   ✓ [PATCH v4 2/2] rust: init: add `write_[pin_]init` functions
>     + Reviewed-by: Boqun Feng <boqun.feng@gmail.com> (✓ DKIM/gmail.com)
>     + Reviewed-by: Alice Ryhl <aliceryhl@google.com> (✓ DKIM/google.com)
>     + Reviewed-by: Gary Guo <gary@garyguo.net> (✓ DKIM/garyguo.net)
>     + Link: https://lore.kernel.org/r/20240819112415.99810-2-benno.lossin@proton.me
>     + Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Naturally, I'm unable to reproduce this. I assume this has something to do
with cache, but if you can still make this happen, could you please rerun b4
with the debug flag and send me the output of the run where the trailer from
Gary Guo is *not* inserted? E.g.:

    b4 -d am [...] 2>/tmp/b4-debug.txt

> In addition, yesterday, I noticed another instance (but this time it
> looks deterministic) with
> https://lore.kernel.org/rust-for-linux/20240814-linked-list-v5-1-f5f5e8075da0@google.com/
> -- in this case, the first patch gets a Reviewed-by from the author
> himself (and it does not come from the cover letter).

I am unable to reproduce this, of course. I get the following:

      ✓ [PATCH v5 1/10] rust: init: add `assert_pinned` macro
      ✓ [PATCH v5 2/10] rust: list: add ListArc
      ✓ [PATCH v5 3/10] rust: list: add tracking for ListArc
      ✓ [PATCH v5 4/10] rust: list: add struct with prev/next pointers
      ✓ [PATCH v5 5/10] rust: list: add macro for implementing ListItem
      ✓ [PATCH v5 6/10] rust: list: add List
      ✓ [PATCH v5 7/10] rust: list: add iterators
      ✓ [PATCH v5 8/10] rust: list: add cursor
      ✓ [PATCH v5 9/10] rust: list: support heterogeneous lists
      ✓ [PATCH v5 10/10] rust: list: add ListArcField

+CC the tools list for visibility and to make this a bug.

-K
