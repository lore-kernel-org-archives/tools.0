Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4FF7F
	for <tools@linux.kernel.org>; Mon, 17 Oct 2022 21:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3B2C433D6;
	Mon, 17 Oct 2022 21:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666041736;
	bh=JxVQvVqPkVzgnU96SB+1/zNTlRhJWUjc5JJK8I8FUqU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YaVRjgvSxFiKaZH4vcJY2hKk7I0MMzum/u8sQ1hBF4GB8zAd2TMLqV+I7JLQAThXA
	 DHXSCeJaLPxl0EdAqNPFIwW/RLgt3IiJveCz2H1MfrjO7kOuEX6XiZoF+uf57fTSLF
	 GVodxdg6H1TbiFz7TlicisWo2u76AxrNH+fNMx3PCsC+JWs6XWcH0LcLo5ieesKXHY
	 zij38F1SSDWEqsETmcNRielNgYocPqutKbMmDvJYuI8NAF8WedgiwzuDCf6wP7gtvp
	 LUfUWW/AcAduGbgM2x5fWaQQDqpCIR1YaFH4ZRS/W2bCNfuqucVlJtVdT+bLgqBhm9
	 PeKIDoss4xppQ==
Date: Mon, 17 Oct 2022 16:22:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: "b4 ty -d all" crash
Message-ID: <20221017212215.GA3735451@bhelgaas>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017202214.dyt7lokid4shpqsv@nitro.local>

On Mon, Oct 17, 2022 at 04:22:14PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Oct 17, 2022 at 12:23:23PM -0500, Bjorn Helgaas wrote:
> > I've used "b4 am" for a long time, but I'm a first-time and naive
> > "b4 ty" user:
> > 
> >   12:17:52 ~/linux (for-linus)$ b4 ty -d all
> >   Discarding 707 messages
> 
> Oh my.
> 
> >     Discarded: [PATCH 0/5] Handled return value of platform_get_irq correctly
> >   Traceback (most recent call last):
> >     File "/home/bjorn/.local/bin/b4", line 8, in <module>
> >       sys.exit(cmd())
> >     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 341, in cmd
> >       cmdargs.func(cmdargs)
> >     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 106, in cmd_ty
> >       b4.ty.main(cmdargs)
> >     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ty.py", line 678, in main
> >       discard_selected(cmdargs)
> >     File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ty.py", line 578, in discard_selected
> >       msgids.append(pdata[2])
> >   IndexError: list index out of range
> 
> I think it's most likely due to tracking file format changes between when this
> feature was first introduced and subsequent changes, especially considering
> that your first tracked series are from:
> 
> > 	 Date: Mon, 4 May 2020 07:18:10 +0200
> 
> I suggest you just delete them manually by going into ~/.local/share/b4 and
> deleting all *.am files.

Solved, thanks! :)

Bjorn
