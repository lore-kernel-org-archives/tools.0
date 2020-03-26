Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [66.63.167.143])
 by mx.groups.io with SMTP id smtpd.web11.41397.1585240061312416965
 for <tools@linux.kernel.org>;
 Thu, 26 Mar 2020 09:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hansenpartnership.com header.s=20151216 header.b=AMzZDA2t;
 spf=pass (domain: hansenpartnership.com, ip: 66.63.167.143, mailfrom: james.bottomley@hansenpartnership.com)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 4CA518EE178;
	Thu, 26 Mar 2020 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1585240060;
	bh=455o1IoyYUlBi/2f/6oiT9lhaokPF10n/N0Cp4z9vXs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AMzZDA2tLqEHxRcS68MudaIgmwunniCBvEVWwduUnmASqF/mJlqF7Aq5M6lAS93Pd
	 nEc9j9RIDLLvIBPlFApeNJ/xgU/yiDgNnGeFC8jt2NeFrKZZQ2v506HVecueYTeDul
	 MA7TTa6/8cPCwNFcwXXd8gLKsMsU0H/IhHqzCsCc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoLfuuGgDmqw; Thu, 26 Mar 2020 09:27:40 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DA3D08EE15F;
	Thu, 26 Mar 2020 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1585240060;
	bh=455o1IoyYUlBi/2f/6oiT9lhaokPF10n/N0Cp4z9vXs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AMzZDA2tLqEHxRcS68MudaIgmwunniCBvEVWwduUnmASqF/mJlqF7Aq5M6lAS93Pd
	 nEc9j9RIDLLvIBPlFApeNJ/xgU/yiDgNnGeFC8jt2NeFrKZZQ2v506HVecueYTeDul
	 MA7TTa6/8cPCwNFcwXXd8gLKsMsU0H/IhHqzCsCc=
Message-ID: <1585240058.3610.19.camel@HansenPartnership.com>
Subject: Re: [kernel.org users] b4 v0.3.4 released
From: "James Bottomley" <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Rob Herring
	 <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Date: Thu, 26 Mar 2020 09:27:38 -0700
In-Reply-To: <20200326161622.pzma44m6vte2qi33@chatter.i7.local>
References: <20200323222041.uzfcexg2wy74jqdd@chatter.i7.local>
	 <CAL_JsqLJkDx3HQEN-0ih0Jp4i2h7xKYrsfqAiYcW_hV-9GtLKA@mail.gmail.com>
	 <CAL_JsqKBskO3oyEP0g9nTyWL4V614w21Hwigs5YpFpgLnUVktg@mail.gmail.com>
	 <20200326161622.pzma44m6vte2qi33@chatter.i7.local>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-26 at 12:16 -0400, Konstantin Ryabitsev wrote:
> On Thu, Mar 26, 2020 at 10:11:44AM -0600, Rob Herring wrote:
> > > I'm seeing corruption of the subject on patches[1] with a comma
> > > in the subject (and I'd guess only ones longer than 70 something
> > > chars). It's fine on lore web interface, but it gets wrapped in
> > > the downloaded mbox. A log is attached. When it gets applied, a
> > > space is inserted after the comma:
> > > 
> > > dt-bindings: iio/accel: Drop duplicate adi, adxl345/6 from
> > > trivial-devices.yaml
> > 
> > Nevermind. It's not b4, but the dri-devel list that is corrupting
> > the subject.
> > 
> > https://lore.kernel.org/dri-devel/20200325220542.19189-2-robh@kerne
> > l.org/
> > https://lore.kernel.org/linux-devicetree/20200325220542.19189-2-rob
> > h@kernel.org/
> 
> I think it's actually Python's fault. I'm trying to isolate the 
> operation that causes it. It makes sense that dri-devel also
> exhibits it, because it's a mailman-managed list.

It smells like a mishandling of RFC2822 header folding rules.

https://tools.ietf.org/html/rfc2822#section-2.2.3

Lots of email tools get this wrong as well, so they add an extra space
where the subject header got split by the wrapping because they expect
the header to split at a space and the space to be eaten by the split,
but that's not what the rules say.

James

