Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9433FCB;
	Thu, 26 Aug 2021 23:04:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id E643F32007CF;
	Thu, 26 Aug 2021 19:04:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 26 Aug 2021 19:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=fm1; bh=Gsp
	eaUnOPeu3+9p0abAKS959f4ON7YGoXSNjbx1FQ/g=; b=pmtfTv7XYTMItC3cjZd
	mRNgQmzn445nWzJL4hlg8RAfKdIh0cHdSj9tcjvixaCtSqrAcZOl9PdFVp1u/HNH
	XnBKETPJtgNgxTbchb6b2fKDWrh/BmMyFy6qsnNTcQtaJe1esGgDa2W5U/Fs3skw
	Z+Z4Ue9DMFqysPGTyzPgm1STnU0FWDR5OJ2dRoIyHnTNTBfcW3xSqBbrGoHjc2tl
	KSe1a32zmwrzMgZDtd+PKbEduosC6Hp5aGNyeF1VPTxWTxaz+PdHK0UzBMDpxAix
	Bi0hTe0TT8c5/AvjByoTlR894QBJ2R+MkaG/ylCkd4wywgMvPgLrLIpyjGHRSmOU
	QOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GspeaU
	nOPeu3+9p0abAKS959f4ON7YGoXSNjbx1FQ/g=; b=s0pUj/9gilzuhf5yh4UbTr
	dZcrkL7DlY5OINq83wVVubKqDEm/e4zDFCXy03Pn1p4UZ3ca+ehtxmJWEDlWp+ua
	5p59Za4ZpJrBi5pQMgzORWplYJn8vkBtPUt8RBK97ZsT+vxNUPhopZR0P+1yNq3O
	FJBu76XIx2lSpJ8RRgRs+p92ZGYNAeosvxO9zQbe0R2SLd9RjeOYnKPB+acJm2EC
	VcJ/VB2j3lrL6OCjp8z77vW/uZWmNdjCEJHnJOWcuoCddSAaJ4HxP1wTiVlrscP0
	cFpKsW+sCf9hcFdNAUryu8OQlZKUVy0VeuuEROY4plSUg/NjwTg6+FojJEp9QGoA
	==
X-ME-Sender: <xms:9h0oYZnXifzkgWJqfZw8yFLYckhyZ3VQCHNGgo5IptVlaK_dOoc9-Q>
    <xme:9h0oYU1eZhWwo9ZA_jw6JPozrCr3erO_eezjWm-lSTbNBeVjOCVWFTKht_OOeWIkG
    t1IqoEaMTwX9TvLx7Y>
X-ME-Received: <xmr:9h0oYfqsq8F3bjykssJq8qHGVhX3rPbcdfMf25nzYlYXbvmLRl0v2IyEzkgFwKMai2T10qYCvFwGiJpYPq7_-iLuFCz4hQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhshhcu
    vfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudevfedtjedvkeffffevvdfhhfegieevtdehhffggeegfffhkedt
    udduieehhfdunecuffhomhgrihhnpehpuhgslhhitgdqihhnsghogidrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhshhesjhho
    shhhthhrihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:9h0oYZmu3Dp95pab3ZfLr-vIyfkken6WPLmN19HgbYfK5KQNHKedKw>
    <xmx:9h0oYX2RIzToIXp2Ma8HZkxuLJJecpLMImlsm11DtZgwv_YHuPT-DA>
    <xmx:9h0oYYvc_S2SGsXV_Wl38eL09m-U1fZ58ODBzgvfmAtEjzGK_DYhEA>
    <xmx:9x0oYVBxzjY4-1Bu0SUDuOyXwoQljg4uUPBZ3TvcMLfeWwnC8zxhdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Aug 2021 19:04:22 -0400 (EDT)
Date: Thu, 26 Aug 2021 16:04:20 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YSgd9OXnT6N6z/cc@localhost>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <CAL_Jsq+zxVw3BaAzF+58KT9jrFWNzUpELevj=SGPJSrdcVFPSw@mail.gmail.com>
 <20210825164459.5pxaxsl5a6nuipbt@nitro.local>
 <YSa4kYDpTAFOf0az@localhost>
 <20210826140427.ulnlkvrpzuat3otm@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826140427.ulnlkvrpzuat3otm@nitro.local>

On Thu, Aug 26, 2021 at 10:04:27AM -0400, Konstantin Ryabitsev wrote:
> On Wed, Aug 25, 2021 at 02:39:29PM -0700, Josh Triplett wrote:
> > On Wed, Aug 25, 2021 at 12:44:59PM -0400, Konstantin Ryabitsev wrote:
> > > Great to hear, thank you for sharing that. I've been running b4 in a loop
> > > against /all/ as well, and so far so good on my end, too. The plan is to
> > > switch over to the new lore on Monday, August 30, but I need to release b4 0.8
> > > first, which is needed to better work with the upstream public-inbox changes.
> > 
> > Would you consider applying the following patch, to improve the mobile layout
> > on x-lore? Without this change, the mail listing pages are much narrower than
> > the device screen, making them hard to read. This *should* make the pages size
> > perfectly to the device.
> 
> I don't want to diverge from upstream, but I'm working with them on this
> issue. My hope is to move the entire basement view (with mirroring and cloning
> instructions) onto a separate page so it doesn't interfere with thread
> rendering:
> 
> https://public-inbox.org/meta/20210826132747.6gxuwnhftyf7c6hp@nitro.local/

Sounds reasonable; a separate page for that footer information seems
like a good idea anyway.
