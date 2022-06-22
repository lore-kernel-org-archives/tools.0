Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740D10FF;
	Wed, 22 Jun 2022 05:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A331C34114;
	Wed, 22 Jun 2022 05:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655876966;
	bh=CzZEy/iCz583JsrO027TkpWt2+b3F0FdFdh7RYtZHYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHopApVdtiPEnxfxu+j3eR7fp/Ehfqegwd/pusXaco8oEC3tNfFyEX2XAZ171IxbK
	 FoVNxhlKjkAIm0C//r67yVwRl+E7yTZq2iR1sEtZlmC7H3hL1UUlr3TMo5LMxrfJiS
	 GtnRu7a8sqNmhU1vnyfPbykAgCk3ljRycPVXKfI4zPowO3Var/N82+axzjmRxCoGFx
	 2/dr/YLOdHoTcJ4mej3W4lmzVWwJ/z+yRZ8NafFrxLcOSz/GUF54YIt5qyoazydiB9
	 3dtxdVHKMc6b06rC5okJHTDEvEp59mf4Qsi4vCiMfQng8FGKOHYKSxhW1MSK8fMpTi
	 g/fznkg7DjQMw==
Date: Wed, 22 Jun 2022 11:19:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrKtYjk3LQtmuVsd@matsya>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV54SN7ghTTUnba+3p_9M2NkcXQ6R8KzQXEsWfPWXD6mg@mail.gmail.com>
 <CACRpkdYsMPNDyS5i73AEyWyVcCOQh6tga-1fqFTStamCp8JTeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYsMPNDyS5i73AEyWyVcCOQh6tga-1fqFTStamCp8JTeA@mail.gmail.com>

On 22-06-22, 01:38, Linus Walleij wrote:
> On Mon, Jun 20, 2022 at 10:41 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> 
> > So if I want to run checkpatch, I have to keep on using "b4 am"
> > and "git am" separately, right?  I never apply patches without running
> > checkpatch first[1].
> > Perhaps "b4 shazam" could gain some --checker option to support this?
> 
> This is what the DRM "dim" tool does as well, it runs checkpatch
> and then tries to apply the patch regardless, but outputs any
> complaints from checkpatch to the console.
> 
> This would be really helpful if b4 was run inside a kernel
> directory (i.e. it can find scripts/checkpatch.pl).

checkpatch should be run, that helps. Along with that I have a script
to check Fixes tag, so either that should be added or we add an option
for us to run our script...

-- 
~Vinod
