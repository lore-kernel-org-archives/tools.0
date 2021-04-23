Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BBF2FA6
	for <tools@linux.kernel.org>; Fri, 23 Apr 2021 17:12:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91F78613CD;
	Fri, 23 Apr 2021 17:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619197956;
	bh=8HiRXDxXgksb2yUy1Np0F30r2P7/xU3tUPuFzosQXYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lu8PVLHKqWBfEjIpf4VI9L4nPYzvp0GKW9dqal+HUkBat/L5zI2ZtZrI5xgzIn6VO
	 NZzXSf8cRCIQJ+m6je8K1Wd1rFBo6j4phsW/47GeaxNLHyMEXuSFzTMD/UxeuwLASR
	 qGUZxRTj8yjRKZ2NACVkPoNa5Uo6JFSUWHvOcrKrfwBLNmvI491g2TGVzu2EC/Ox1f
	 Nx/8oXhJOforibtcpG0kvr5wifdk0W0T+E8rL3N2WSZdisEW9sUfhq6fTnD/dy3AW4
	 81MPbZsYw8xQJpePnjO1dX4/gPpBmMc/SYTm0ZoazQlL9qiJp9Sm128lrgVGgJQN3G
	 rih+1ytiUS2Rg==
Date: Fri, 23 Apr 2021 20:12:32 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joe Perches <joe@perches.com>, Rob Herring <robherring2@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, tools@linux.kernel.org,
	Simon Glass <sjg@chromium.org>
Subject: Re: Better tools for sending patches (was: Re: [MAINTAINER SUMMIT]
 Rethinking the acceptance policy for "trivial" patches)
Message-ID: <YIMAAFCe5N7ORNRX@unreal>
References: <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal>
 <20210422092916.556e5e50@gandalf.local.home>
 <CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
 <20210423080454.78f4f662@coco.lan>
 <6c221d801c5a6834168207b5ccadc76ac432c766.camel@perches.com>
 <20210423091320.4f2381b2@coco.lan>
 <CAD=FV=Xi6TL05M2bYKNgNB-ePY40CvonPzJYeMhXMPGgYKA5_Q@mail.gmail.com>
 <20210423160310.GD5507@sirena.org.uk>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210423160310.GD5507@sirena.org.uk>

On Fri, Apr 23, 2021 at 05:03:10PM +0100, Mark Brown wrote:
> On Fri, Apr 23, 2021 at 07:52:30AM -0700, Doug Anderson wrote:
>=20
> > I know it's nearly impossible to get people to change their workflows,
> > but if you're open to it I definitely suggest giving it a try. Simon
> > Glass (the original author) is also quite receptive to improvements.
>=20
> I have something broadly similar (much more simplistic and overall less
> capable) which I wrote myself - the things I have that this doesn't have
> are:
>=20
>  - Attesting the outgoing patches with b4.
>  - Tagging the published series in git.

I have something similar too, which actually wrapper over git format-patch
that properly set target (net-next, rdma-next, iproute2, rdma-core, mlx5-ne=
xt
e.t.c) and changes "To;" based on target.

Thanks
