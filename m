Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB16D18;
	Tue,  5 Oct 2021 13:37:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C04C061373;
	Tue,  5 Oct 2021 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441058;
	bh=jFZ6MgXk2iO1PVd2X/cESWn/IaNpRztjh8FwvP8qXqI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ileg9UYjuvwGxOCcICe9EK0lvvXlQqCapUVJlox0iv5bpqrc6AJgL5JGiU9hrbHLe
	 f7ddgm1mwKuZijMuyaZZqySIuaj/5rwD4UodxGIwIoLHRnwSly9qT+F5FGJk+itEu1
	 euHpN+/BAtowGoA8yW/2BL4rT3wkU8t2KSSjg/JgG8kvadcIg8H/wgnpH6o4tt4F15
	 8Rf9MMijme1P1IsqHypq5a50G09HRSWl8gZX20CHtJu/jmOyAMXpR32vejiK/+KLJr
	 mAKmxgG7j70pCfauJAGb5kkGfL2SWMvpd+IE8J0hc85DIE63rQQMD3GZalDgI2hluJ
	 60sXkPsSHtYow==
Date: Tue, 5 Oct 2021 15:37:35 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh@kernel.org>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <20211005153735.7a50b3c6@coco.lan>
In-Reply-To: <20211005125328.najo7q5f7pwxdrfy@meerkat.local>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
	<CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
	<YVxJhOU239wRw+no@google.com>
	<20211005125328.najo7q5f7pwxdrfy@meerkat.local>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 5 Oct 2021 08:53:28 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:

> On Tue, Oct 05, 2021 at 01:48:04PM +0100, Lee Jones wrote:
> > > > Can you think of a reason why `b4` missed Greg's Ack here?  
> > > 
> > > Because you applied the first v2 patch, not the second v2 threaded to
> > > the 1st one that Greg acked.  
> > 
> > Not sure I understand.
> > 
> > This is the thread of the patch I merged:
> > 
> > https://i.imgur.com/k4hD9kO.png
> > 
> > Greg's Ack is located in the 5th message down.  
> 
> If you look at the thread overview, you'll notice that there are two messages
> with identical subjects, sent 3 weeks apart:
> 
> 2021-09-02 12:47 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
> 
> and
> 
> 2021-09-28  6:58 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
> 
> As far as b4 is treating things internally, the second v2 (from Sep 28)
> starts a new thread, so any trailers sent to the Sep-02 version will not
> apply to the Sep-29 version and vice versa.

The patch is actually identical (and I guess it is also identical
to version 1). I ended forgetting that I had already submitted it during
the merge window. So, I ended forgetting to either increase its version
number or to add a RESEND to it.

Sorry for the mess.


> > WARNING: Identically numbered patches found, will use the latest by date.
> >          Download and edit the mailbox manually for any other outcome.  

> Please!  In general the messages b4 prints when it resolves any
> ambiguity are really helpful.

+1

Thanks,
Mauro
