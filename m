Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0B72;
	Wed,  1 Sep 2021 09:28:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 233895C00FE;
	Wed,  1 Sep 2021 05:28:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 01 Sep 2021 05:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:cc:subject:in-reply-to
	:references:message-id:mime-version:content-type
	:content-transfer-encoding; s=fm1; bh=rexxVunTxBHzrkJOEuCD9GU6j6
	aP7F2ovo0j3/McO5g=; b=eVI3Uan/8qIXp5twy+NyYIXBPLwhH01z7zUE+XLi1Q
	8BDgqd5dQecqZE+ZMr7WNWjfCTwghVf7c7jAMga5xqDLj/rcGQGDyLKHSThXLaC0
	IS0aooWU5EHuqXiUEpC321N7IuwavMtTijPqEjO4bP1BprdTKvwlDGyBgjEisEFH
	KMLfYFFEURa/QzuNyqWl5mM/mF7k5VYv4cZHQUp1ntn87fIp24p758shk5/CK5UZ
	uNqL+BiSvF0JfsNblT9Sx2A3EJKLPRCI6kKwFrQbKTFlWkpsYUhobeILU5SrnqOM
	WpYKLv5qjbZqHfCJ++YepjmmccBYnNvuCr3u1D9A+R3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=rexxVunTxBHzrkJOEuCD9GU6j6aP7F2ovo0j3/McO
	5g=; b=JSisUd1Gg4SiWVj17K8R4/1lHQuAtTaKDsfy1C8PaVGnMJTioQceJUNIk
	uAKk88DvqFutUZcOMT+ExLgfv63wY5eCVjJz/kTJUpMoXw7QPVy1iERBFO+ywisD
	+67JllkuR8xOHplLOZgdi9OCmqLgF8dlyu65eQKCKZbRSYxsoshsXIduF0Dns/KJ
	wWu+CtUifRgFVcJOYy/mFMqSzssz2Sqz2IXLkf+r/W6lW5f9OWgIJR0fNB+kl30d
	SnMITSCCzU3OvF0I+JGA13layYfmsJVOxItisAVcP25OSMJej3WabBfC6t6nzAiK
	6vDnaLH+9TUUepS8pjuU56R+a2cUQ==
X-ME-Sender: <xms:zkcvYXMiatpz7aggKqxeFjl07tdptrDfogr_LESja4JbUnBFal-ucQ>
    <xme:zkcvYR8ZHh7yMTYwy22AGcNM0n1RY5DZCEJ7QAhFiFrYv3SuhgjsSrOF8djNYevcw
    dSJn5NUuhxiWYVr1P0>
X-ME-Received: <xmr:zkcvYWTkVt-HYONcWT6nsTPYaBUAZUvlscb_E5a-v8C2xReZbtm9yeaVhzZb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujghfkfggtgfgsehtqhhmtddttdejnecuhfhrohhmpeflohhshhcu
    vfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgedtkeevleeghfetffffgfevkedvffdvueffueffkefggeetgeeg
    fefgueefledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfiefrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhoshhhsehj
    ohhshhhtrhhiphhlvghtthdrohhrgh
X-ME-Proxy: <xmx:zkcvYbuCRLKhQQHDuJdz4cvrknEGlTQL8pu-pH70h8wYD8Lg8gGIxw>
    <xmx:zkcvYfdvR198IxgxyS212dsVOId_0gu0dS5dZbw6VYNNVNKkD-0njw>
    <xmx:zkcvYX0ynarfPTDj9gNiWzEvXglKbmiKyqcIVZQQR_x9X9XdLLgL7A>
    <xmx:z0cvYb6KWHUgb-FsGvhPx84ga8inpCdx8i3kWlmSgzHUInuwiCw4WA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:28:45 -0400 (EDT)
Date: Wed, 01 Sep 2021 02:28:42 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: djwong@djwong.org, "Darrick J. Wong" <djwong+korg@djwong.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
In-Reply-To: <20210901012310.GL4159675@sweaglesw.org>
References: <20210830164626.tq5emfrht4o46x33@nitro.local> <20210901012310.GL4159675@sweaglesw.org>
Message-ID: <57D07DE9-AF48-42B2-8474-817642EFFBB4@joshtriplett.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 31, 2021 6:23:10 PM PDT, "Darrick J=2E Wong" <djwong+korg@djwong=
=2Eorg> wrote:
>On Mon, Aug 30, 2021 at 12:46:26PM -0400, Konstantin Ryabitsev wrote:
>> Hi, all:
>>=20
>> My tests of the new lore=2Ekernel=2Eorg service (currently running on
>> x-lore=2Ekernel=2Eorg) are looking good, so I will be putting that into=
 production
>> on Wednesday, September 1, 2021=2E
>
>Any chance I could persuade you to remove the color changes in the CSS
>stylesheet?  The text colors on the new x-lore appear washed out to me
>due to "color: #333;", which makes it harder to read=2E
>
>I can hack around all that stylistic choice by adding more rules to my
>bespoke browser extension that makes the web readable again for my old
>eyes, but I'd prefer the current lore's stylesheet, which uses the user
>agent's preferences=2E
>
>Something like this, perhaps?

While I entirely agree about the merits of higher contrast, I think the cl=
assic https://www=2Ew3=2Eorg/QA/Tips/color (If You Pick One Color, Pick The=
m All) applies here=2E If we want to respect the user's color preferences, =
we shouldn't set the background color either=2E

It's difficult to both do that and provide color themes though, especially=
 for a static generated site=2E
