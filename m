Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B3188A1E
	for <tools@linux.kernel.org>; Fri, 23 Aug 2024 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724435668; cv=none; b=eyAUE54WC/LG+98fM7PcsiQEEGoGerZLwCh8lcVJzDi/yGcB0IQ9xRtyY/yOXiWIgqyolauC8M+piBMkP+1N2WA6uQeEfNXlOLF8Sj4V1Rkv1Q+1Mf/AhSxlDOBLvZ6b9mqQuKpu5CG8TFyyZop3dEXpUZfIZd2AMYoUM/Bl4kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724435668; c=relaxed/simple;
	bh=JnYcAffEPdQSdkwzR1RizvKgwy2k6269HIUgWmiCnLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTK++mXtiLg+I4CHzGIkOVvfjY7CuqiJbm921lkv/LBKF+JEbhDgnftyyYYTNrXHw6m1gmVrRtsf3hMmOHn/u4/wXtHZHYbrjhLwDhXgsgYrOGEI3+1m3VI/pOMkTI72K2BDuiHbpelqaiFd9wBN8v2sl+JXzNoIeX9Yxeps9pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QYs2it2P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QYs2it2P"
Received: by smtp.kernel.org (Postfix)
	id 48F62C4AF0C; Fri, 23 Aug 2024 17:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129C9C32786;
	Fri, 23 Aug 2024 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724435668;
	bh=JnYcAffEPdQSdkwzR1RizvKgwy2k6269HIUgWmiCnLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYs2it2Pz1N+vMKEslXYB0NRgn12mMVUADhG83TIHc/FOZ1ByTEyOFXJZ+5S22Jof
	 iSz5/US5fNSZNQHMQ/e4HL6muWyLr+xp4Yt7AW3PDFusf8B3Xf7K1cm5SCrA5duHJc
	 ettfdhEOJqF/7s+hsvEfOxopkOaiSORJs0SuHhLI=
Date: Fri, 23 Aug 2024 13:54:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: tools@kernel.org
Subject: Re: Non-deterministic bug applies non-existent tags
Message-ID: <20240823-benign-encouraging-falcon-282cf6@lemur>
References: <CANiq72=y5OjbyDhh_W2FF_v_7mLGDkf3+TbpfYiSGMdWH=_KKw@mail.gmail.com>
 <20240821-colossal-amaranth-mule-2f314b@lemur>
 <CANiq72n73A0aUbrSHjtb+TB7+emEgjCezeUg3F=PJquyCtNg3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n73A0aUbrSHjtb+TB7+emEgjCezeUg3F=PJquyCtNg3g@mail.gmail.com>

On Wed, Aug 21, 2024 at 05:51:24PM GMT, Miguel Ojeda wrote:
> Hmm... I am not sure that is expected, though. I guess it wouldn't
> hurt to at least say from which version the Reviewed-by came from, if
> it was not the given one (and ideally add the link to it). Something
> like:
> 
>   ✓ [PATCH v4 2/2] rust: init: add `write_[pin_]init` functions
>     + Reviewed-by: Boqun Feng <boqun.feng@gmail.com> (✓ DKIM/gmail.com)
>     + Reviewed-by: Alice Ryhl <aliceryhl@google.com> (✓ DKIM/google.com)
>     + Reviewed-by: Gary Guo <gary@garyguo.net> (✓ DKIM/garyguo.net)
>       ! Note: Tag added from v2 (identical patch) at https://...
>     + Link: https://lore.kernel.org/r/20240819112415.99810-2-benno.lossin@proton.me
>     + Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

We already do something similar for "b4 trailers", so I'll look into making
that show up for "b4 am/shazam" usage.

> I can! It switches from putting the tag or not quite often, e.g. it
> could be ~50% of the time.

Would you be able to try it with the latest master? I think I've tracked down
the cause of non-determinism.

-K
