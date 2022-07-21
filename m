Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3289441A
	for <tools@linux.kernel.org>; Thu, 21 Jul 2022 13:08:25 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id c24so1208608qkm.4
        for <tools@linux.kernel.org>; Thu, 21 Jul 2022 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aarNdSB2hnNcypayEm9Gz0jS10job8XjsztDigwcTKg=;
        b=f21EuMfQh+NfZksJKVpJeVX50/WUqQihR7nPoSemJNJpHalLrtcLxdurIhpjznsUzG
         rFHLUP19ldJ667ZhyLQd7RN3c1R0v6ohlvBfA5J4auUHAHHg+R1516Fb3FRaINHyf8Kn
         3ntCnh+NZ7v6b7f8ljwQ4wkhfG92tPWMwJBMA0A0vqaPhHRrBcxS2ZHGYIy1syMnMWfJ
         PfZ09c3z4o15D/Sq1pGAr64iI5vV5hu4vfiCemaDG8OPFAKYwvthsg6SGF3ASesm4gMk
         rUVduibNjie8+1sdaezc2LYkUH4LdyiLB5Up4Y7DAMxFpZCG1BZcsFrrjtQbKdldmAuF
         6+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aarNdSB2hnNcypayEm9Gz0jS10job8XjsztDigwcTKg=;
        b=W/qj2r0afi/my/H5oiRS969oIx31Ps3m+QW3S7fSQoZQvp7nOpEHc78fXNLfswfEdB
         p6x6Fk8rVT3UwNaBdEjHXJZkfSF7Z7c6nK83WasBnwsSR3X0KbUa8yfggW7PpKHmAs2/
         U1QBgoZlPdcuLchoXJcLnfZS1i6hwHUyrSJ6XO1rOh9zTNboCmJB/NSU1CSmQbVwDNwD
         IX6KDP9I0zSM1glj47LWGt6YRO5yMsm2NqyXygJTVlpkkJn4oVq3ZpTEGDYFZMQkw3Nn
         kVjFXg4vThyO+BFY2lqXqLlwpZOdTRy9BznEjwVk1YbT4jeuCXD96hSpLLhlBWWPb9xQ
         isqA==
X-Gm-Message-State: AJIora8hLfw2G7FFsgSkQ7x/c7FtKegWOjM2jnHKYRx6IrG77BBP+GJe
	osBw+XkwJiGkdtCighgcx7mFW3aplnsggA==
X-Google-Smtp-Source: AGRyM1tRLp0KPRn6jM/dBHXcECbqFrL/7NQX4eOwoZgNtUzPogQGyJRO0PMJO5TJYO2ofdl+hCqSBA==
X-Received: by 2002:a05:620a:29d5:b0:6b5:dc06:5762 with SMTP id s21-20020a05620a29d500b006b5dc065762mr16751441qkp.522.1658408904584;
        Thu, 21 Jul 2022 06:08:24 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id bl24-20020a05620a1a9800b006a6bb044740sm1384288qkb.66.2022.07.21.06.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:08:23 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oEVuh-001s4V-5d; Thu, 21 Jul 2022 10:08:23 -0300
Date: Thu, 21 Jul 2022 10:08:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Junio C Hamano <gitster@pobox.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220721130823.GU5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca>
 <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
 <20220721000256.GS5049@ziepe.ca>
 <CAMuHMdUB2F3BeaG2qH0jCDM87tJjzWhp=-Xx7xq+Y=oc76322Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUB2F3BeaG2qH0jCDM87tJjzWhp=-Xx7xq+Y=oc76322Q@mail.gmail.com>

On Thu, Jul 21, 2022 at 10:48:14AM +0200, Geert Uytterhoeven wrote:

> I'm wondering how this rebasing is working well with the "team"
> workflows where patches are being shuffled around with push/pull?

It is very much like the email workflow, except instead of doing
send-email to share with a reviewer it is done with push

So it isn't being used in a flow where people are building on top of
the work and are hurt by the rebase, the flow is the rebase is part of
the re-review cycle

Jason
