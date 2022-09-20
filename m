Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BBB7C;
	Tue, 20 Sep 2022 18:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8320EC433D7;
	Tue, 20 Sep 2022 18:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663698811;
	bh=581moto/y7K94GK8ggTu8hdKhvFj2795nqucKrog5nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPReLLRpjMU9E89JxVAWCjm4WL4aYDgsHJy6TnsuyiCvoKvt9U9NB2N9vwlUIcza6
	 XAZzziiGWrzkbKKrQmXgJd36rQZoyoUhW2TwUBFKiQFkDjADeRxYFECrdn0lDZoKFx
	 Le1NFEc4tMrqvf6E5BR9CHflPv6mzkxHRGqmj8LFOEya2kTE1nC9GwWKOSOykv+pHD
	 u8cbTSXpuTqXZYvi3lApIe2FrriX2p6xz/LFWmgxJxkOSo/Lo+Axvy9mY9c7bDWi3l
	 n518IT/VuX5RFIbJZY+Phy2InnvxQfVUWyre3b3wKPk2b067BNlKz6gCnYAhnETpp8
	 V6Q5ze3/FMIfw==
Date: Tue, 20 Sep 2022 21:33:26 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 v0.10.0 is available
Message-ID: <YyoHdo7wjKzz6UXb@unreal>
References: <20220916181319.okfskienqh6kfeor@meerkat.local>
 <YymDlmJG8fNhvHSY@unreal>
 <20220920144855.bxe4qtmibbu472rh@meerkat.local>
 <Yynz6A51ULumuBVJ@unreal>
 <20220920181538.3pswzay3ewbpu6z5@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920181538.3pswzay3ewbpu6z5@meerkat.local>

On Tue, Sep 20, 2022 at 02:15:38PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 20, 2022 at 08:10:00PM +0300, Leon Romanovsky wrote:
> > Thanks, it fixed the splat, but I still can't send emails with ty.
> 
> Oh, I see how it is -- it actually expects recipients to be on cmdline, not
> just in the message headers. I think I have it now, please try master again.

Thanks, it sends now.

So only patchworks, that is not updated, left :)

   52 [b4]
   53         pw-url = https://patchwork.kernel.org/
   54         pw-project = linux-rdma
   55         pw-key = my_secret_key

> 
> > BTW, git send-email ... works well.
> 
> Well, git-send-email is a 2000-line perl script with lots of really
> questionable decisions (like supporting paths for an option called
> "smtpServer"). So, full bug-for-bug compatibility is hard to achieve. :)
> Thank you for being patient.

Thank you for all your work.

> 
> -K
> 
