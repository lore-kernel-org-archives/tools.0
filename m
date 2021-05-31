Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF71E173
	for <tools@linux.kernel.org>; Mon, 31 May 2021 13:47:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id ED78917B9;
	Mon, 31 May 2021 09:46:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 31 May 2021 09:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=fm1; bh=
	oGU8ZiFNj5pvlEyHmQBkXYr3f3NRWIrqZntIvq12diw=; b=kb/Z1Q/+xXvciu0V
	iWhXDDH9KQsBjN1jpK3DebrudaFqvi19mj/138iMVggaq03JexNs3dJxvn4aLIOm
	MJUlIPa6GliAE/327MSUcAi7BY6Tp08EvZbkJU8Zax4sYkzihUN+HxzlaTZDBOxc
	YMx1uABH7BihLnD20pkPhXz76U88oesOCmQNwF7XzUQon9X/vcr7iGnCnXU50kfb
	aZSRee/F1CaYXJSb/dNlhsGS/2SP5KXXuHaQJaCZsOpiKm3zFLENUmebDcDfapsX
	fNX/gBwrU6GC2KzPvcZYwQ+M4/KhKFZv/vz2g7EHruyY2FgJrndLzUZw8hVWCiJ8
	URjpTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=oGU8ZiFNj5pvlEyHmQBkXYr3f3NRWIrqZntIvq12d
	iw=; b=IiPsWeXFCaR14qpab0YHl38Bcpz4xy2JHMxbFA2/tDurbz/Culwtuhlx5
	pgEMoIxGztfPbveMA+V1549ylOnZTmRuxftREaIk5FaEvxWJfF3kkOx1eTN3hSiv
	GAWy0FEfIGlBqVmIVAtloZO0hWZmSOUi3nHoO5XU7aLcJ8WDhIEGfV7xpnQPuybQ
	LYQaKmIRFw9a7Xe7IqnWgREGWcCRUexVg2I+y1SMC19WoY++rKhcpYT16ESEKDWy
	tRLZDoBDwMG6ZRNjj6oXYSbKnQTKpdGJS+4XYNjYwHPYA9i99UNl9+MFo9RY26NV
	fhwIOZiFW2N0g6nkx/ck/ZQ5Ju+Dw==
X-ME-Sender: <xms:0-i0YHKFgdRWmrm4y1UTCkNJJYt_1onhk2rh2NB9rs8HhXQn7w3PEw>
    <xme:0-i0YLJZGALI3M_BHUDe-TZ7sA5qmJ0cL1TwD8jYShRoX8yN2gMqwEd1og0d1bHBk
    ARj9_BvwT5z3YZUuog>
X-ME-Received: <xmr:0-i0YPt0bMjAFLIZAbjQ7IgnFX5zYiznn-9VoZnYYtJu3FNfNH0JG6yH5JNIJa0DcSvHvAZI20TsqvJGT7kyQgjrEARGGI0lbelSpDQxW5wYvdIk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelfedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomheprfgruhhl
    uceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnhepgffhhedtveffveffheehudfhtdevkeehffffgfekveeigeehgfejveegheegtedv
    necuffhomhgrihhnpehpsggrrhhkvghrrdguvghvnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:0-i0YAa9jo0_8I5-AYi5uWrtlgqeJnNuCPfbTa2UL94FkogfJfhQMQ>
    <xmx:0-i0YOajZTV9oOYzgLwzApUAd6ZjaLS2yHl_hOeboj_2NRaHaW-Ltw>
    <xmx:0-i0YEAJdhp_mzLMJsCqICyWDQBtf7rwYrfDbPshT3s1SAgZ_af65g>
    <xmx:0-i0YBwjAg5s4xUQ9r2IzlLPLZb8SqY2ZkbgO6hfFiVDvXG4fxI-KQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 May 2021 09:46:58 -0400 (EDT)
Date: Mon, 31 May 2021 14:46:56 +0100
From: Paul Barker <paul@pbarker.dev>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Konstantin Ryabitsev
 <konstantin.ryabitsev@linux.dev>
Subject: Re: [patatt][PATCH] Handle MIME encoded-word & other header
 manglings
Message-ID: <20210531144656.0000413d@pbarker.dev>
In-Reply-To: <20210531130459.w4tqleti5i5cgkme@nitro.local>
References: <20210530162625.31243-1-paul@pbarker.dev>
	<20210531130459.w4tqleti5i5cgkme@nitro.local>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-w64-mingw32)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 May 2021 09:04:59 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Sun, May 30, 2021 at 05:26:25PM +0100, Paul Barker wrote:
