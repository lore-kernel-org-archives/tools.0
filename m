Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7748ACC;
	Tue, 15 Nov 2022 20:43:14 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 62A10240008;
	Tue, 15 Nov 2022 20:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668544986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5Vmt4QAczJ9Dte4RG8nDb1IzzGHMYJ91kRw/ZSD6Vg=;
	b=Sw62OnpCCOKvF2pKKFAKfoZfg95A24FBw6tcNsqGlqY23fiA/w4JFxTPW1VSGAIwqI6t/w
	ftR3GvAQGZntGQf35lfCbMnJinkO3g7knyHIRpviGTXrvXz0UHK5Iw0ffxDpDVGaRX+ctK
	Xg1mopuAn4jcnJmJ0LD0WNCcbszvftfXtMbBitV50GQIhHDskMpP0NNQMoj8pcXq0IcUYv
	B1+FhWx7YX94p2zY7WgMyhD7GyQLebmY5ydkVgpfHkd9RIHox4QXD5lRUM37RV+yQyjRnS
	/HDwcsVC1k7iTHMHZTmYs85FMEIPXI9ZwDtqZx2a5YjS2GaCsbKa9MiXzXEcmA==
Date: Tue, 15 Nov 2022 21:43:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4 patch subject issue
Message-ID: <Y3P52v3nTTa+YoQU@mail.local>
References: <Y3Pz9Y9Mn1FtnqR1@mail.local>
 <20221115202851.swjefy4auefrubrj@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221115202851.swjefy4auefrubrj@nitro.local>

On 15/11/2022 15:28:51-0500, Konstantin Ryabitsev wrote:
> On Tue, Nov 15, 2022 at 09:17:57PM +0100, Alexandre Belloni wrote:
> > Hello Konstantin,
> > 
> > I found a small issue in how b4 handles path subjects:
> > 
> > linux$ b4 shazam -tsl 5640233.DvuYhMxLoT@kreacher
> 
> ...
> 
> >   [PATCH v2 3/5] rtc: rtc-cmos: Eliminate forward declarations of some functions
> >     + Reviewed-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
> >     + Tested-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
> >     + Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (✓ DKIM/intel.com)
> >     + Link: https://lore.kernel.org/r/13157911.uLZWGnKmhe@kreacher
> >     + Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> If you look at that message (via the link above), you'll see that it has an
> in-body "Subject:" line:
> 
> 	From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 	Subject: [PATCH] rtc: rtc-cmos: 
> 
> I have no idea how it ended up there (you'd have to ask Rafael), but git will
> always use the in-body "Subject:" header when it sees it.
> 

Ah, yes! Thanks for the fast reply!


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
