Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C61C27;
	Wed, 21 Sep 2022 07:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57C6C433C1;
	Wed, 21 Sep 2022 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663745832;
	bh=TTejY/yhKCqi2/PCQhz85SVkHp9rnlo3x06K6xx/9/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFMEeRmNthPnNKeYKiSQWfhbTshhy8jmS8RsEd75MYO3uqYSSZN6eS8a+TSj1E/xB
	 FrXSTkF6TKFmxSUD9HlxPFBRGZE3Ov8/Sqa/1PFyTpwEl3+5csdja0Dq5LRSHj1+QE
	 z1heBJU8RhAY6yjUcXNdkbUlYgZcSlWHnSANPkDtbjXpThA2d/YdiA50yPL4iwE1fB
	 pos8zEyuoGlo+mK20OU3rrL4Y/p3lrU3jRaV6jvFcNQA47qj4DemGgpA26/yo8kQmh
	 uZcUVL+89qxkZN0es8DyzZjEiHfOrGxNVDQEcbF9fscmrUBE832W4BO5/s0QxMA6uW
	 HqU+GV5Te5wOA==
Date: Wed, 21 Sep 2022 10:37:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 v0.10.0 is available
Message-ID: <Yyq/I5xI+cC/ekix@unreal>
References: <20220916181319.okfskienqh6kfeor@meerkat.local>
 <YymDlmJG8fNhvHSY@unreal>
 <20220920144855.bxe4qtmibbu472rh@meerkat.local>
 <Yynz6A51ULumuBVJ@unreal>
 <20220920181538.3pswzay3ewbpu6z5@meerkat.local>
 <YyoHdo7wjKzz6UXb@unreal>
 <20220920185938.i5mq7m743wdcw5tr@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920185938.i5mq7m743wdcw5tr@meerkat.local>

On Tue, Sep 20, 2022 at 02:59:38PM -0400, Konstantin Ryabitsev wrote:
> On Tue, Sep 20, 2022 at 09:33:26PM +0300, Leon Romanovsky wrote:
> > So only patchworks, that is not updated, left :)
> > 
> >    52 [b4]
> >    53         pw-url = https://patchwork.kernel.org/
> >    54         pw-project = linux-rdma
> >    55         pw-key = my_secret_key
> 
> The docs were lying, you need three more entries. Here's how it should look
> like:
> 
>     [b4]
>       pw-url = https://patchwork.kernel.org/
>       pw-project = linux-rdma
>       pw-key = my_secret_key
>       pw-review-state = under-review
>       pw-accept-state = accepted
>       pw-discard-state = deferred
> 
> The docs shouldn't lie any more with the latest commit.

Thanks, it worked.

> 
> -K
> 
