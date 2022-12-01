Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C89D185C
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 12:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691BAC433D6;
	Thu,  1 Dec 2022 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669896764;
	bh=slCxztsL9hqbb/7kClc8wmcqroVnE8ryX2iC4zbBT0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJv6/yfPTX2Zg6hjBlQ+Lh8AEyO207ZEDPTUJGJKqpO0x5jvP2D8OQPfi7pWjUJ8J
	 uy2j6eTth/qpdj4xMMEZ4gIjVptSI2jJR2C3bOGjVlfo8RB+RqMpsS7Wb4kSpDSRlJ
	 mvw5veKEmkZru3MzQeeAzll04yzFSGQZDxDT+VRg=
Date: Thu, 1 Dec 2022 13:12:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
	stable@kernel.org, tools@linux.kernel.org
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Message-ID: <Y4iaODY6hMVNsfP1@kroah.com>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>

On Thu, Dec 01, 2022 at 11:00:44AM +0100, Noralf Trønnes wrote:
> 
> 
> Den 01.12.2022 06.55, skrev Greg KH:
> > On Wed, Nov 30, 2022 at 08:26:48PM +0100, Noralf Trønnes via B4 Submission Endpoint wrote:
> >> Hi,
> >>
> >> I have started to look at igt for testing and want to use CRC tests. To
> >> implement support for this I need to move away from the simple kms
> >> helper.
> >>
> >> When looking around for examples I came across Thomas' nice shadow
> >> helper and thought, yes this is perfect for drm/gud. So I'll switch to
> >> that before I move away from the simple kms helper.
> >>
> >> The async framebuffer flushing code path now uses a shadow buffer and
> >> doesn't touch the framebuffer when it shouldn't. I have also taken the
> >> opportunity to inline the synchronous flush code path and make this the
> >> default flushing stategy.
> >>
> >> Noralf.
> >>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> >>
> >> ---
> >> Changes in v2:
> >> - Drop patch (Thomas):
> >>   drm/gem: shadow_fb_access: Prepare imported buffers for CPU access
> >> - Use src as variable name for iosys_map (Thomas)
> >> - Prepare imported buffer for CPU access in the driver (Thomas)
> >> - New patch: make sync flushing the default (Thomas)
> >> - Link to v1: https://lore.kernel.org/r/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org
> > 
> > <formletter>
> > 
> > This is not the correct way to submit patches for inclusion in the
> > stable kernel tree.  Please read:
> >     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > for how to do this properly.
> > 
> > </formletter>
> 
> Care to elaborate?
> Is it because stable got the whole patchset and not just the one fix
> patch that cc'ed stable?

That is what triggered this, yes.

> This patchset was sent using the b4 tool and I can't control this
> aspect. Everyone mentioned in the patches gets the whole set.

Fair enough, but watch out, bots will report this as being a problem as
they can't always read through all patches in a series to notice this...

thanks,

greg k-h
