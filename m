Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962B3375D3
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546648; cv=none; b=Noh1eDbdnafX1qUvG/lXh9WiUnz5FIBItWst2ZdD+zdgnVyqhsiGx2ipcp2WjTA50Uc17lYSMUynEYnQsdoa/54bP7UJBJiIvRsf3FeBtr92/jJrQqos/P8+b3HorQ0gCoNqmX3/rhH6FoHlYuBfyJA8LnA5/EhxZlb4IeDapjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546648; c=relaxed/simple;
	bh=sFZo/WQF9Zic3rd5AO+0VKT9QytQrwaRdANKExMkll8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UYodsFkcYzlX/gWuJsRm0Ev9pQNgDQY+mKrp/hGlCysXXZ0vfjf5DJ7cE+ajOque1HV4PBzucOnijlJOE4N++m322jmogGP0Vb01APWvx7Hs7NOGITfKX0mrcMn7DjtdAF7Bmdmr+I7mynT5nFC+ogijgckiLwov4bRHqihvuWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id A0F6D16024E;
	Wed, 15 Oct 2025 16:44:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 152682000E;
	Wed, 15 Oct 2025 16:44:00 +0000 (UTC)
Date: Wed, 15 Oct 2025 12:44:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Linus Torvalds <torvalds@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@linux.kernel.org
Subject: Re: [workflows]Re: In defense of Link (was Re: [b4] initial "b4
 dig" to supplant Link: trailers)
Message-ID: <20251015124408.1cc44dcc@gandalf.local.home>
In-Reply-To: <9a07d307-ede5-404f-aff0-9f28f591e0aa@kernel.org>
References: <20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
	<CANiq72ka1y0YXysRQtuqnzc0i5FSbrGjKwprrXQpozwDOV3khA@mail.gmail.com>
	<aadb0515-4024-40c0-8024-fcdd029a3029@sirena.org.uk>
	<2991ae006906913c10715a9673ac53a4ea557728.camel@HansenPartnership.com>
	<20251015151447.GD3168635@noisy.programming.kicks-ass.net>
	<20251015111816.728bfda7@gandalf.local.home>
	<20251015155346.GA3287345@noisy.programming.kicks-ass.net>
	<20251015115917.5e031880@gandalf.local.home>
	<20251015160622.GB3287345@noisy.programming.kicks-ass.net>
	<9a07d307-ede5-404f-aff0-9f28f591e0aa@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 152682000E
X-Stat-Signature: tawy15sxeqp5r9zenitazkdm9jczgpqo
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX192Ik7lOAUAs5dgZOqExZtVA1aWZt1Ceb0=
X-HE-Tag: 1760546640-314494
X-HE-Meta: U2FsdGVkX19COFcmQlbLgKo6bFlTNo9KEEcqeQtOPD0My3yi2OwFHKKfmqdMrFD+A8VSgsr+B+TCskyVkOQHDu8sd7YBHx3eirgT4lBoReIT7sSrAk1DHCW1IWu5MlRA3vu2TfNtUFSuoF2/GjaeER3oQbnj7SNiyczSviQwGsjPwqT3vXp5kIZ94SyT3Tbts4LwrbMc5bFkHVi211Scr2DU/rWdPUbeHG7dbnnSWpzrNQ8zNgtAnbd4Ir1yJe3tkJOkNb4u083IghifdinKCmMHsWCWGZe0uqL0OAe9+lqqN5nT8fY7zVtpkO3h5bxRADop2KaSH7apVvUXUb+v4BYi4IeVWZ+v

On Wed, 15 Oct 2025 18:15:37 +0200
"Vlastimil Babka (SUSE)" <vbabka@kernel.org> wrote:

> Such personal preferences could be encoded in MAINTAINERS with tooling doing
> the right thing, perhaps.

I was just about to reply saying the same thing!

Yes, could we have a way to denote in MAINTAINERS if a maintainer wants the
entire series or not?

I see people complain about both (like Peter and I are now).

I don't want the entire series and Peter does. If we can denote a way in
maintainers and have get-maintainers have some kind of option to make a way
to send patches, this would be great!

-- Steve