> > When testing patatt with patches sent to a sr.ht hosted mailing
> > list, it was found that long header lines (such as the
> > X-Developer-Signature line) were re-encoded using the MIME
> > encoded-word syntax (RFC 2047) when an mbox archive is generated,
> > causing patatt to choke on the resulting text which looks like this:
> > 
> >     X-Developer-Signature: v=1; a=openpgp-sha256; l=672;
> > h=from:subject; bh=C40yOKgIfnNIUP+OW9WyPdBfljkZPpfUL1NepOODlx8=;
> > =?utf-8?q?b=3DowGbwMvMwCF2?=
> > =?utf-8?q?w7xIXuiX9CvG02pJDAmb67lTNi0+IeF97TL76vtKD7xjSjaluz0o/KfmZLX8rMi7_?=
> > =?utf-8?q?l3M6O0pZGMQ4GGTFFFl2z951+fqDJVt7b0gHw8xhZQIZwsDFKQATydFhZJi+fFfvJ?=
> > =?utf-8?q?8+0MF7GrfzWnP?=
> > K7mAM/3n/r/UC+bprf6/g114QYGdbHcsaK7b1nanfA4IeZi1V0lL26cruXUWxgSEnNDP1FrAA=
> >  
> 
> Bah. I understand that we must handle this situation, but this is an
> annoying and unncessary hack when WSP characters are already
> conveniently present in the header.
> 
> > Avoiding this issue by neatly wrapping the X-Developer-Signature
> > header before sending doesn't appear to be possible without making
> > invasive changes to git-send-email and/or the Net::SMTP perl
> > module. The header content generated by patatt is wrapped at 78
> > characters as can be seen here from a locally signed patch file:
> > 
> >     X-Developer-Signature: v=1; a=openpgp-sha256; l=672;
> > h=from:subject; bh=C40yOKgIfnNIUP+OW9WyPdBfljkZPpfUL1NepOODlx8=;
> >     b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmbN1xO2bT4hIT3tcvsq+8rPfCOKdmU7vag8J+ak9XysyLv
> >     Xs7p7ChlYRDjYJAVU2TZPXvX5esPlmztvSEdDDOHlQlkCAMXpwBMpG0Dw/9Kpzgpc8UsQwOPK/taW6
> >     dFnZyy5QlXPfNCC4WTc76ft9ZnZJjI37a17fP7sxvclKJ1tm36EhITcK62Pphje9KrmOxMJg4A
> > 
> > Running `git send-email --smtp-debug=1 0001.patch` shows that this
> > is joined into a single long line before the message is sent:
> >   
> >     Net::SMTP::_SSL=GLOB(0x5646fbdc3ac8)>>> X-Developer-Signature:
> > v=1; a=openpgp-sha256; l=672; h=from:subject;
> > bh=C40yOKgIfnNIUP+OW9WyPdBfljkZPpfUL1NepOODlx8=;
> > b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmb571P2bT4hIT3tcvsq+8rPfCOKdmU7vag8J+ak9XysyLv
> > Xs7p7ChlYRDjYJAVU2TZPXvX5esPlmztvSEdDDOHlQlkCAMXpwBM5JA3I8O5hP6Tqm7lJst0rldcux
> > 1V7M4q8T5o1fPU6Zs+hxj+SjvN8D/DK3rn8b0m34/Xy388Yeu8jvFdJf/c6Y6LDU7Hulj01nAAAA==
> >  
> 
> This, too, bugs me to no end. :) I've actually considered making
> --hook not perform any wrapping, but I'm hoping that git-send-email
> can be fixed to not do this. To be compliant with (admittedly old and
> obsoleted) email RFCs, headers must be no longer than 78 characters,
> so I'm pretty sure what git-send-email does is an unintentional
> side-effect.
> 
> > So we need to accept that the X-Developer-Signature line may be
> > quite long and so may be re-encoded by a mail server or archiver.  
> 
> Agreed, thanks for finding this.
> 
> >      @staticmethod
> >      def _dkim_canonicalize_header(hval: bytes) -> bytes:  
> 
> I think it would make sense to wrap this around in:
> 
> if hval.find(b'?q?') >= 0:
> 
> This will save unnecessary decoding/encoding/header parsing. Do you
> agree?
> 

Agreed.

> > +        # The decode_header() function we're about to call
> > requires a str
> > +        # argument. Since RFC2822 (sec 2.2), header fields must be
> > ASCII
> > +        # characters so this is easy to achieve.
> > +        hval = hval.decode('ascii')  
> 
> I think we'll want to pass errors='ignore' here just to avoid a
> backtrace for obviously wrong header values.

Agreed.

I'll send a v2.

Thanks,

-- 
Paul Barker
https://pbarker.dev/
