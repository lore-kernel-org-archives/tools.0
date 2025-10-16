Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73902241686
	for <tools@linux.kernel.org>; Thu, 16 Oct 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600018; cv=none; b=jlJ7WPtUSLY2daLItDtyf39UT3tBCNjln/AGXO04KqhpJWtQckmio57nePJBl/Kkp4mym9zyDVvEnljJKovCp0MDK5QZ0YOz/cWO9QSpuOrEFadtCyZC7HQBY83Vhxgv9CFU2V5049HIP5/X1SD65YqX92ecoXXkcC+XreaTY28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600018; c=relaxed/simple;
	bh=rlBmdukXhuVlw6gYKmglzA1V20fujLDdW1ptgCzu3NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gz3ILrUqy4bq2k19Nzw+JmZ7lBDhqVQtU8hcI7WkkhMQuYZ2/NMOKbNBIKvvFTqk4GlqHCiuBYnSgxE3kYPus5P9vEVuwAmy79m7CPzC8eojrd8cYtpgY/Hk0GFK6U0tC+ign/1QGy1zktpKTbWEFxUFhg9V3VZQidfzwamsgRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XoKSKUw6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XoKSKUw6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g5SR8u/yjyIyspq96N1itvMaxQGqKRDdyk52YsFPNaQ=; b=XoKSKUw6GgmMFdS462jHiEsz7C
	n5Wlje0/NfcuuBDjgYqRiiTbtcNP0kfQLMavtrl/aDLnioAht5aK8ImU3NucpUacVDkcsFKZ+BuLo
	m6/PhSDVz0y5/1Ayy4eI0FEnGrEyF4sR20IxPIvlspMn30NyXOKxvUTHg1twq9ReVfEMHyeqkFeha
	AotGRhoKlYwqHYsHjsOsSssS2O7fjLnWE0HuuF95LqC0HQB0eNKYpXjC+5X+JLX1JpypD5bvVKRxn
	ZhFTlhWzjAqlmul6HmmmxfEye9qmkSQIA+UWoK9ZYCG6+zTQ6amV5aAbnfvTBtRhbS4ErHky4bcy6
	Z/IIVUVw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ITQ-00000006ZJV-4Atw;
	Thu, 16 Oct 2025 07:33:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8BD9E3001D4; Thu, 16 Oct 2025 09:32:32 +0200 (CEST)
Date: Thu, 16 Oct 2025 09:32:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mark Brown <broonie@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4 dig"
 to supplant Link: trailers)
Message-ID: <20251016073232.GF3419281@noisy.programming.kicks-ass.net>
References: <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
 <aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
 <2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
 <20251015151447.GD3168635@noisy.programming.kicks-ass.net>
 <20251015111816.728bfda7@gandalf.local.home>
 <20251015155346.GA3287345@noisy.programming.kicks-ass.net>
 <20251015115917.5e031880@gandalf.local.home>
 <20251015160622.GB3287345@noisy.programming.kicks-ass.net>
 <20251015184043.GB30747@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015184043.GB30747@pendragon.ideasonboard.com>

On Wed, Oct 15, 2025 at 09:40:43PM +0300, Laurent Pinchart wrote:

> I've been similarly annoyed at partial series in the past, but that was
> because I wasn't CC'ed on some important patches, not because I didn't
> receive the whole series.
> 
> When doing tree-wide or subsystem-wide refactoring, it's typical for the
> first patches to rework/improve/extend some APIs, and then for the
> remaining of the series to address drivers one at a time. The cover
> letter should explain the rationale. I've been CC'ed multiple times just
> on a patch that touches a driver I maintain, without being CC'ed on the
> first patches in the series that show what's going on. That's annoying,
> even if I'm CC'ed on the cover letter.

This, very much this. How are you supposed to judge the new API usage if
you've not seen the implementation.

But I've also had more involved cases where people were trying to solve
a 'problem' and me then only seeing a very small part of it and going
WTF. By going back and looking at the whole thing you can maybe suggest
an alternative approach, which isn't at all possible if you've just been
given a very small piece of the puzzle.

> On the other hand, being CC'ed on 50 patches touching lots of drivers
> in very similar way causes lots of noise.
> 
> In such cases I try to adopt a middle ground, CC'ing everybody on the
> cover letter and the core patches, and CC'ing only relevant people to
> the driver patches. Is this something you would find annoying, would you
> prefer always being CC'ed on a full 50+ patch series ?

So I'm in the simple rules and overkill camp. Send me everything, that
way I'm sure you're not forgetting something.

The moment you start to make 'maybe' rules and people need to think
(like the Link thing seems to be now), things become subjective and
blergh.

So yeah, I would be okay with the core patches and the patches touching
'my' subsystems, but the moment we have a different view of what
constitutes that core, or someone fat-fingers it, I'd much rather have
been on everything. Everything is simpler, simple is good.

And I don't mind the 50+ patch series -- provided I can indeed really
ignore most of it. I'm very good at not reading email -- job requirement
for maintainers at this point :-(

