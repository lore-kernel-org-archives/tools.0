Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842C2FB982
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541495; cv=none; b=OdQioXyHDxRSH7WbxHt5gZADmvHtjAB/R0u7vo0e7QBypWT45ye+EsEUgVIJ6rCbfv+gNS71w07U47TCs8Sv8Hw7q5020CjJ/mAUhmO+yMfp5cdF29USMF8ulvi8E937VzZQcQ7OT3B7nj5ZANTCxHIfvLpf/wJZqENdXN8jnQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541495; c=relaxed/simple;
	bh=vmVlBylGTgeAJVZ4uKctb+RVEI+3gZCqE7aNiLwbH08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnjMzXXHSz++scJOeCUHr7z8UFm7ojz5g+1PEoeNL2qiiqDIl87QnBBmg7AhWjey0ItLdhJyZLR2oOfJMCsCoxL03YpWD60DYVT4CxxYnEaX1e8wzQKAeeGuA8vGtYucHdDjlwuDDB6/jrw+u+G9jdEmktT3iktUpBi7vBmM2EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 8585F1DD680;
	Wed, 15 Oct 2025 15:18:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 317162002C;
	Wed, 15 Oct 2025 15:18:08 +0000 (UTC)
Date: Wed, 15 Oct 2025 11:18:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown
 <broonie@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds
 <torvalds@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251015111816.728bfda7@gandalf.local.home>
In-Reply-To: <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
	<aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
	<2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
	<20251015151447.GD3168635@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 317162002C
X-Stat-Signature: 3bey5pdij37grax3itn5opi1ptiz4c4y
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/sSp1J+/7fI7oO+skp1jaeBKxbdisrSeQ=
X-HE-Tag: 1760541488-656516
X-HE-Meta: U2FsdGVkX1/wZl6c7ehybdkNAYt+uW9V7BtuW7f7u1lYCp8zbJ63IISAQVDucJ8U9mqzp2To2My6pBIJBSyU/FyF0AMBz3sxi32uKEFi2aOZdUYfzhq2eOhNuspcgzo0QoekHAJV0OrtczaOzgaoWJ4pP77NF7Y3jYV1TU6WMLfQMCRKmo9Yvpl2VgD6KpMKn8wFnNtx58LNFJZXXniSW9OrVOKWmEB7i6BeDd93aTPwsSFqNd8ITfBllFgqKg6fLZ3Yi0gj17SWOzT2sbqZPwOmFD6YogUeAjgsjNgGNcK3MPDPD2NrWilNNC2V7B8tGlEJPtzS1ZEqzD3S3d2NZWig9y9RZKleiPc0U8UJyTZ3GYBmLdxt/fL+Ffue+WBL

On Wed, 15 Oct 2025 17:14:47 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Oct 15, 2025 at 09:50:48AM -0400, James Bottomley wrote:
> 
> > Absolutely.  But part of the problem is people who Cc different parts
> > of their patch set to different people don't want to use the --cc
> > global of git-send-email,  
> 
> I so wish people would stop doing that. There is nothing more annoying
> than getting a partial series.

I disagree. I much rather get a partial series where I'm only Cc'd on the
patches that I need to look at. If I get Cc'd on 20 patches where there's
one or two patches that affects my code, I will most likely ignore the entire
thing.

We have lore and b4 today. If you want to see the entire series, simply use
that.

-- Steve

